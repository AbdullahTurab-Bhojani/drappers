import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_response.freezed.dart';
part 'login_response.g.dart';

@freezed
abstract class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    @JsonKey(name: 'isSuccess') required bool isSuccess,
    required LoginData data,
    required String message,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@freezed
abstract class LoginData with _$LoginData {
  const factory LoginData({
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'expires_in') required int expiresIn,
    @JsonKey(name: 'refresh_expires_in') required int refreshExpiresIn,
    @JsonKey(name: 'refresh_token') required String refreshToken,
    @JsonKey(name: 'token_type') required String tokenType,
    @JsonKey(name: 'id_token') required String idToken,
    @JsonKey(name: 'not-before-policy') required int notBeforePolicy,
    @JsonKey(name: 'session_state') required String sessionState,
    required String scope,
  }) = _LoginData;

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);
}
