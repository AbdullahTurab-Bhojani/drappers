import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_update.freezed.dart';
part 'user_update.g.dart';

@freezed
abstract class UpdateUserDTO with _$UpdateUserDTO {
  const factory UpdateUserDTO({
    required String firstName,
    required String lastName,
    required String profileUrl,
    required String phoneNumber,
  }) = _UpdateUserDTO;

  factory UpdateUserDTO.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserDTOFromJson(json);
}
