import 'package:freezed_annotation/freezed_annotation.dart';
part 'refresh_token_response.freezed.dart';
part 'refresh_token_response.g.dart';

@freezed
abstract class TokenResponseModel with _$TokenResponseModel {
  const factory TokenResponseModel({
    required bool isSuccess,
    required TokenData data,
    required String message,
  }) = _TokenResponseModel;

  factory TokenResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TokenResponseModelFromJson(json);
}

@freezed
abstract class TokenData with _$TokenData {
  const factory TokenData({
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'refresh_token') required String refreshToken,
    @JsonKey(name: 'expires_in') required int expiresIn,
    @JsonKey(name: 'refresh_expires_in') required int refreshExpiresIn,
    @JsonKey(name: 'token_type') required String tokenType,
  }) = _TokenData;

  factory TokenData.fromJson(Map<String, dynamic> json) =>
      _$TokenDataFromJson(json);
}
