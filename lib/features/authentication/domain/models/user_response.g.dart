// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateUserResponse _$UpdateUserResponseFromJson(Map<String, dynamic> json) =>
    _UpdateUserResponse(
      isSuccess: json['isSuccess'] as bool,
      data: json['data'] == null
          ? null
          : UpdateUserData.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String,
    );

Map<String, dynamic> _$UpdateUserResponseToJson(_UpdateUserResponse instance) =>
    <String, dynamic>{
      'isSuccess': instance.isSuccess,
      'data': instance.data,
      'message': instance.message,
    };

_UpdateUserData _$UpdateUserDataFromJson(Map<String, dynamic> json) =>
    _UpdateUserData(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      modifiedOn: DateTime.parse(json['modifiedOn'] as String),
    );

Map<String, dynamic> _$UpdateUserDataToJson(_UpdateUserData instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'modifiedOn': instance.modifiedOn.toIso8601String(),
    };
