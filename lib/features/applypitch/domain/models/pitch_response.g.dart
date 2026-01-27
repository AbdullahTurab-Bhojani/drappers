// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pitch_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PitchData _$PitchDataFromJson(Map<String, dynamic> json) => _PitchData(
  id: (json['id'] as num).toInt(),
  createdOn: DateTime.parse(json['createdOn'] as String),
  modifiedOn: DateTime.parse(json['modifiedOn'] as String),
  createdBy: json['createdBy'] as String,
  modifiedBy: json['modifiedBy'] as String,
  isDeleted: json['isDeleted'] as bool,
  ownerId: json['ownerId'] as String,
  fullName: json['fullName'] as String,
  startUpName: json['startUpName'] as String,
  email: json['email'] as String,
  link: json['link'] as String,
  address: json['address'] as String,
  status: json['status'] as String,
);

Map<String, dynamic> _$PitchDataToJson(_PitchData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdOn': instance.createdOn.toIso8601String(),
      'modifiedOn': instance.modifiedOn.toIso8601String(),
      'createdBy': instance.createdBy,
      'modifiedBy': instance.modifiedBy,
      'isDeleted': instance.isDeleted,
      'ownerId': instance.ownerId,
      'fullName': instance.fullName,
      'startUpName': instance.startUpName,
      'email': instance.email,
      'link': instance.link,
      'address': instance.address,
      'status': instance.status,
    };
