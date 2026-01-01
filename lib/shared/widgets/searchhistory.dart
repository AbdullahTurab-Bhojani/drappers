import 'package:flutter/material.dart';
import '../../../../drappers.dart';
import '../../../../core/extensions/theme_extension.dart';
import '../../core/theme/app_scalar.dart';

class Searchhistory extends StatelessWidget {
  const Searchhistory({
    super.key,
    required this.title,
    required this.thumbnailPath,
    required this.onTapRemove,
    this.onTapTile,
  });

  final String title;
  final String thumbnailPath;
  final VoidCallback onTapRemove;
  final VoidCallback? onTapTile;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,

      onTap: onTapTile,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: AppScaler.scaleHeight(context, 8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: PoppinsText(
                context,
                title,
                fontSize: PoppinsFontSizeVariant.size14,
                fontWeight: PoppinsFontWeightVariant.regular,
                color: customColors.textColor,
                maxLines: 1,
                textOverflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(width: AppScaler.scaleSize(context, 15)),
            Container(
              width: AppScaler.scaleSize(context, 75),
              height: AppScaler.scaleHeight(context, 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                image: DecorationImage(
                  image: AssetImage(thumbnailPath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
