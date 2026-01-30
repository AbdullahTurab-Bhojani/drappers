// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_token_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TokenResponseModel _$TokenResponseModelFromJson(Map<String, dynamic> json) =>
    _TokenResponseModel(
      isSuccess: json['isSuccess'] as bool,
      data: TokenData.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String,
    );

Map<String, dynamic> _$TokenResponseModelToJson(_TokenResponseModel instance) =>
    <String, dynamic>{
      'isSuccess': instance.isSuccess,
      'data': instance.data,
      'message': instance.message,
    };

_TokenData _$TokenDataFromJson(Map<String, dynamic> json) => _TokenData(
  accessToken: json['access_token'] as String,
  refreshToken: json['refresh_token'] as String,
  expiresIn: (json['expires_in'] as num).toInt(),
  refreshExpiresIn: (json['refresh_expires_in'] as num).toInt(),
  tokenType: json['token_type'] as String,
);

Map<String, dynamic> _$TokenDataToJson(_TokenData instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'expires_in': instance.expiresIn,
      'refresh_expires_in': instance.refreshExpiresIn,
      'token_type': instance.tokenType,
    };
