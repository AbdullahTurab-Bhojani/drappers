// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../../../../drappers.dart';
import '../../../../core/extensions/theme_extension.dart';

class HistoryItemTile extends StatelessWidget {
  const HistoryItemTile({
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
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              "assets/images/time3x.png",
              width: 16,
              height: 16,
              color: customColors.textColor,
            ),
            SizedBox(width: 15),
            Expanded(
              child: PoppinsText(
                title,
                fontSize: PoppinsFontSizeVariant.size14,
                fontWeight: PoppinsFontWeightVariant.regular,
                color: customColors.textColor,
                maxLines: 1,
                textOverflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(width: 15),
            Container(
              width: 70,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                image: DecorationImage(
                  image: AssetImage(thumbnailPath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 15),
            GestureDetector(
              behavior: HitTestBehavior.opaque,

              onTap: onTapRemove,
              child: Image.asset(
                "assets/images/cuticon3x.png",
                width: 16,
                height: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
