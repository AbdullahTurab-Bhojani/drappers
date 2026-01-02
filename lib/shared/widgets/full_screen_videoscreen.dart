// ignore_for_file: deprecated_member_use, sized_box_for_whitespace, unused_element, unused_field, unused_local_variable

import 'package:better_player_plus/better_player_plus.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_scalar.dart';
import '../../../../core/extensions/theme_extension.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../shared/widgets/popupmenuitem/popupmenu_widget.dart';
import '../../drappers.dart';

class FullscreenVideoScreen extends StatefulWidget {
  final BetterPlayerController betterPlayerController;
  final String title;

  const FullscreenVideoScreen({
    super.key,
    required this.betterPlayerController,

    required this.title,
  });

  @override
  State<FullscreenVideoScreen> createState() => _FullscreenVideoScreenState();
}

class _FullscreenVideoScreenState extends State<FullscreenVideoScreen> {
  bool isAdded = false;

  bool _showControls = false;

  void _toggleControls() {
    setState(() {
      _showControls = !_showControls;
    });
  }

  String _format(Duration d) {
    String two(int n) => n.toString().padLeft(2, '0');
    final minutes = two(d.inMinutes.remainder(60));
    final seconds = two(d.inSeconds.remainder(60));
    final hours = d.inHours;
    return hours > 0 ? '$hours:$minutes:$seconds' : '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    final controller = widget.betterPlayerController;
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;

    return Center(
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.35),
              blurRadius: 30,
              spreadRadius: 4,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: SizedBox(
            width: AppScaler.scaleSize(context, 400),
            height: AppScaler.scaleHeight(context, 450),
            child: Stack(
              children: [
                controller.isVideoInitialized()!
                    ? BetterPlayer(controller: controller)
                    : Container(color: Colors.black),
                Container(color: Colors.black.withOpacity(0.18)),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: _toggleControls,
                  child: Center(
                    child: AnimatedOpacity(
                      duration: Duration(milliseconds: 50),
                      opacity: _showControls ? 1 : 0,
                      child: IconButton(
                        iconSize: AppScaler.scaleSize(context, 70),
                        icon: Icon(
                          controller.isPlaying()!
                              ? Icons.pause_circle
                              : Icons.play_circle,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            if (controller.isPlaying()!) {
                              controller.pause();
                            } else {
                              controller.play();
                            }
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: AppScaler.scaleHeight(context, 16),
                  left: AppScaler.scaleSize(context, 14),
                  right: AppScaler.scaleSize(context, 14),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.title,
                          style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: AppScaler.scaleSize(context, 14),
                          ),
                        ),
                      ),
                      PopupmenuWidget(showSaveIcon: false),
                    ],
                  ),
                ),
                Positioned(
                  bottom: AppScaler.scaleHeight(context, 10),
                  left: AppScaler.scaleSize(context, 12),
                  right: AppScaler.scaleSize(context, 12),
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: AppScaler.scaleHeight(context, 45),
                          child: AppButton(
                            onPressed: () {
                              context.pushNamed(AppRoutes.contentDetail.name);
                            },
                            title: 'Play',
                            prefixIcon: Image.asset(
                              Assets.images.playstrokeicon.path,
                              width: AppScaler.scaleSize(context, 15),
                              height: AppScaler.scaleHeight(context, 15),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: AppScaler.scaleSize(context, 10)),
                      Expanded(
                        child: SizedBox(
                          height: AppScaler.scaleHeight(context, 45),
                          child: AppButton(
                            onPressed: () {
                              setState(() {
                                if (!isAdded) {
                                  isAdded = true;
                                } else {
                                  context.pushNamed(
                                    AppRoutes.contentDetail.name,
                                  );
                                }
                              });
                            },
                            title: isAdded ? 'Added' : 'Watchlist',
                            buttonGradient: [
                              AppColors.color000011,
                              AppColors.color000011,
                            ],
                            prefixIcon: isAdded
                                ? Icon(
                                    Icons.check,
                                    size: 17,
                                    color: Theme.of(
                                      context,
                                    ).extension<AppCustomColors>()!.textColor,
                                  )
                                : Image.asset(
                                    Assets.images.addicon.path,
                                    width: AppScaler.scaleSize(context, 15),
                                    height: AppScaler.scaleHeight(context, 15),
                                  ),
                            fontSize: PoppinsFontSizeVariant.size14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
