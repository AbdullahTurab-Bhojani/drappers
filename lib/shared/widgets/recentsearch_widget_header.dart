import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/extensions/theme_extension.dart';
import '../../core/theme/app_scalar.dart';
import '../../drappers.dart';
import '../../gen/assets.gen.dart';
import 'historyitemTile.dart';

class RecentsearchWidgetHeader extends StatefulWidget {
  const RecentsearchWidgetHeader({super.key});

  @override
  State<RecentsearchWidgetHeader> createState() =>
      _RecentsearchWidgetHeaderState();
}

class _RecentsearchWidgetHeaderState extends State<RecentsearchWidgetHeader> {
  List<Map<String, String>> menuList = [
    {
      'image': Assets.images.trendingimage1.path,
      'title': 'Rio de Janeiro – Meet the Drapers Season...',
    },
    {
      'image': Assets.images.trendingimage2.path,
      'title': 'Rio de Janeiro – Meet the Drapers Season...',
    },
    {
      'image': Assets.images.trendingimage3.path,
      'title': 'Paris – Meet The Drapers Season 6 (2...',
    },
  ];

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
              'Recent Searches ',
              fontSize: PoppinsFontSizeVariant.size16,
              fontWeight: PoppinsFontWeightVariant.medium,
              color: customColors.textColor,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  menuList.clear();
                });
              },
              child: PoppinsText(
                context,
                'Clear All ',
                fontSize: PoppinsFontSizeVariant.size12,
                fontWeight: PoppinsFontWeightVariant.regular,
                color: customColors.textColor,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),

        SizedBox(height: AppScaler.scaleHeight(context, 20)),

        SizedBox(
          height: AppScaler.scaleHeight(context, 185),
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: menuList.length,
            itemBuilder: (context, index) {
              final item = menuList[index];

              return HistoryItemTile(
                title: item['title']!,
                thumbnailPath: item['image']!,

                onTapRemove: () {
                  setState(() {
                    menuList.removeAt(index);
                  });
                },

                onTapTile: () {
                  context.pushNamed(AppRoutes.contentDetail.name, extra: item);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
