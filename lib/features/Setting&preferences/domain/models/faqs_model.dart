import 'package:freezed_annotation/freezed_annotation.dart';
part 'faqs_model.freezed.dart';
part 'faqs_model.g.dart';

@freezed
abstract class FaqModel with _$FaqModel {
  const factory FaqModel({
    required bool isSuccess,
    required List<FaqData> data,
    required String message,
  }) = _FaqModel;

  factory FaqModel.fromJson(Map<String, dynamic> json) =>
      _$FaqModelFromJson(json);
}

@freezed
abstract class FaqData with _$FaqData {
  const factory FaqData({
    required int id,
    required DateTime createdOn,
    required DateTime modifiedOn,
    required String createdBy,
    required String modifiedBy,
    required bool isDeleted,
    required String ownerId,
    required String question,
    required String answer,
  }) = _FaqData;

  factory FaqData.fromJson(Map<String, dynamic> json) =>
      _$FaqDataFromJson(json);
}
