// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apply_pitch_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PitchProvider)
const pitchProviderProvider = PitchProviderProvider._();

final class PitchProviderProvider
    extends $NotifierProvider<PitchProvider, AppLoadingState> {
  const PitchProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pitchProviderProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pitchProviderHash();

  @$internal
  @override
  PitchProvider create() => PitchProvider();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppLoadingState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppLoadingState>(value),
    );
  }
}

String _$pitchProviderHash() => r'4d221f28a3e5a9342edfcbb9e32571b27cfbc263';

abstract class _$PitchProvider extends $Notifier<AppLoadingState> {
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
