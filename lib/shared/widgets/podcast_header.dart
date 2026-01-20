// ignore_for_file: deprecated_member_use

import 'package:better_player_plus/better_player_plus.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/extensions/theme_extension.dart';
import '../../core/theme/app_scalar.dart';
import '../../drappers.dart';
import '../../gen/assets.gen.dart';
import 'podcardswidget/podcards_widget.dart';

class PodcastHeader extends StatefulWidget {
  const PodcastHeader({super.key});

  @override
  State<PodcastHeader> createState() => _PodcastHeaderState();
}

List<String> podcardimages = [
  Assets.images.podcastimage1.path,
  Assets.images.podcastimage2.path,
  Assets.images.podcastimage3.path,
  Assets.images.podcastimage4.path,
  Assets.images.podcastimage5.path,
];

class _PodcastHeaderState extends State<PodcastHeader> {
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
              'Podcasts',
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
                context.pushNamed('podcasts');
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
            itemCount: podcardimages.length,
            itemBuilder: (context, index) {
              return PodcardsWidget(
                assetImage: podcardimages[index],
                title: '',
                showSaveIcon: false,
                fontSizeVariant: PoppinsFontSizeVariant.size14,
              );
            },
          ),
        ),
      ],
    );
 
  }
}
