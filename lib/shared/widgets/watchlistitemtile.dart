import 'package:flutter/material.dart';
import '../../../../drappers.dart';
import '../../../../core/extensions/theme_extension.dart';
import '../../core/theme/app_scalar.dart';
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
      padding: EdgeInsets.symmetric(
        horizontal: AppScaler.scaleSize(context, 20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: AppScaler.scaleSize(context, 157),
            height: AppScaler.scaleHeight(context, 89),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              image: DecorationImage(
                image: AssetImage(thumbnailPath),
                fit: BoxFit.cover,
              ),
            ),
          ),

          SizedBox(width: AppScaler.scaleSize(context, 12)),

          Expanded(
            child: PoppinsText(
              context,
              title,
              fontSize: PoppinsFontSizeVariant.size16,
              fontWeight: PoppinsFontWeightVariant.medium,
              color: customColors.textColor,
              maxLines: 3,
              textOverflow: TextOverflow.ellipsis,
            ),
          ),

          SizedBox(width: AppScaler.scaleSize(context, 12)),

          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onTapPlay,
            child: Image.asset(
              Assets.images.playcircleicon.path,
              height: AppScaler.scaleHeight(context, 32),
              width: AppScaler.scaleSize(context, 32),
            ),
          ),
        ],
      ),
    );
  }
}
