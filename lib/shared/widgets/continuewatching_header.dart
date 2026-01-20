// ignore_for_file: deprecated_member_use

import 'package:better_player_plus/better_player_plus.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/extensions/theme_extension.dart';
import '../../core/theme/app_scalar.dart';
import '../../drappers.dart';
import '../../gen/assets.gen.dart';
import 'guestloginwidget.dart';
import 'watch_history.dart';

class ContinuewatchingHeader extends StatefulWidget {
  const ContinuewatchingHeader({super.key});

  @override
  State<ContinuewatchingHeader> createState() => _ContinuewatchingHeaderState();
}

List trendingimages = [
  Assets.images.trendingimage1.path,
  Assets.images.trendingimage2.path,
  Assets.images.trendingimage3.path,
  Assets.images.trendingimage4.path,
  Assets.images.trendingimage5.path,
  Assets.images.trendingimage6.path,
  Assets.images.trendingimage7.path,
];

class _ContinuewatchingHeaderState extends State<ContinuewatchingHeader> {
  BetterPlayerController? _betterPlayerController;
  BetterPlayerController? get controller => _betterPlayerController;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PoppinsText(
              context,
              'Continue Watching',
              fontSize: PoppinsFontSizeVariant.size16,
              fontWeight: PoppinsFontWeightVariant.medium,
              color: customColors.textColor,
            ),
            AppButton(
              onPressed: () {
                if (_betterPlayerController != null) {
                  _betterPlayerController!.pause();
                }
                if (GuestHelper.isGuest) {
                  GuestHelper.checkGuest(context);
                  return;
                }
                context.pushNamed('continueWatchingViewmore');
              },
              title: "View More",
              buttonSize: Size(80, 25),
              color: Colors.transparent,
              borderColor: customColors.textColor.withOpacity(0.5),
              borderWidth: 1,
              fontSize: PoppinsFontSizeVariant.size12,
              fontWeight: PoppinsFontWeightVariant.regular,
              border: true,
            ),
          ],
        ),
        SizedBox(height: AppScaler.scaleHeight(context, 20)),
        SizedBox(
          height: AppScaler.scaleHeight(context, 180),
          child: ListView.separated(
            padding: EdgeInsets.zero,
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) =>
                SizedBox(width: AppScaler.scaleSize(context, 15)),
            itemCount: trendingimages.length,
            itemBuilder: (context, index) {
              return WatchHistory(
                assetImage: trendingimages[index],
                showSaveIcon: false,
              );
            },
          ),
        ),
      ],
    );
  }
}
