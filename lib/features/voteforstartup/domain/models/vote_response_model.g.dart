// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vote_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VoteResponse _$VoteResponseFromJson(Map<String, dynamic> json) =>
    _VoteResponse(
      isSuccess: json['isSuccess'] as bool,
      data: json['data'] == null
          ? null
          : VoteData.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String,
    );

Map<String, dynamic> _$VoteResponseToJson(_VoteResponse instance) =>
    <String, dynamic>{
      'isSuccess': instance.isSuccess,
      'data': instance.data,
      'message': instance.message,
    };

_VoteData _$VoteDataFromJson(Map<String, dynamic> json) => _VoteData(
  id: (json['id'] as num).toInt(),
  createdOn: json['createdOn'] as String,
  modifiedOn: json['modifiedOn'] as String,
  createdBy: json['createdBy'] as String,
  modifiedBy: json['modifiedBy'] as String,
  isDeleted: json['isDeleted'] as bool,
  ownerId: json['ownerId'] as String,
  startupId: json['startupId'] as String,
  userName: json['userName'] as String,
  voted: json['voted'] as bool,
  region: json['region'] as String,
);

Map<String, dynamic> _$VoteDataToJson(_VoteData instance) => <String, dynamic>{
  'id': instance.id,
  'createdOn': instance.createdOn,
  'modifiedOn': instance.modifiedOn,
  'createdBy': instance.createdBy,
  'modifiedBy': instance.modifiedBy,
  'isDeleted': instance.isDeleted,
  'ownerId': instance.ownerId,
  'startupId': instance.startupId,
  'userName': instance.userName,
  'voted': instance.voted,
  'region': instance.region,
};
