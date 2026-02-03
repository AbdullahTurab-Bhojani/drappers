// ignore_for_file: deprecated_member_use

import 'package:better_player_plus/better_player_plus.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/extensions/theme_extension.dart';
import '../../core/theme/app_scalar.dart';
import '../../drappers.dart';
import 'cardwidget/card_widget.dart';
import 'guestloginwidget.dart';
import 'more_info_bottom_sheet.dart';

class TrendingshowsHeader extends StatefulWidget {
  final bool showLiveTvBadge;
  final bool showMoreInfo;
  const TrendingshowsHeader({
    super.key,
    required this.showLiveTvBadge,
    required this.showMoreInfo,
  });

  @override
  State<TrendingshowsHeader> createState() => _TrendingshowsHeaderState();
}

List trendingimages = [
  'https://media.licdn.com/dms/image/v2/D5622AQEyov8yWSObtQ/feedshare-shrink_800/B56ZZbWaY0GUAg-/0/1745289326559?e=2147483647&v=beta&t=aVV9PZkR61m9nD1gjSmofrkmGY3YO3rftG8mZaF6ofU',
  'https://media.licdn.com/dms/image/v2/D5622AQEyov8yWSObtQ/feedshare-shrink_800/B56ZZbWaY0GUAg-/0/1745289326559?e=2147483647&v=beta&t=aVV9PZkR61m9nD1gjSmofrkmGY3YO3rftG8mZaF6ofU',
  'https://media.licdn.com/dms/image/v2/D5622AQEyov8yWSObtQ/feedshare-shrink_800/B56ZZbWaY0GUAg-/0/1745289326559?e=2147483647&v=beta&t=aVV9PZkR61m9nD1gjSmofrkmGY3YO3rftG8mZaF6ofU',
  'https://media.licdn.com/dms/image/v2/D5622AQEyov8yWSObtQ/feedshare-shrink_800/B56ZZbWaY0GUAg-/0/1745289326559?e=2147483647&v=beta&t=aVV9PZkR61m9nD1gjSmofrkmGY3YO3rftG8mZaF6ofU',
  'https://media.licdn.com/dms/image/v2/D5622AQEyov8yWSObtQ/feedshare-shrink_800/B56ZZbWaY0GUAg-/0/1745289326559?e=2147483647&v=beta&t=aVV9PZkR61m9nD1gjSmofrkmGY3YO3rftG8mZaF6ofU',
  'https://media.licdn.com/dms/image/v2/D5622AQEyov8yWSObtQ/feedshare-shrink_800/B56ZZbWaY0GUAg-/0/1745289326559?e=2147483647&v=beta&t=aVV9PZkR61m9nD1gjSmofrkmGY3YO3rftG8mZaF6ofU',
  'https://media.licdn.com/dms/image/v2/D5622AQEyov8yWSObtQ/feedshare-shrink_800/B56ZZbWaY0GUAg-/0/1745289326559?e=2147483647&v=beta&t=aVV9PZkR61m9nD1gjSmofrkmGY3YO3rftG8mZaF6ofU',
];

class _TrendingshowsHeaderState extends State<TrendingshowsHeader> {
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
              'Trending Shows',
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
                context.pushNamed(AppRoutes.trendingshow.name);
              },
              title: "View More",
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
              return CardWidget(
                assetImage: trendingimages[index],
                showSaveIcon: false,
                fromEpisode: false,
                allowGuestNavigation: false,
                index: index,
                showMenuOnly: true,
                showLiveTvBadge: widget.showLiveTvBadge,
                showMoreInfo: widget.showMoreInfo && index == 0,

                onTap: () {
                  if (!widget.showLiveTvBadge && !widget.showMoreInfo) {
                    context.pushNamed(AppRoutes.contentDetail.name);
                    return;
                  }

                  if (index == 0) {
                    if (GuestHelper.isGuest) {
                      GuestHelper.checkGuest(context);
                      return;
                    }
                    context.pushNamed(AppRoutes.newliveScreen.name);
                  } else {
                    if (GuestHelper.isGuest) {
                      GuestHelper.checkGuest(context);
                      return;
                    }
                    context.pushNamed(AppRoutes.contentDetail.name);
                  }
                },

                onMoreInfoTap: widget.showMoreInfo
                    ? () {
                        showModalBottomSheet(
                          context: context,
                          useRootNavigator: true,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) => MoreInfoBottomSheet(),
                        );
                      }
                    : null,
              );
            },
          ),
        ),
      ],
    );
  }
}
