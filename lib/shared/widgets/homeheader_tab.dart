import 'package:better_player_plus/better_player_plus.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/extensions/theme_extension.dart';
import '../../core/theme/app_scalar.dart';
import '../../drappers.dart';
import 'guestloginwidget.dart';

class HomeheaderTab extends StatefulWidget {
  const HomeheaderTab({super.key});

  @override
  State<HomeheaderTab> createState() => _HomeheaderTabState();
}

BetterPlayerController? _betterPlayerController;
BetterPlayerController? get controller => _betterPlayerController;

class _HomeheaderTabState extends State<HomeheaderTab> {
  @override
  Widget build(BuildContext context) {
    List<String> hometab = [
      'Live Pitches',
      'Success Stories',
      'Overnight Success',
      'Entrepreneur Stories',
    ];
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;
    return SizedBox(
      height: AppScaler.scaleHeight(context, 45),
      child: ListView.separated(
        padding: EdgeInsets.zero,
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) =>
            SizedBox(width: AppScaler.scaleSize(context, 10)),
        shrinkWrap: true,
        itemCount: hometab.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              if (index == 0) {
                context.pushNamed(AppRoutes.livepitchesScreen.name);
              }
              if (_betterPlayerController != null &&
                  _betterPlayerController!.isVideoInitialized() != null) {
                _betterPlayerController!.pause();
              }
              if (GuestHelper.isGuest) {
                GuestHelper.checkGuest(context);
                return;
              }
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppScaler.scaleSize(context, 16),
                vertical: AppScaler.scaleHeight(context, 8),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: AppColors.shadegreycolor6B6B6B,
                  width: 1,
                ),
              ),
              child: Center(
                child: PoppinsText(
                  context,
                  hometab[index],
                  fontSize: PoppinsFontSizeVariant.size16,
                  fontWeight: PoppinsFontWeightVariant.regular,
                  color: customColors.textColor,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
