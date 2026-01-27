import 'package:freezed_annotation/freezed_annotation.dart';
import 'startup_model.dart';

part 'startup_response_model.freezed.dart';
part 'startup_response_model.g.dart';

@freezed
abstract class StartupResponse with _$StartupResponse {
  const factory StartupResponse({
    required bool isSuccess,
    required StartupModel? data,
    required String message,
  }) = _StartupResponse;

  factory StartupResponse.fromJson(Map<String, dynamic> json) =>
      _$StartupResponseFromJson(json);
}

@freezed
abstract class StartupListResponse with _$StartupListResponse {
  const factory StartupListResponse({
    required bool isSuccess,
    required List<StartupModel>? data,
    required String message,
  }) = _StartupListResponse;

  factory StartupListResponse.fromJson(Map<String, dynamic> json) =>
      _$StartupListResponseFromJson(json);
}
