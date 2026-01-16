// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SocialDTO _$SocialDTOFromJson(Map<String, dynamic> json) => _SocialDTO(
  subjectToken: json['subject_token'] as String,
  subjectIssuer: json['subject_issuer'] as String,
  email: json['email'] as String,
);

Map<String, dynamic> _$SocialDTOToJson(_SocialDTO instance) =>
    <String, dynamic>{
      'subject_token': instance.subjectToken,
      'subject_issuer': instance.subjectIssuer,
      'email': instance.email,
    };
