// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UpdateUserProvider)
const updateUserProviderProvider = UpdateUserProviderProvider._();

final class UpdateUserProviderProvider
    extends $NotifierProvider<UpdateUserProvider, AppLoadingState> {
  const UpdateUserProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updateUserProviderProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$updateUserProviderHash();

  @$internal
  @override
  UpdateUserProvider create() => UpdateUserProvider();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppLoadingState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppLoadingState>(value),
    );
  }
}

String _$updateUserProviderHash() =>
    r'd46399f5fae9e623e3592cb71cef79e24ed7058e';

abstract class _$UpdateUserProvider extends $Notifier<AppLoadingState> {
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
