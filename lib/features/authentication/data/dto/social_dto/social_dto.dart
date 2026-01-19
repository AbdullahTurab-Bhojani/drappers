import 'package:freezed_annotation/freezed_annotation.dart';
part 'social_dto.freezed.dart';
part 'social_dto.g.dart';

@freezed
abstract class SocialDTO with _$SocialDTO {
  const factory SocialDTO({
    @JsonKey(name: 'subject_token') required String subjectToken,
    @JsonKey(name: 'subject_issuer') required String subjectIssuer,
    @JsonKey(name: 'email') required String email,
  }) = _SocialDTO;

  factory SocialDTO.fromJson(Map<String, dynamic> json) =>
      _$SocialDTOFromJson(json);
}
