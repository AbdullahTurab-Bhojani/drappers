import 'package:freezed_annotation/freezed_annotation.dart';
part 'reset_password_dto.freezed.dart';
part 'reset_password_dto.g.dart';

@freezed
abstract class ResetPasswordDTO with _$ResetPasswordDTO {
  const factory ResetPasswordDTO({
    @JsonKey(name: 'newPassword') required String newPassword,
    @JsonKey(name: 'temporary') required bool temporary,
  }) = _ResetPasswordDTO;

  factory ResetPasswordDTO.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordDTOFromJson(json);
}
