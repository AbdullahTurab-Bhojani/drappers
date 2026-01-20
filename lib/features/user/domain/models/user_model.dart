import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    @Default(false) bool isSuccess,
    UserData? data,
    @Default('') String message,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

@freezed
abstract class UserData with _$UserData {
  const factory UserData({
    @Default(0) int id,
    String? createdOn,
    String? modifiedOn,
    String? createdBy,
    String? modifiedBy,
    @Default(false) bool isDeleted,
    String? ownerId,
    String? firstName,
    String? lastName,
    String? fullName,
    String? email,
    String? phoneNumber,
    String? password,
    String? keycloakUserId,
    String? type,
    @Default([]) List<dynamic> addresses,
    @Default([]) List<dynamic> recentlySessions,
    @Default([]) List<dynamic> allSessions,
    @Default(0) int totalSessions,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
