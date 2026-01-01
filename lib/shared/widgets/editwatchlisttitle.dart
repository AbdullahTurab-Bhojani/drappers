// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../../../../drappers.dart';
import '../../../../core/extensions/theme_extension.dart';
import '../../core/theme/app_scalar.dart';

class EditWatchlistItemTile extends StatelessWidget {
  const EditWatchlistItemTile({
    super.key,
    required this.thumbnailPath,
    required this.title,
    required this.year,
    required this.onToggle,
    required this.isChecked,
  });

  final String thumbnailPath;
  final String title;
  final String year;
  final ValueChanged<bool> onToggle;
  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppScaler.scaleHeight(context, 8),
        horizontal: AppScaler.scaleSize(context, 20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => onToggle(!isChecked),
            child: Padding(
              padding: EdgeInsets.only(right: AppScaler.scaleSize(context, 20)),
              child: Container(
                width: AppScaler.scaleSize(context, 20),
                height: AppScaler.scaleHeight(context, 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  gradient: isChecked
                      ? LinearGradient(
                          colors: [Color(0xFF007bff), Color(0xFF00c4ff)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )
                      : null,
                  border: isChecked
                      ? null
                      : Border.all(
                          color: customColors.textColor,
                          width: AppScaler.scaleSize(context, 1),
                        ),
                ),
                child: isChecked
                    ? Center(
                        child: Icon(
                          Icons.check,
                          color: AppColors.wDark,
                          size: 16,
                        ),
                      )
                    : null,
              ),
            ),
          ),

          Container(
            width: AppScaler.scaleSize(context, 130),
            height: AppScaler.scaleHeight(context, 75),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: AssetImage(thumbnailPath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: AppScaler.scaleSize(context, 15)),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PoppinsText(
                  context,
                  title,
                  fontSize: PoppinsFontSizeVariant.size16,
                  fontWeight: PoppinsFontWeightVariant.medium,
                  color: customColors.textColor,
                  maxLines: 3,
                  textOverflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
