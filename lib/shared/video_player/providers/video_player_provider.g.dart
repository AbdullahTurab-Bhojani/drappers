// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_player_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(customVideoPlayer)
const customVideoPlayerProvider = CustomVideoPlayerFamily._();

final class CustomVideoPlayerProvider
    extends
        $FunctionalProvider<
          AsyncValue<ChewieController>,
          ChewieController,
          FutureOr<ChewieController>
        >
    with $FutureModifier<ChewieController>, $FutureProvider<ChewieController> {
  const CustomVideoPlayerProvider._({
    required CustomVideoPlayerFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'customVideoPlayerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$customVideoPlayerHash();

  @override
  String toString() {
    return r'customVideoPlayerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<ChewieController> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ChewieController> create(Ref ref) {
    final argument = this.argument as String;
    return customVideoPlayer(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is CustomVideoPlayerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$customVideoPlayerHash() => r'0145205c1910266d06cd6c39817a4eaf875e20cb';

final class CustomVideoPlayerFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<ChewieController>, String> {
  const CustomVideoPlayerFamily._()
    : super(
        retry: null,
        name: r'customVideoPlayerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CustomVideoPlayerProvider call(String videoSource) =>
      CustomVideoPlayerProvider._(argument: videoSource, from: this);

  @override
  String toString() => r'customVideoPlayerProvider';
}
