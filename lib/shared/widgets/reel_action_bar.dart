import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../../../core/theme/app_scalar.dart';
import '../../../core/extensions/theme_extension.dart';
import '../../drappers.dart';
import '../../gen/assets.gen.dart';

class ReelActionBar extends StatefulWidget {
  final VideoPlayerController controller;
  final String title;
  final String description;
  final String date;

  final bool isLiked;
  final int likeCount;
  final bool isSaved;
  final bool isExpanded;

  final VoidCallback onLike;
  final VoidCallback onShare;
  final VoidCallback onSave;
  final VoidCallback onToggleExpand;
  final VoidCallback onBack;

  const ReelActionBar({
    super.key,
    required this.controller,
    required this.title,
    required this.description,
    required this.date,
    required this.isLiked,
    required this.likeCount,
    required this.isSaved,
    required this.isExpanded,
    required this.onLike,
    required this.onShare,
    required this.onSave,
    required this.onToggleExpand,
    required this.onBack,
  });

  @override
  State<ReelActionBar> createState() => _ReelActionBarState();
}

class _ReelActionBarState extends State<ReelActionBar> {
  void _togglePlayPause() {
    if (!widget.controller.value.isInitialized) return;

    setState(() {
      widget.controller.value.isPlaying
          ? widget.controller.pause()
          : widget.controller.play();
    });
  }

  bool _isTextLong(
    String text,
    double maxWidth,
    TextStyle style,
    int maxLines,
  ) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: maxLines,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: maxWidth);
    return textPainter.didExceedMaxLines;
  }

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<AppCustomColors>()!;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _togglePlayPause,
      child: Stack(
        children: [
          Positioned.fill(
            child: widget.controller.value.isInitialized
                ? FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: widget.controller.value.size.width,
                      height: widget.controller.value.size.height,
                      child: VideoPlayer(widget.controller),
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(color: AppColors.white),
                  ),
          ),

          if (widget.controller.value.isInitialized &&
              !widget.controller.value.isPlaying)
            Center(
              child: Icon(Icons.play_arrow, size: 70, color: Colors.white70),
            ),

          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: AppScaler.scaleHeight(context, 260),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.black87, Colors.black],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            left: AppScaler.scaleSize(context, 20),
            right: AppScaler.scaleSize(context, 20),
            bottom: AppScaler.scaleHeight(context, 95),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PoppinsText(
                  context,
                  widget.title,
                  fontSize: PoppinsFontSizeVariant.size18,
                  fontWeight: PoppinsFontWeightVariant.medium,
                  color: customColors.textColor,
                ),
                SizedBox(height: AppScaler.scaleHeight(context, 4)),
                PoppinsText(
                  context,
                  "${widget.date} • 2.2k views",
                  fontSize: PoppinsFontSizeVariant.size14,
                  color: Colors.white70,
                ),
                SizedBox(height: AppScaler.scaleHeight(context, 8)),

                Builder(
                  builder: (context) {
                    final style = TextStyle(
                      fontSize: 14,
                      color: customColors.textColor,
                      height: 1.2,
                    );
                    final maxWidth =
                        MediaQuery.of(context).size.width -
                        AppScaler.scaleSize(context, 40);
                    final showReadMore = _isTextLong(
                      widget.description,
                      maxWidth,
                      style,
                      2,
                    );

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PoppinsText(
                          context,
                          widget.description,
                          maxLines: widget.isExpanded ? 20 : 2,
                          textOverflow: TextOverflow.ellipsis,
                          fontSize: PoppinsFontSizeVariant.size14,
                          color: customColors.textColor,
                        ),
                        if (showReadMore)
                          GestureDetector(
                            onTap: widget.onToggleExpand,
                            child: Padding(
                              padding: EdgeInsets.only(top: 4),
                              child: PoppinsText(
                                context,
                                widget.isExpanded ? "Read Less" : "Read More",
                                fontSize: PoppinsFontSizeVariant.size13,
                                fontWeight: PoppinsFontWeightVariant.semiBold,
                                color: customColors.textColor,
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),

          Positioned(
            left: AppScaler.scaleSize(context, 20),
            right: AppScaler.scaleSize(context, 20),
            bottom: AppScaler.scaleHeight(context, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: widget.onLike,
                      child: Row(
                        children: [
                          Image.asset(
                            widget.isLiked
                                ? Assets.images.like.path
                                : Assets.images.likeicon.path,
                            width: AppScaler.scaleSize(context, 26),
                            height: AppScaler.scaleHeight(context, 26),
                            color: widget.isLiked ? Colors.blue : null,
                          ),
                          SizedBox(width: AppScaler.scaleSize(context, 8)),
                          PoppinsText(
                            context,
                            "${widget.likeCount}",
                            fontSize: PoppinsFontSizeVariant.size14,
                            color: AppColors.white,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(width: AppScaler.scaleSize(context, 22)),

                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: widget.onShare,
                      child: Row(
                        children: [
                          Image.asset(
                            Assets.images.shareiconnew.path,
                            width: AppScaler.scaleSize(context, 24),
                            height: AppScaler.scaleHeight(context, 24),
                            color: AppColors.white,
                          ),
                          SizedBox(width: AppScaler.scaleSize(context, 8)),
                          PoppinsText(
                            context,
                            "Share",
                            fontSize: PoppinsFontSizeVariant.size14,
                            color: AppColors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                AppButton(
                  buttonSize: Size(0, 0),
                  onPressed: widget.onSave,
                  title: widget.isSaved ? " Saved" : " Save",
                  color: Colors.transparent,
                  prefixIcon: widget.isSaved
                      ? Icon(Icons.check, size: 17, color: AppColors.white)
                      : Image.asset(
                          Assets.images.addicon.path,
                          width: AppScaler.scaleSize(context, 15),
                        ),
                  fontSize: PoppinsFontSizeVariant.size14,
                ),
              ],
            ),
          ),

          Positioned(
            top: AppScaler.scaleHeight(context, 60),
            left: AppScaler.scaleSize(context, 20),
            right: AppScaler.scaleSize(context, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: widget.onBack,
                  child: CircleAvatar(
                    backgroundColor: Colors.black54,
                    child: Center(
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: 20,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
                Image.asset(
                  "assets/images/3dotsicon.png",
                  width: 24,
                  height: 24,
                  color: customColors.textColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
