// ignore_for_file: deprecated_member_use

import 'package:better_player_plus/better_player_plus.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/extensions/theme_extension.dart';
import '../../core/theme/app_scalar.dart';
import '../../drappers.dart';
import '../../gen/assets.gen.dart';
import 'reelcard/reelcard_widget.dart';

class ReelsHeader extends StatefulWidget {
  const ReelsHeader({super.key});

  @override
  State<ReelsHeader> createState() => _ReelsHeaderState();
}

List<String> reelimages = [
  Assets.images.reel1.path,
  Assets.images.reel2.path,
  Assets.images.reel3.path,
  Assets.images.reel4.path,
  Assets.images.reel5.path,
];
List<String> reelTitles = [
  'Rio De Janeiro - Meet The Drappers',
  'Brand Acceleration - Meet The Drappers',
  'Season 5, India - Meet The Drappers',
  'The Frontier - Meet The Drappers',
  'Season 6, Saudi Arabia - Meet The Drappers',
];

class _ReelsHeaderState extends State<ReelsHeader> {
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
              'Reels',
              fontSize: PoppinsFontSizeVariant.size16,
              fontWeight: PoppinsFontWeightVariant.medium,
              color: customColors.textColor,
            ),
            AppButton(
              buttonSize: Size(80, 25),
              color: Colors.transparent,
              borderColor: customColors.textColor.withOpacity(0.5),
              borderWidth: 1,
              fontSize: PoppinsFontSizeVariant.size12,
              fontWeight: PoppinsFontWeightVariant.regular,
              border: true,
              onPressed: () {
                if (_betterPlayerController != null) {
                  _betterPlayerController!.pause();
                }
                context.pushNamed(AppRoutes.reelWidget.name);
              },
              title: "View More",
            ),
          ],
        ),
        SizedBox(height: AppScaler.scaleHeight(context, 20)),

        SizedBox(
          height: AppScaler.scaleHeight(context, 273),
          child: ListView.separated(
            padding: EdgeInsets.zero,
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) =>
                SizedBox(width: AppScaler.scaleSize(context, 15)),
            itemCount: reelimages.length,
            itemBuilder: (context, index) {
              return ReelcardWidget(
                reelCardHeight: AppScaler.scaleHeight(context, 273),
                reelCardWidth: AppScaler.scaleSize(context, 149),
                fontSizeVariant: PoppinsFontSizeVariant.size12,
                assetImagePath: reelimages[index],
                title: reelTitles[index],
                showSaveIcon: false,
              );
            },
          ),
        ),
      ],
    );
  }
}
