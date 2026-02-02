// ignore_for_file: curly_braces_in_flow_control_structures, deprecated_member_use

import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/extensions/theme_extension.dart';
import '../../../core/theme/app_scalar.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';
import '../../../shared/widgets/guestloginwidget.dart';

class StartupCard extends ConsumerStatefulWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final String description;
  final String episodeTitle;
  final int initialCount;
  final VoidCallback onWatchPressed;

  /// ⚠ CHANGE: ye ab Future hona chahiye
  final Future<void> Function()? onVotePressed;

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
  ConsumerState<StartupCard> createState() => _StartupCardState();
}

class _StartupCardState extends ConsumerState<StartupCard> {
  late int count;
  Timer? _timer;

  /// 🔥 LOADER STATE
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    count = widget.initialCount;

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

  Future<void> _handleVote() async {
    if (GuestHelper.isGuest) {
      GuestHelper.checkGuest(context);
      return;
    }

    if (widget.onVotePressed == null) return;

    setState(() {
      isLoading = true;
    });

    try {
      await widget.onVotePressed!();
    } catch (e) {
      debugPrint("Vote error: $e");
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
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
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.grey.shade200,
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
            padding: const EdgeInsets.all(15),
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
                        buttonSize: Size(
                          AppScaler.scaleSize(context, 196),
                          AppScaler.scaleHeight(context, 52),
                        ),
                        suffixIcon: const SizedBox(),
                      ),
                    ),

                    SizedBox(width: AppScaler.scaleSize(context, 10)),

                    /// 🔥 VOTE BUTTON WITH LOADER
                    SizedBox(
                      width: AppScaler.scaleSize(context, 150),
                      height: AppScaler.scaleHeight(context, 52),
                      child: OutlinedButton.icon(
                        onPressed: isLoading ? null : _handleVote,

                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: widget.isVotedByUser
                                ? Colors.red
                                : customColors.greyColor,
                            width: AppScaler.scaleSize(context, 2),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          backgroundColor: widget.isVotedByUser
                              ? Colors.red.withOpacity(0.1)
                              : Colors.transparent,
                        ),

                        icon: isLoading
                            ? SizedBox()
                            : Icon(
                                widget.isVotedByUser
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: widget.isVotedByUser
                                    ? Colors.red
                                    : customColors.textColor,
                              ),

                        label: isLoading
                            ? SizedBox(
                                width: AppScaler.scaleSize(context, 20),
                                height: AppScaler.scaleHeight(context, 20),
                                child: const LoadingWidget(color: Colors.red),
                              )
                            : PoppinsText(
                                context,
                                widget.isVotedByUser ? 'Voted' : 'Vote',
                                fontSize: PoppinsFontSizeVariant.size16,
                                fontWeight: PoppinsFontWeightVariant.medium,
                                color: widget.isVotedByUser
                                    ? Colors.red
                                    : AppColors.wDark,
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
