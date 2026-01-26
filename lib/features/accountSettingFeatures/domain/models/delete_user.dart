import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_user.freezed.dart';
part 'delete_user.g.dart';

@freezed
abstract class DeleteUserResponse with _$DeleteUserResponse {
  const factory DeleteUserResponse({
    required bool isSuccess,
    required List<dynamic> data,
    required String message,
  }) = _DeleteUserResponse;

  factory DeleteUserResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteUserResponseFromJson(json);
}
