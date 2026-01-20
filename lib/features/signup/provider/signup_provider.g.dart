// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SignUpProvider)
const signUpProviderProvider = SignUpProviderProvider._();

final class SignUpProviderProvider
    extends $NotifierProvider<SignUpProvider, AppLoadingState> {
  const SignUpProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'signUpProviderProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$signUpProviderHash();

  @$internal
  @override
  SignUpProvider create() => SignUpProvider();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppLoadingState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppLoadingState>(value),
    );
  }
}

String _$signUpProviderHash() => r'bd06dd56f56e865dd8b9acac89e7fcf6d0da2a11';

abstract class _$SignUpProvider extends $Notifier<AppLoadingState> {
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
