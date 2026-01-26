// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeleteUserResponse _$DeleteUserResponseFromJson(Map<String, dynamic> json) =>
    _DeleteUserResponse(
      isSuccess: json['isSuccess'] as bool,
      data: json['data'] as List<dynamic>,
      message: json['message'] as String,
    );

Map<String, dynamic> _$DeleteUserResponseToJson(_DeleteUserResponse instance) =>
    <String, dynamic>{
      'isSuccess': instance.isSuccess,
      'data': instance.data,
      'message': instance.message,
    };
