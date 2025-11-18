part of '../../../drappers.dart';

typedef VideoWidgetBuilder = Widget Function(ChewieController? controller);

class VideoPlayerStateBuilder extends ConsumerStatefulWidget {
  final VideoWidgetBuilder builder;
  final String videoSource;

  const VideoPlayerStateBuilder({
    super.key,
    required this.builder,
    required this.videoSource,
  });

  @override
  ConsumerState<VideoPlayerStateBuilder> createState() =>
      _VideoPlayerStateBuilderState();
}

class _VideoPlayerStateBuilderState
    extends ConsumerState<VideoPlayerStateBuilder> {
  @override
  Widget build(BuildContext context) {
    final videoPlayer = ref.watch(
      customVideoPlayerProvider(widget.videoSource),
    );

    switch (videoPlayer) {
      case AsyncData(:final value):
        {
          return widget.builder(value);
        }
      case AsyncLoading():
        {
          return LoadingWidget();
        }
      case AsyncError():
        {
          return ErrorWidget(videoPlayer.error);
        }
    }
  }
}
