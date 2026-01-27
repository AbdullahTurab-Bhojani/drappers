// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'startup_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StartupResponse _$StartupResponseFromJson(Map<String, dynamic> json) =>
    _StartupResponse(
      isSuccess: json['isSuccess'] as bool,
      data: json['data'] == null
          ? null
          : StartupModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String,
    );

Map<String, dynamic> _$StartupResponseToJson(_StartupResponse instance) =>
    <String, dynamic>{
      'isSuccess': instance.isSuccess,
      'data': instance.data,
      'message': instance.message,
    };

_StartupListResponse _$StartupListResponseFromJson(Map<String, dynamic> json) =>
    _StartupListResponse(
      isSuccess: json['isSuccess'] as bool,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => StartupModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$StartupListResponseToJson(
  _StartupListResponse instance,
) => <String, dynamic>{
  'isSuccess': instance.isSuccess,
  'data': instance.data,
  'message': instance.message,
};
