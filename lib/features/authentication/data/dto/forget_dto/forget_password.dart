import 'package:freezed_annotation/freezed_annotation.dart';
part 'forget_password.freezed.dart';
part 'forget_password.g.dart';

@freezed
abstract class ForgetPasswordDTO with _$ForgetPasswordDTO {
  const factory ForgetPasswordDTO({
    @JsonKey(name: 'email') required String email,
  }) = _ForgetPasswordDTO;

  factory ForgetPasswordDTO.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordDTOFromJson(json);
}
