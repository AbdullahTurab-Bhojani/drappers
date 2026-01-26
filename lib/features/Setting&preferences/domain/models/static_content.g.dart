// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'static_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StaticContent _$StaticContentFromJson(Map<String, dynamic> json) =>
    _StaticContent(
      isSuccess: json['isSuccess'] as bool,
      data: PolicyData.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String,
    );

Map<String, dynamic> _$StaticContentToJson(_StaticContent instance) =>
    <String, dynamic>{
      'isSuccess': instance.isSuccess,
      'data': instance.data,
      'message': instance.message,
    };

_PolicyData _$PolicyDataFromJson(Map<String, dynamic> json) => _PolicyData(
  id: (json['id'] as num).toInt(),
  createdOn: DateTime.parse(json['createdOn'] as String),
  modifiedOn: DateTime.parse(json['modifiedOn'] as String),
  createdBy: json['createdBy'] as String,
  modifiedBy: json['modifiedBy'] as String,
  isDeleted: json['isDeleted'] as bool,
  ownerId: json['ownerId'] as String,
  type: json['type'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$PolicyDataToJson(_PolicyData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdOn': instance.createdOn.toIso8601String(),
      'modifiedOn': instance.modifiedOn.toIso8601String(),
      'createdBy': instance.createdBy,
      'modifiedBy': instance.modifiedBy,
      'isDeleted': instance.isDeleted,
      'ownerId': instance.ownerId,
      'type': instance.type,
      'value': instance.value,
    };
