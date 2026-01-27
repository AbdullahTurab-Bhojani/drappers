// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SupportRequestDto _$SupportRequestDtoFromJson(Map<String, dynamic> json) =>
    _SupportRequestDto(
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      subject: json['subject'] as String,
      message: json['message'] as String,
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$SupportRequestDtoToJson(_SupportRequestDto instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'email': instance.email,
      'subject': instance.subject,
      'message': instance.message,
      'imageUrl': instance.imageUrl,
    };
