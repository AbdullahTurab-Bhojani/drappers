part of 'client.dart';

class AuthorizationInterceptor extends Interceptor {
  AuthorizationInterceptor(this.ref);

  final Ref ref;

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final response = err.response;

    if (err.type == DioExceptionType.connectionError ||
        err.type == DioExceptionType.unknown && err.error is SocketException) {
      $showMessage("No Internet Connection", isError: true);
    } else if (response?.statusCode == 401) {
      try {
        final response = await TokenRefreshManager.marketData.handleRefresh(
          dio: dio,
          error: err,
          ref: ref,
          refreshTokenCallback: () => _refreshMarketToken(ref),
          getNewToken: () => ref.read(localDataProvider).accessToken ?? '',
        );
        if (response != null) {
          handler.resolve(response);
          return;
        }
      } catch (e) {
        debugPrint('Token refresh failed: $e');
      }
    }
    handler.reject(err);
  }
}

class TokenRefreshManager {
  static final TokenRefreshManager marketData = TokenRefreshManager._internal();
  static final TokenRefreshManager marketDataNew =
      TokenRefreshManager._internal();

  TokenRefreshManager._internal();

  bool _isRefreshing = false;
  final List<_QueuedRequest> _pendingRequests = [];

  bool get isRefreshing => _isRefreshing;

  Future<Response<dynamic>?> handleRefresh({
    required Dio dio,
    required DioException error,
    required Ref ref,
    required Future<bool> Function() refreshTokenCallback,
    required String Function() getNewToken,
  }) async {
    debugPrint('🔄 Token refresh requested for: ${error.requestOptions.path}');

    if (_isRefreshing) {
      debugPrint('⏳ Token refresh already in progress, queuing request...');
      final completer = Completer<Response<dynamic>?>();
      _pendingRequests.add(
        _QueuedRequest(
          options: error.requestOptions,
          completer: completer,
          dio: dio,
          getNewToken: getNewToken,
        ),
      );
      return completer.future;
    }

    _isRefreshing = true;
    try {
      debugPrint('🔐 Starting token refresh...');
      final success = await refreshTokenCallback();

      if (success) {
        await Future.delayed(const Duration(milliseconds: 100));

        final newToken = getNewToken();
        debugPrint(
          '✅ Token refresh successful, new token: ${newToken.substring(0, math.min(20, newToken.length))}...',
        );
        final response = await _retryRequest(
          dio,
          error.requestOptions,
          newToken,
        );
        _processQueuedRequests();

        return response;
      } else {
        debugPrint('❌ Token refresh failed - callback returned false');
        _clearSessionAndLogout(ref);
        _failQueuedRequests(error);
        return null;
      }
    } catch (e, stackTrace) {
      debugPrint('❌ Token refresh exception: $e');
      debugPrint('Stack trace: $stackTrace');
      _clearSessionAndLogout(ref);
      _failQueuedRequests(error);
      return null;
    } finally {
      _isRefreshing = false;
    }
  }

  Future<Response<dynamic>> _retryRequest(
    Dio dio,
    RequestOptions requestOptions,
    String newToken,
  ) async {
    debugPrint(
      '🔁 Retrying request: ${requestOptions.method} ${requestOptions.path}',
    );
    final headers = Map<String, dynamic>.from(requestOptions.headers);
    headers[HttpHeaders.authorizationHeader] = 'Bearer $newToken';

    final options = Options(method: requestOptions.method, headers: headers);

    try {
      final response = await dio.request(
        requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options,
      );
      debugPrint('✅ Retry successful: ${response.statusCode}');
      return response;
    } catch (e) {
      debugPrint('❌ Retry failed: $e');
      rethrow;
    }
  }

  void _processQueuedRequests() {
    for (final request in _pendingRequests) {
      final newToken = request.getNewToken();
      _retryRequest(request.dio, request.options, newToken)
          .then((response) {
            request.completer.complete(response);
          })
          .catchError((error) {
            request.completer.completeError(error);
          });
    }
    _pendingRequests.clear();
  }

  void _failQueuedRequests(DioException originalError) {
    for (final request in _pendingRequests) {
      request.completer.completeError(originalError);
    }
    _pendingRequests.clear();
  }

  void _clearSessionAndLogout(Ref ref) {
    ref.read(localDataProvider).clearAllData();
    ref.read(localDataProvider).setLogout();
  }
}

class _QueuedRequest {
  final RequestOptions options;
  final Completer<Response<dynamic>?> completer;
  final Dio dio;
  final String Function() getNewToken;

  _QueuedRequest({
    required this.options,
    required this.completer,
    required this.dio,
    required this.getNewToken,
  });
}

class AuthorizationInterceptorMarket extends Interceptor {
  AuthorizationInterceptorMarket(this.ref);

  final Ref ref;

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final response = err.response;
    if (err.type == DioExceptionType.connectionError ||
        err.type == DioExceptionType.unknown && err.error is SocketException) {
      $showMessage("No Internet Connection", isError: true);
    } else if (response?.statusCode == 401) {
      try {
        final response = await TokenRefreshManager.marketData.handleRefresh(
          dio: dio,
          error: err,
          ref: ref,
          refreshTokenCallback: () => _refreshMarketToken(ref),
          getNewToken: () => ref.read(localDataProvider).accessToken ?? '',
        );
        if (response != null) {
          handler.resolve(response);
          return;
        }
      } catch (e) {
        debugPrint('Token refresh failed: $e');
      }
    }
    handler.reject(err);
  }
}

Future<bool> _refreshMarketToken(Ref ref) async {
  try {
    final authRepo = ref.read(authRepository1);
    final localData = ref.read(localDataProvider);

    final refreshToken = localData.refreshToken;
    if (refreshToken == null) {
      $showMessage("Session expired. Please login again.", isError: true);
      return false;
    }

    final refreshResponse = await authRepo.refreshToken(
      RefreshTokenModel(refreshToken: refreshToken),
    );

    localData.setAccessToken(refreshResponse.data.accessToken);
    localData.setRefreshToken(refreshResponse.data.refreshToken);

    return true;
  } catch (e) {
    $showMessage("Session expired. Please login again.", isError: true);
    return false;
  }
}

class AuthorizationInterceptorMarketNew extends Interceptor {
  AuthorizationInterceptorMarketNew(this.ref);

  final Ref ref;

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final response = err.response;
    if (err.type == DioExceptionType.connectionError ||
        err.type == DioExceptionType.unknown && err.error is SocketException) {
      $showMessage("No Internet Connection", isError: true);
    } else if (response?.statusCode == 401) {
      try {
        final response = await TokenRefreshManager.marketData.handleRefresh(
          dio: dio,
          error: err,
          ref: ref,
          refreshTokenCallback: () => _refreshMarketToken(ref),
          getNewToken: () => ref.read(localDataProvider).accessToken ?? '',
        );
        if (response != null) {
          handler.resolve(response);
          return;
        }
      } catch (e) {
        debugPrint('Token refresh failed: $e');
      }
    }
    handler.reject(err);
  }
}
