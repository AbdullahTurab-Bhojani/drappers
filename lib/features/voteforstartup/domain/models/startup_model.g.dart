// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'startup_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StartupModel _$StartupModelFromJson(Map<String, dynamic> json) =>
    _StartupModel(
      id: (json['id'] as num).toInt(),
      startupTitle: json['startupTitle'] as String,
      startupSubTitle: json['startupSubTitle'] as String,
      startupExpertise: json['startupExpertise'] as String,
      founderName: json['founderName'] as String,
      founderTitle: json['founderTitle'] as String,
      founderPictureUrl: json['founderPictureUrl'] as String,
      founded: json['founded'] as String,
      teamSize: json['teamSize'] as String,
      fundingStage: json['fundingStage'] as String,
      website: json['website'] as String,
      aboutStartup: json['aboutStartup'] as String,
      videoLink: json['videoLink'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      featureEpisode: json['featureEpisode'] as String?,
      isLikedByUser: json['isLikedByUser'] as bool?,
    );

Map<String, dynamic> _$StartupModelToJson(_StartupModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startupTitle': instance.startupTitle,
      'startupSubTitle': instance.startupSubTitle,
      'startupExpertise': instance.startupExpertise,
      'founderName': instance.founderName,
      'founderTitle': instance.founderTitle,
      'founderPictureUrl': instance.founderPictureUrl,
      'founded': instance.founded,
      'teamSize': instance.teamSize,
      'fundingStage': instance.fundingStage,
      'website': instance.website,
      'aboutStartup': instance.aboutStartup,
      'videoLink': instance.videoLink,
      'thumbnailUrl': instance.thumbnailUrl,
      'featureEpisode': instance.featureEpisode,
      'isLikedByUser': instance.isLikedByUser,
    };
