import 'package:freezed_annotation/freezed_annotation.dart';

part 'support_dto.freezed.dart';
part 'support_dto.g.dart';

@freezed
abstract class SupportRequestDto with _$SupportRequestDto {
  const factory SupportRequestDto({
    required String fullName,
    required String email,
    required String subject,
    required String message,
    required String imageUrl,
  }) = _SupportRequestDto;

  factory SupportRequestDto.fromJson(Map<String, dynamic> json) =>
      _$SupportRequestDtoFromJson(json);
}
