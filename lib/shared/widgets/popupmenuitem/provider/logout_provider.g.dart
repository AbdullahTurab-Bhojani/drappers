// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logout_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LogoutProvider)
const logoutProviderProvider = LogoutProviderProvider._();

final class LogoutProviderProvider
    extends $NotifierProvider<LogoutProvider, AppLoadingState> {
  const LogoutProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'logoutProviderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$logoutProviderHash();

  @$internal
  @override
  LogoutProvider create() => LogoutProvider();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppLoadingState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppLoadingState>(value),
    );
  }
}

String _$logoutProviderHash() => r'29a3b38bb0baa36b3f7bf100837df91d3a253a8e';

abstract class _$LogoutProvider extends $Notifier<AppLoadingState> {
  AppLoadingState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AppLoadingState, AppLoadingState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AppLoadingState, AppLoadingState>,
              AppLoadingState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
