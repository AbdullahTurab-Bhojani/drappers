part of '../../../drappers.dart';

class ThumbnailVideoPreview extends StatefulWidget {
  final double width;
  final double height;
  final File? file;
  final String? network;
  const ThumbnailVideoPreview({
    super.key,
    required this.height,
    required this.width,
    this.network,
    this.file,
  });

  @override
  State<ThumbnailVideoPreview> createState() => _ThumbnailVideoPreviewState();
}

class _ThumbnailVideoPreviewState extends State<ThumbnailVideoPreview> {
  VideoPlayerController? controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onInit();
  }

  onInit() async {
    if (widget.file != null) {
      controller = VideoPlayerController.file(File(widget.file!.path));
      await controller?.initialize();
    } else if (widget.network?.isNotEmpty ?? false) {
      controller = VideoPlayerController.networkUrl(Uri.parse(widget.network!));
      await controller?.initialize();
    }
    setState(() {});
  }

  @override
  void didUpdateWidget(covariant ThumbnailVideoPreview oldWidget) {
    // TODO: implement didUpdateWidget
    if (oldWidget.network != widget.network) {
      onInit();
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.fieldColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (controller != null)
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: controller!.value.size.width,
                  height: controller!.value.size.height,
                  child: VideoPlayer(controller!),
                ),
              ),
            ),
          // if (controller != null) VideoPlayer(controller!),
          Assets.icons.playCircleDark.image(
            scale: 4,
            height: 32,
            width: 32,
            fit: BoxFit.cover,
            color: AppColors.white,
          ),
        ],
      ),
    );
  }
}
