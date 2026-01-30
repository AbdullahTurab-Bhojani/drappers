import 'package:freezed_annotation/freezed_annotation.dart';

part 'refreshtoken.freezed.dart';
part 'refreshtoken.g.dart';

@freezed
abstract class RefreshTokenModel with _$RefreshTokenModel {
  const factory RefreshTokenModel({
    @JsonKey(name: 'refresh_token') required String refreshToken,
  }) = _RefreshTokenModel;

  factory RefreshTokenModel.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenModelFromJson(json);
}
