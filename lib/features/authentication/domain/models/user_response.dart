import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_response.freezed.dart';
part 'user_response.g.dart';

@freezed
abstract class UpdateUserResponse with _$UpdateUserResponse {
  const factory UpdateUserResponse({
    required bool isSuccess,
    required UpdateUserData? data,
    required String message,
  }) = _UpdateUserResponse;

  factory UpdateUserResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserResponseFromJson(json);
}

@freezed
abstract class UpdateUserData with _$UpdateUserData {
  const factory UpdateUserData({
    required String firstName,
    required String lastName,
    required DateTime modifiedOn,
  }) = _UpdateUserData;

  factory UpdateUserData.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserDataFromJson(json);
}
