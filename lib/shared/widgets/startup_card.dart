// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../core/extensions/theme_extension.dart';
import '../../../core/theme/app_scalar.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';
import 'guestloginwidget.dart';

class StartupCard extends StatefulWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final String description;
  final String episodeTitle;
  final int initialCount;
  final VoidCallback onWatchPressed;
  final VoidCallback? onVotePressed;
  final VoidCallback? onCardTap;
  final bool isVotedByUser;

  const StartupCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.episodeTitle,
    required this.initialCount,
    required this.onWatchPressed,
    this.onVotePressed,
    this.onCardTap,
    this.isVotedByUser = false,
  });

  @override
  State<StartupCard> createState() => _StartupCardState();
}

class _StartupCardState extends State<StartupCard> {
  bool isVoted = false;
  late int count;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    count = widget.initialCount;
    isVoted = widget.isVotedByUser;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        count += 1;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  ImageProvider getImageProvider(String? url) {
    if (url == null || url.isEmpty) {
      return const CachedNetworkImageProvider(
        'https://mis.ihc.gov.pk/img/no-video.jpg',
      );
    }

    return CachedNetworkImageProvider(url);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: customColors.dark,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: widget.onCardTap,
            child: Container(
              width: double.infinity,
              height: AppScaler.scaleHeight(context, 215),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.grey.shade200, // fallback color
              ),
              clipBehavior: Clip.hardEdge,
              child: Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: widget.imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                    placeholder: (context, url) => Center(
                      child: LoadingWidget(color: AppColors.buttoncolor.first),
                    ),
                    errorWidget: (context, url, error) => Image.network(
                      'https://mis.ihc.gov.pk/img/no-video.jpg',
                    ),
                  ),
                  Positioned(
                    bottom: AppScaler.scaleHeight(context, 10),
                    right: AppScaler.scaleSize(context, 10),
                    child: Image.asset(Assets.images.muteicon.path),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PoppinsText(
                  context,
                  widget.title,
                  fontSize: PoppinsFontSizeVariant.size22,
                  fontWeight: PoppinsFontWeightVariant.medium,
                ),
                SizedBox(height: AppScaler.scaleHeight(context, 2)),
                PoppinsText(
                  context,
                  widget.subtitle,
                  fontSize: PoppinsFontSizeVariant.size16,
                  fontWeight: PoppinsFontWeightVariant.regular,
                  color: customColors.subtextColor,
                ),
                SizedBox(height: AppScaler.scaleHeight(context, 10)),
                PoppinsText(
                  context,
                  widget.description,
                  fontSize: PoppinsFontSizeVariant.size12,
                  fontWeight: PoppinsFontWeightVariant.regular,
                  color: customColors.subtextColor,
                ),
                SizedBox(height: AppScaler.scaleHeight(context, 15)),
                PoppinsText(
                  context,
                  widget.episodeTitle,
                  fontSize: PoppinsFontSizeVariant.size16,
                  fontWeight: PoppinsFontWeightVariant.regular,
                  color: customColors.textColor,
                ),
                SizedBox(height: AppScaler.scaleHeight(context, 20)),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: AppButton(
                        prefixIcon: Image.asset(
                          Assets.images.playstrokeicon.path,
                          width: AppScaler.scaleSize(context, 14),
                          height: AppScaler.scaleHeight(context, 14),
                        ),
                        onPressed: widget.onWatchPressed,
                        title: 'Watch Episode',
                        buttonSize: Size(196, 52),
                        suffixIcon: SizedBox(),
                      ),
                    ),
                    SizedBox(width: AppScaler.scaleSize(context, 10)),

                    SizedBox(
                      width: 160,
                      height: 52,
                      child: OutlinedButton.icon(
                        onPressed: () {
                          if (GuestHelper.isGuest) {
                            GuestHelper.checkGuest(context);
                            return;
                          }

                          // Optimistic UI toggle
                          setState(() {
                            isVoted = !isVoted;
                          });

                          if (widget.onVotePressed != null)
                            widget.onVotePressed!();
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: isVoted
                                ? Colors.red
                                : customColors.greyColor,
                            width: AppScaler.scaleSize(context, 2),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: AppScaler.scaleHeight(context, 12),
                          ),
                          backgroundColor: isVoted
                              ? Colors.red.withOpacity(0.1)
                              : Colors.transparent,
                        ),
                        icon: Icon(
                          isVoted ? Icons.favorite : Icons.favorite_border,
                          size: 24,
                          color: isVoted ? Colors.red : customColors.textColor,
                        ),
                        label: PoppinsText(
                          context,
                          isVoted ? 'Voted' : 'Vote',
                          fontSize: PoppinsFontSizeVariant.size16,
                          fontWeight: PoppinsFontWeightVariant.medium,
                          color: isVoted ? Colors.red : AppColors.wDark,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
