// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ResetPasswordDTO _$ResetPasswordDTOFromJson(Map<String, dynamic> json) =>
    _ResetPasswordDTO(
      newPassword: json['newPassword'] as String,
      temporary: json['temporary'] as bool,
    );

Map<String, dynamic> _$ResetPasswordDTOToJson(_ResetPasswordDTO instance) =>
    <String, dynamic>{
      'newPassword': instance.newPassword,
      'temporary': instance.temporary,
    };
