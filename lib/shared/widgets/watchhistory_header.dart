// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/extensions/theme_extension.dart';
import '../../core/theme/app_scalar.dart';
import '../../drappers.dart';
import 'cardwidget/card_widget.dart';

class WatchhistoryHeader extends StatefulWidget {
  const WatchhistoryHeader({super.key});

  @override
  State<WatchhistoryHeader> createState() => _WatchhistoryHeaderState();
}

class _WatchhistoryHeaderState extends State<WatchhistoryHeader> {
  @override
  Widget build(BuildContext context) {
    List images = [
      'https://source.boomplaymusic.com/buzzgroup2/M00/2E/F3/rBEe_GHV1vCACRvaAAJjfsEidFI769.png',
      'https://i0.wp.com/maactioncinema.com/wp-content/uploads/2024/01/MV5BOGU2NDNmY2UtZTJmZS00M2U4LTkyMGQtNjc5MmNiZTQ4YjA0XkEyXkFqcGdeQXVyNTk1ODQ5NDg%40._V1_-scaled.jpg?ssl=1',
      'https://resizing.flixster.com/kmvpUXbW_IqKOXauZ76IceSquTA=/fit-in/180x240/v2/https://resizing.flixster.com/2bkyVmLlw_8s0SzA8C1gaYNdoZY=/ems.cHJkLWVtcy1hc3NldHMvbW92aWVzLzJlNTkwNTIxLTM0YmYtNDgzNi1hZGFlLThjODM2ZTA5OTEzMi5qcGc=',
      'https://i0.wp.com/maactioncinema.com/wp-content/uploads/2024/01/MV5BOGU2NDNmY2UtZTJmZS00M2U4LTkyMGQtNjc5MmNiZTQ4YjA0XkEyXkFqcGdeQXVyNTk1ODQ5NDg%40._V1_-scaled.jpg?ssl=1',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHIybZ6umH09-6J4suX89s4BGUn-CSb_4j3A&s',
    ];
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PoppinsText(
              context,
              'Watch History',
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
                context.pushNamed(AppRoutes.watchHistoryViewmore.name);
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
            separatorBuilder: (context, index) {
              return SizedBox(width: AppScaler.scaleSize(context, 15));
            },
            shrinkWrap: true,
            itemCount: images.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                behavior: HitTestBehavior.opaque,

                onTap: () {
                  context.pushNamed(AppRoutes.contentDetail.name);
                },
                child: CardWidget(
                  assetImage: images[index],
                  showSaveIcon: false,
                  fromEpisode: false,
                  allowGuestNavigation: false,
                  index: index,
                  showMenuOnly: true,
                  showLiveTvBadge: false,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
