// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pitch_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PitchDto _$PitchDtoFromJson(Map<String, dynamic> json) => _PitchDto(
  address: json['address'] as String,
  fullName: json['fullName'] as String,
  startUpName: json['startUpName'] as String,
  email: json['email'] as String,
  link: json['link'] as String,
);

Map<String, dynamic> _$PitchDtoToJson(_PitchDto instance) => <String, dynamic>{
  'address': instance.address,
  'fullName': instance.fullName,
  'startUpName': instance.startUpName,
  'email': instance.email,
  'link': instance.link,
};
