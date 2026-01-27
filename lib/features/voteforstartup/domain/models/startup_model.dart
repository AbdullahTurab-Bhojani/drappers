import 'package:freezed_annotation/freezed_annotation.dart';

part 'startup_model.freezed.dart';
part 'startup_model.g.dart';

@freezed
abstract class StartupModel with _$StartupModel {
  const factory StartupModel({
    required int id,
    required String startupTitle,
    required String startupSubTitle,
    required String startupExpertise,
    required String founderName,
    required String founderTitle,
    required String founderPictureUrl,
    required String founded,
    required String teamSize,
    required String fundingStage,
    required String website,
    required String aboutStartup,
    required String videoLink,
    String? thumbnailUrl,
    String? featureEpisode,
    bool? isLikedByUser,
  }) = _StartupModel;

  factory StartupModel.fromJson(Map<String, dynamic> json) =>
      _$StartupModelFromJson(json);
}
