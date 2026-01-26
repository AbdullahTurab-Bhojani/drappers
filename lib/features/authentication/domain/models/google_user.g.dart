// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GoogleSocialModel _$GoogleSocialModelFromJson(Map<String, dynamic> json) =>
    _GoogleSocialModel(
      isSuccess: json['isSuccess'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      data: json['data'] == null
          ? null
          : GoogleSocialData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GoogleSocialModelToJson(_GoogleSocialModel instance) =>
    <String, dynamic>{
      'isSuccess': instance.isSuccess,
      'message': instance.message,
      'data': instance.data,
    };

_GoogleSocialData _$GoogleSocialDataFromJson(Map<String, dynamic> json) =>
    _GoogleSocialData(
      accessToken: json['access_token'] as String? ?? '',
      refreshToken: json['refresh_token'] as String? ?? '',
      expiresIn: (json['expires_in'] as num?)?.toInt() ?? 0,
      refreshExpiresIn: (json['refresh_expires_in'] as num?)?.toInt() ?? 0,
      tokenType: json['token_type'] as String? ?? 'Bearer',
      user: json['user'] == null
          ? null
          : GoogleUser.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GoogleSocialDataToJson(_GoogleSocialData instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'expires_in': instance.expiresIn,
      'refresh_expires_in': instance.refreshExpiresIn,
      'token_type': instance.tokenType,
      'user': instance.user,
    };

_GoogleUser _$GoogleUserFromJson(Map<String, dynamic> json) => _GoogleUser(
  sub: json['sub'] as String? ?? '',
  emailVerified: json['email_verified'] as bool? ?? false,
  name: json['name'] as String? ?? '',
  preferredUsername: json['preferred_username'] as String? ?? '',
  givenName: json['given_name'] as String? ?? '',
  familyName: json['family_name'] as String? ?? '',
  email: json['email'] as String? ?? '',
);

Map<String, dynamic> _$GoogleUserToJson(_GoogleUser instance) =>
    <String, dynamic>{
      'sub': instance.sub,
      'email_verified': instance.emailVerified,
      'name': instance.name,
      'preferred_username': instance.preferredUsername,
      'given_name': instance.givenName,
      'family_name': instance.familyName,
      'email': instance.email,
    };
