part of '../../../drappers.dart';

/// Stateful widget to fetch and then display video content.
class CustomVideoPlayer extends ConsumerStatefulWidget {
  final ChewieController? chewieController;
  final double? height;
  final double borderRadius;
  final Color backgroundColor;

  const CustomVideoPlayer({
    super.key,
    this.chewieController,
    this.height,
    this.borderRadius = 8,
    this.backgroundColor = AppColors.screenBG,
  });

  @override
  ConsumerState<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends ConsumerState<CustomVideoPlayer> {
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    if (widget.chewieController != null) {
      return VisibilityDetector(
        key: ObjectKey(widget.chewieController),
        onVisibilityChanged: (visibility) {
          if (visibility.visibleFraction == 0 && mounted) {
            widget.chewieController?.pause();
          } else if (visibility.visibleFraction == 1) {
            // widget.chewieController?.play();
          }
        },
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            color: widget.backgroundColor,
          ),
          height: widget.height ?? 161,
          width: MediaQuery.sizeOf(context).width,
          child: Chewie(
            controller: widget.chewieController!,
            key: ValueKey("player"),
          ),
        ),
      );
    } else {
      return SizedBox();
    }
  }
}
