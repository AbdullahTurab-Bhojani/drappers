import 'package:freezed_annotation/freezed_annotation.dart';

part 'pitch_response.freezed.dart';
part 'pitch_response.g.dart';

@freezed
abstract class PitchResponseModel with _$PitchResponseModel {
  const factory PitchResponseModel({
    required bool isSuccess,
    required PitchData data,
    required String message,
  }) = _PitchResponseModel;

  factory PitchResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PitchResponseModelFromJson(json);
}

@freezed
abstract class PitchData with _$PitchData {
  const factory PitchData({
    required int id,
    required DateTime createdOn,
    required DateTime modifiedOn,
    required String createdBy,
    required String modifiedBy,
    required bool isDeleted,
    required String ownerId,
    required String fullName,
    required String startUpName,
    required String email,
    required String link,
    required String address,
    required String status,
  }) = _PitchData;

  factory PitchData.fromJson(Map<String, dynamic> json) =>
      _$PitchDataFromJson(json);
}
