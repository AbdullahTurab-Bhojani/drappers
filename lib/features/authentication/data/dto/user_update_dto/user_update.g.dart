// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_update.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateUserDTO _$UpdateUserDTOFromJson(Map<String, dynamic> json) =>
    _UpdateUserDTO(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      profileUrl: json['profileUrl'] as String,
    );

Map<String, dynamic> _$UpdateUserDTOToJson(_UpdateUserDTO instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'profileUrl': instance.profileUrl,
    };
