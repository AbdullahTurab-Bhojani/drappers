import 'package:freezed_annotation/freezed_annotation.dart';

part 'support_model.freezed.dart';
part 'support_model.g.dart';

@freezed
abstract class SupportResponse with _$SupportResponse {
  const factory SupportResponse({
    required bool isSuccess,
    @Default({}) Map<String, dynamic> data,
    required String message,
  }) = _SupportResponse;

  factory SupportResponse.fromJson(Map<String, dynamic> json) =>
      _$SupportResponseFromJson(json);
}
