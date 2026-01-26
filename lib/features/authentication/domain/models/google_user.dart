import 'package:freezed_annotation/freezed_annotation.dart';

part 'google_user.freezed.dart';
part 'google_user.g.dart';

@freezed
abstract class GoogleSocialModel with _$GoogleSocialModel {
  const factory GoogleSocialModel({
    @Default(false) bool isSuccess,
    @Default('') String message,

    // Tokens
    @JsonKey(name: 'data') GoogleSocialData? data,
  }) = _GoogleSocialModel;

  factory GoogleSocialModel.fromJson(Map<String, dynamic> json) =>
      _$GoogleSocialModelFromJson(json);
}

@freezed
abstract class GoogleSocialData with _$GoogleSocialData {
  const factory GoogleSocialData({
    @JsonKey(name: 'access_token') @Default('') String accessToken,
    @JsonKey(name: 'refresh_token') @Default('') String refreshToken,
    @JsonKey(name: 'expires_in') @Default(0) int expiresIn,
    @JsonKey(name: 'refresh_expires_in') @Default(0) int refreshExpiresIn,
    @JsonKey(name: 'token_type') @Default('Bearer') String tokenType,

    // User object
    GoogleUser? user,
  }) = _GoogleSocialData;

  factory GoogleSocialData.fromJson(Map<String, dynamic> json) =>
      _$GoogleSocialDataFromJson(json);
}

@freezed
abstract class GoogleUser with _$GoogleUser {
  const factory GoogleUser({
    @Default('') String sub,
    @JsonKey(name: 'email_verified') @Default(false) bool emailVerified,
    @Default('') String name,
    @JsonKey(name: 'preferred_username') @Default('') String preferredUsername,
    @JsonKey(name: 'given_name') @Default('') String givenName,
    @JsonKey(name: 'family_name') @Default('') String familyName,
    @Default('') String email,
  }) = _GoogleUser;

  factory GoogleUser.fromJson(Map<String, dynamic> json) =>
      _$GoogleUserFromJson(json);
}
