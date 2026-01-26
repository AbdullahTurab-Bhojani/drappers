import 'package:freezed_annotation/freezed_annotation.dart';
part 'pitch_dto.freezed.dart';
part 'pitch_dto.g.dart';

@freezed
abstract class PitchDto with _$PitchDto {
  const factory PitchDto({
    required String address,
    required String fullName,
    required String startUpName,
    required String email,
    required String link,
  }) = _PitchDto;

  factory PitchDto.fromJson(Map<String, dynamic> json) =>
      _$PitchDtoFromJson(json);
}
