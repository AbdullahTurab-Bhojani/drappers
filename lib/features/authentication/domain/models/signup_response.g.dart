// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SignUpResponseDto _$SignUpResponseDtoFromJson(Map<String, dynamic> json) =>
    _SignUpResponseDto(
      isSuccess: json['isSuccess'] as bool,
      data: json['data'] as Map<String, dynamic>? ?? const {},
      message: json['message'] as String,
    );

Map<String, dynamic> _$SignUpResponseDtoToJson(_SignUpResponseDto instance) =>
    <String, dynamic>{
      'isSuccess': instance.isSuccess,
      'data': instance.data,
      'message': instance.message,
    };
