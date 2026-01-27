// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SupportResponse _$SupportResponseFromJson(Map<String, dynamic> json) =>
    _SupportResponse(
      isSuccess: json['isSuccess'] as bool,
      data: json['data'] as Map<String, dynamic>? ?? const {},
      message: json['message'] as String,
    );

Map<String, dynamic> _$SupportResponseToJson(_SupportResponse instance) =>
    <String, dynamic>{
      'isSuccess': instance.isSuccess,
      'data': instance.data,
      'message': instance.message,
    };
