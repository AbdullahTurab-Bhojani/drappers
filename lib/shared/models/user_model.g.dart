// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
      isSuccess: json['isSuccess'] as bool,
      data: UserData.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String,
    );

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'isSuccess': instance.isSuccess,
      'data': instance.data,
      'message': instance.message,
    };

_UserData _$UserDataFromJson(Map<String, dynamic> json) => _UserData(
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      password: json['password'] as String,
      isVerified: json['isVerified'] as bool,
      createdOn: (json['createdOn'] as num).toInt(),
      isDeleted: json['isDeleted'] as bool,
      idMongo: json['_id'] as String,
      id: (json['id'] as num).toInt(),
      profilePicture: json['profilePicture'] as String?,
    );

Map<String, dynamic> _$UserDataToJson(_UserData instance) => <String, dynamic>{
      'fullName': instance.fullName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'password': instance.password,
      'isVerified': instance.isVerified,
      'createdOn': instance.createdOn,
      'isDeleted': instance.isDeleted,
      '_id': instance.idMongo,
      'id': instance.id,
      'profilePicture': instance.profilePicture,
    };
