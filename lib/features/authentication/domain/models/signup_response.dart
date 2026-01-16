import 'package:freezed_annotation/freezed_annotation.dart';
part 'signup_response.freezed.dart';
part 'signup_response.g.dart';

@freezed
abstract class SignUpResponseDto with _$SignUpResponseDto {
  const factory SignUpResponseDto({
    required bool isSuccess,
    @Default({}) Map<String, dynamic> data,
    required String message,
  }) = _SignUpResponseDto;

  factory SignUpResponseDto.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseDtoFromJson(json);
}
