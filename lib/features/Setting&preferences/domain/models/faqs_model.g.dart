// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faqs_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FaqModel _$FaqModelFromJson(Map<String, dynamic> json) => _FaqModel(
  isSuccess: json['isSuccess'] as bool,
  data: (json['data'] as List<dynamic>)
      .map((e) => FaqData.fromJson(e as Map<String, dynamic>))
      .toList(),
  message: json['message'] as String,
);

Map<String, dynamic> _$FaqModelToJson(_FaqModel instance) => <String, dynamic>{
  'isSuccess': instance.isSuccess,
  'data': instance.data,
  'message': instance.message,
};

_FaqData _$FaqDataFromJson(Map<String, dynamic> json) => _FaqData(
  id: (json['id'] as num).toInt(),
  createdOn: DateTime.parse(json['createdOn'] as String),
  modifiedOn: DateTime.parse(json['modifiedOn'] as String),
  createdBy: json['createdBy'] as String,
  modifiedBy: json['modifiedBy'] as String,
  isDeleted: json['isDeleted'] as bool,
  ownerId: json['ownerId'] as String,
  question: json['question'] as String,
  answer: json['answer'] as String,
);

Map<String, dynamic> _$FaqDataToJson(_FaqData instance) => <String, dynamic>{
  'id': instance.id,
  'createdOn': instance.createdOn.toIso8601String(),
  'modifiedOn': instance.modifiedOn.toIso8601String(),
  'createdBy': instance.createdBy,
  'modifiedBy': instance.modifiedBy,
  'isDeleted': instance.isDeleted,
  'ownerId': instance.ownerId,
  'question': instance.question,
  'answer': instance.answer,
};
