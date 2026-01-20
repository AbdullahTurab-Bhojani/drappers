// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) =>
    _BaseResponse(
      isSuccess: json['isSuccess'] as bool,
      data: json['data'] as Map<String, dynamic>,
      message: json['message'] as String,
    );

Map<String, dynamic> _$BaseResponseToJson(_BaseResponse instance) =>
    <String, dynamic>{
      'isSuccess': instance.isSuccess,
      'data': instance.data,
      'message': instance.message,
    };
