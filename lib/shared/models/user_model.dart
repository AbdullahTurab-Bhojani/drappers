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
    required String fullName,
    required String email,
    required String phoneNumber,
    required String password,
    required bool isVerified,
    required int createdOn,
    required bool isDeleted,
    @JsonKey(name: '_id') required String idMongo,
    required int id,
    String? profilePicture, 
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
