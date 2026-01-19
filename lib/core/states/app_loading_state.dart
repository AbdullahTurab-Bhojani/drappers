part of '../../drappers.dart';

@freezed
class AppLoadingState with _$AppLoadingState {
  const factory AppLoadingState.initial() = _InitialState;

  const factory AppLoadingState.loading() = _LoadingState;

  const factory AppLoadingState.success(dynamic data) = _SuccessState;

  const factory AppLoadingState.error([String? message]) = _ErrorState;
}

/// Extension to add convenient state-check getters
extension AppLoadingStateX on AppLoadingState {
  bool get isLoading => maybeWhen(loading: () => true, orElse: () => false);

  bool get isSuccess => maybeWhen(success: (_) => true, orElse: () => false);

  bool get isError => maybeWhen(error: (_) => true, orElse: () => false);

  dynamic get data => maybeWhen(success: (d) => d, orElse: () => null);

  String? get message => maybeWhen(
    error: (msg) => msg,
    success: (d) => d?.toString(),
    orElse: () => null,
  );
}
