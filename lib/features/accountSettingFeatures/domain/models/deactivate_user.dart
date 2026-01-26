import 'package:freezed_annotation/freezed_annotation.dart';
part 'deactivate_user.freezed.dart';
part 'deactivate_user.g.dart';

@freezed
abstract class DeactivateUserResponse with _$DeactivateUserResponse {
  const factory DeactivateUserResponse({
    bool? success,
    required String message,
  }) = _DeactivateUserResponse;

  factory DeactivateUserResponse.fromJson(Map<String, dynamic> json) =>
      _$DeactivateUserResponseFromJson(json);
}
