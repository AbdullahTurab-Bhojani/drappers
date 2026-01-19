// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SignUpDto _$SignUpDtoFromJson(Map<String, dynamic> json) => _SignUpDto(
  fullName: json['fullName'] as String? ?? '',
  email: json['email'] as String? ?? '',
  phoneNumber: json['phoneNumber'] as String? ?? '',
  password: json['password'] as String? ?? '',
);

Map<String, dynamic> _$SignUpDtoToJson(_SignUpDto instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'password': instance.password,
    };
