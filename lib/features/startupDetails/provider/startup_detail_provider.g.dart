// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'startup_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getStartupDetail)
const getStartupDetailProvider = GetStartupDetailFamily._();

final class GetStartupDetailProvider
    extends
        $FunctionalProvider<
          AsyncValue<StartupModel?>,
          StartupModel?,
          FutureOr<StartupModel?>
        >
    with $FutureModifier<StartupModel?>, $FutureProvider<StartupModel?> {
  const GetStartupDetailProvider._({
    required GetStartupDetailFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'getStartupDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getStartupDetailHash();

  @override
  String toString() {
    return r'getStartupDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<StartupModel?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<StartupModel?> create(Ref ref) {
    final argument = this.argument as int;
    return getStartupDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GetStartupDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getStartupDetailHash() => r'2baec83e486a03701d93cc687044936eb0c1ec14';

final class GetStartupDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<StartupModel?>, int> {
  const GetStartupDetailFamily._()
    : super(
        retry: null,
        name: r'getStartupDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetStartupDetailProvider call(int id) =>
      GetStartupDetailProvider._(argument: id, from: this);

  @override
  String toString() => r'getStartupDetailProvider';
}
