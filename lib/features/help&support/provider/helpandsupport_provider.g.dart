// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'helpandsupport_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(HelpAndSupportProvider)
const helpAndSupportProviderProvider = HelpAndSupportProviderProvider._();

final class HelpAndSupportProviderProvider
    extends $NotifierProvider<HelpAndSupportProvider, AppLoadingState> {
  const HelpAndSupportProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'helpAndSupportProviderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$helpAndSupportProviderHash();

  @$internal
  @override
  HelpAndSupportProvider create() => HelpAndSupportProvider();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppLoadingState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppLoadingState>(value),
    );
  }
}

String _$helpAndSupportProviderHash() =>
    r'1373054795ca7e491b0e8f972242bd1ac9697320';

abstract class _$HelpAndSupportProvider extends $Notifier<AppLoadingState> {
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
