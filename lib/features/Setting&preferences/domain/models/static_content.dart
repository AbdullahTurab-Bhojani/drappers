import 'package:freezed_annotation/freezed_annotation.dart';

part 'static_content.freezed.dart';
part 'static_content.g.dart';

@freezed
abstract class StaticContent with _$StaticContent {
  const factory StaticContent({
    required bool isSuccess,
    required PolicyData data,
    required String message,
  }) = _StaticContent;

  factory StaticContent.fromJson(Map<String, dynamic> json) =>
      _$StaticContentFromJson(json);
}

@freezed
abstract class PolicyData with _$PolicyData {
  const factory PolicyData({
    required int id,
    required DateTime createdOn,
    required DateTime modifiedOn,
    required String createdBy,
    required String modifiedBy,
    required bool isDeleted,
    required String ownerId,
    required String type,
    required String value,
  }) = _PolicyData;

  factory PolicyData.fromJson(Map<String, dynamic> json) =>
      _$PolicyDataFromJson(json);
}
