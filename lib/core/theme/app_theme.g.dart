// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_theme.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CustomTheme)
const customThemeProvider = CustomThemeProvider._();

final class CustomThemeProvider
    extends $NotifierProvider<CustomTheme, CustomThemeState> {
  const CustomThemeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'customThemeProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$customThemeHash();

  @$internal
  @override
  CustomTheme create() => CustomTheme();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CustomThemeState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CustomThemeState>(value),
    );
  }
}

String _$customThemeHash() => r'c0307f16e756f860bc12b1b27d4bb7efc9944afd';

abstract class _$CustomTheme extends $Notifier<CustomThemeState> {
  CustomThemeState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<CustomThemeState, CustomThemeState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CustomThemeState, CustomThemeState>,
              CustomThemeState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
