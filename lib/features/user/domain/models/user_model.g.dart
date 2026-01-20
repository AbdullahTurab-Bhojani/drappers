// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  isSuccess: json['isSuccess'] as bool? ?? false,
  data: json['data'] == null
      ? null
      : UserData.fromJson(json['data'] as Map<String, dynamic>),
  message: json['message'] as String? ?? '',
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'isSuccess': instance.isSuccess,
      'data': instance.data,
      'message': instance.message,
    };

_UserData _$UserDataFromJson(Map<String, dynamic> json) => _UserData(
  id: (json['id'] as num?)?.toInt() ?? 0,
  createdOn: json['createdOn'] as String?,
  modifiedOn: json['modifiedOn'] as String?,
  createdBy: json['createdBy'] as String?,
  modifiedBy: json['modifiedBy'] as String?,
  isDeleted: json['isDeleted'] as bool? ?? false,
  ownerId: json['ownerId'] as String?,
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  fullName: json['fullName'] as String?,
  email: json['email'] as String?,
  phoneNumber: json['phoneNumber'] as String?,
  password: json['password'] as String?,
  keycloakUserId: json['keycloakUserId'] as String?,
  type: json['type'] as String?,
  addresses: json['addresses'] as List<dynamic>? ?? const [],
  recentlySessions: json['recentlySessions'] as List<dynamic>? ?? const [],
  allSessions: json['allSessions'] as List<dynamic>? ?? const [],
  totalSessions: (json['totalSessions'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$UserDataToJson(_UserData instance) => <String, dynamic>{
  'id': instance.id,
  'createdOn': instance.createdOn,
  'modifiedOn': instance.modifiedOn,
  'createdBy': instance.createdBy,
  'modifiedBy': instance.modifiedBy,
  'isDeleted': instance.isDeleted,
  'ownerId': instance.ownerId,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'fullName': instance.fullName,
  'email': instance.email,
  'phoneNumber': instance.phoneNumber,
  'password': instance.password,
  'keycloakUserId': instance.keycloakUserId,
  'type': instance.type,
  'addresses': instance.addresses,
  'recentlySessions': instance.recentlySessions,
  'allSessions': instance.allSessions,
  'totalSessions': instance.totalSessions,
};
