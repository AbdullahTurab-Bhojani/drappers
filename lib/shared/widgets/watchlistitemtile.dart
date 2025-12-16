import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../drappers.dart';
import '../../../../core/extensions/theme_extension.dart';
import '../../gen/assets.gen.dart';

class WatchlistItemTile extends StatelessWidget {
  const WatchlistItemTile({
    super.key,
    required this.thumbnailPath,
    required this.title,
    required this.year,
    required this.onTapPlay,
  });

  final String thumbnailPath;
  final String title;
  final String year;
  final VoidCallback onTapPlay;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 10.0, right: 20, left: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 157,
            height: 89,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              image: DecorationImage(
                image: AssetImage(thumbnailPath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 12),
          SizedBox(
            width: Platform.isIOS ? 140 : 160,
            child: PoppinsText(
              title,
              fontSize: PoppinsFontSizeVariant.size16,
              fontWeight: PoppinsFontWeightVariant.medium,
              color: customColors.textColor,
              maxLines: 3,
              textOverflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            behavior: HitTestBehavior.opaque,

            onTap: () {
              context.pushNamed(AppRoutes.contentDetail.name);
            },
            child: Image.asset(
              Assets.images.playcircleicon.path,
              height: 32,
              width: 32,
            ),
          ),
        ],
      ),
    );
  }
}
