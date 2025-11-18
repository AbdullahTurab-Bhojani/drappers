part of '../../drappers.dart';

@freezed
abstract class AppLoadingState with _$AppLoadingState {
  const factory AppLoadingState() = _initialized;
  const factory AppLoadingState.loading() = LoadingState;
  const factory AppLoadingState.error() = ErrorState;
}
