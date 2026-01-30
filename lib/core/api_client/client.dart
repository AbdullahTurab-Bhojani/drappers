import 'dart:async';
import 'dart:io';
import 'dart:math' as math;
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart' show kDebugMode, debugPrint, Uint8List;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../drappers.dart';
import '../../features/authentication/data/dto/refresh_token_dto/refreshtoken.dart';
import '../../features/authentication/domain/repository/auth_repository.dart';
import '../local/domain/repositories/local_storage_repository.dart';
import 'dio_custom_service.dart';

part 'interceptors.dart';
part 'pretty_logger.dart';

/// Standard client with JSON
final client = Provider.family<Dio, String>((ref, baseUrl) {
  const timeOut = Duration(seconds: 40);
  return Dio(
      BaseOptions(
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        baseUrl: baseUrl,
        connectTimeout: timeOut,
        receiveTimeout: timeOut,
      ),
    )
    ..interceptors.addAll([
      AuthorizationInterceptor(ref),
      if (kDebugMode)
        PrettyDioLogger(
          requestBody: kDebugMode,
          requestHeader: kDebugMode,
          responseBody: kDebugMode,
        ),
    ])
    ..httpClientAdapter = CustomClientAdapter(ref);
});

/// Multipart client
final multipartClient = Provider<Dio>((ref) {
  const timeOut = Duration(seconds: 120000);
  return Dio(
      BaseOptions(
        headers: {
          "Content-Type": "multipart/form-data",
          "Accept": "application/json",
        },
        baseUrl: 'https://drapper.neksoft.com/webapi-drapper',
        connectTimeout: timeOut,
        receiveTimeout: timeOut,
      ),
    )
    ..interceptors.addAll([
      AuthorizationInterceptor(ref),
      if (kDebugMode)
        PrettyDioLogger(
          requestBody: kDebugMode,
          requestHeader: kDebugMode,
          responseBody: kDebugMode,
        ),
    ])
    ..httpClientAdapter = CustomClientAdapter(ref);
});

/// Refresh client for token-only calls
final refreshClient = Provider.family<Dio, String>((ref, baseUrl) {
  const timeOut = Duration(seconds: 40);
  return Dio(
      BaseOptions(
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        baseUrl: baseUrl,
        connectTimeout: timeOut,
        receiveTimeout: timeOut,
      ),
    )
    ..interceptors.addAll([
      AuthorizationInterceptor(ref),
      if (kDebugMode)
        PrettyDioLogger(
          requestBody: kDebugMode,
          requestHeader: kDebugMode,
          responseBody: kDebugMode,
        ),
    ])
    ..httpClientAdapter = RefreshClientAdapter(ref);
});

/// Custom Dio adapter that automatically adds the access token
class CustomClientAdapter extends IOHttpClientAdapter {
  final Ref ref;
  final bool isStripe;

  CustomClientAdapter(this.ref, {this.isStripe = false});

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    final token = ref.read(localDataProvider).accessToken;
    if (token != null) {
      options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
    }
    return super.fetch(options, requestStream, cancelFuture);
  }
}

class RefreshClientAdapter extends IOHttpClientAdapter {
  final Ref ref;
  final bool isStripe;

  RefreshClientAdapter(this.ref, {this.isStripe = false});

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    final token = ref.read(localDataProvider).refreshToken;
    if (token != null) {
      options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
    }
    return super.fetch(options, requestStream, cancelFuture);
  }
}
