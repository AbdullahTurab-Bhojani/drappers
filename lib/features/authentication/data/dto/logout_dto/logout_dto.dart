import 'package:freezed_annotation/freezed_annotation.dart';

part 'logout_dto.freezed.dart';
part 'logout_dto.g.dart';

@freezed
abstract class LogoutDTO with _$LogoutDTO {
  const factory LogoutDTO({
    @JsonKey(name: 'refreshToken') required String refreshToken,
  }) = _LogoutDTO;

  factory LogoutDTO.fromJson(Map<String, dynamic> json) =>
      _$LogoutDTOFromJson(json);
}
