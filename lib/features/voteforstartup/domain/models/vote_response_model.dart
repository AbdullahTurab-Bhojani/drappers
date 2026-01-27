import 'package:freezed_annotation/freezed_annotation.dart';

part 'vote_response_model.freezed.dart';
part 'vote_response_model.g.dart';

@freezed
abstract class VoteResponse with _$VoteResponse {
  const factory VoteResponse({
    required bool isSuccess,
    VoteData? data, // nullable for "unlike" response
    required String message,
  }) = _VoteResponse;

  factory VoteResponse.fromJson(Map<String, dynamic> json) =>
      _$VoteResponseFromJson(json);
}

@freezed
abstract class VoteData with _$VoteData {
  const factory VoteData({
    required int id,
    required String createdOn,
    required String modifiedOn,
    required String createdBy,
    required String modifiedBy,
    required bool isDeleted,
    required String ownerId,
    required String startupId,
    required String userName,
    required bool voted,
    required String region,
  }) = _VoteData;

  factory VoteData.fromJson(Map<String, dynamic> json) =>
      _$VoteDataFromJson(json);
}
