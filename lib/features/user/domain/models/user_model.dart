import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required bool isSuccess,
    required UserData data,
    required String message,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

@freezed
abstract class UserData with _$UserData {
  const factory UserData({
    required int id,
    required String createdOn,
    required String modifiedOn,
    required String createdBy,
    required String modifiedBy,
    required bool isDeleted,
    String? ownerId,
    String? firstName,
    String? lastName,
    required String fullName,
    required String email,
    required String phoneNumber,
    String? password,
    required String keycloakUserId,
    String? type,
    required List<dynamic> addresses,
    required List<dynamic> recentlySessions,
    required List<dynamic> allSessions,
    required int totalSessions,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
