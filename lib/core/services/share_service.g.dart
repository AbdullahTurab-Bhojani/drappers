// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'share_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ShareService)
const shareServiceProvider = ShareServiceProvider._();

final class ShareServiceProvider
    extends $NotifierProvider<ShareService, SharePlus> {
  const ShareServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shareServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shareServiceHash();

  @$internal
  @override
  ShareService create() => ShareService();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SharePlus value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SharePlus>(value),
    );
  }
}

String _$shareServiceHash() => r'6d8cea91ec50d1d8def2abaddec9372e16da5c4d';

abstract class _$ShareService extends $Notifier<SharePlus> {
  SharePlus build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<SharePlus, SharePlus>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SharePlus, SharePlus>,
              SharePlus,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
