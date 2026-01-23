import 'package:cached_network_image/cached_network_image.dart';
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
    required this.onToggle,
    required this.isChecked,
    required this.isEdit,
  });

  final String thumbnailPath;
  final String title;
  final String year;
  final VoidCallback onTapPlay;
  final ValueChanged<bool> onToggle;
  final bool isChecked;
  final bool isEdit;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppScaler.scaleSize(context, 20),
        vertical: AppScaler.scaleHeight(context, 8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (isEdit == true)
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => onToggle(!isChecked),
              child: Padding(
                padding: EdgeInsets.only(
                  right: AppScaler.scaleSize(context, 20),
                ),
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
            width: AppScaler.scaleSize(context, 157),
            height: AppScaler.scaleHeight(context, 89),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              image: DecorationImage(
                image: CachedNetworkImageProvider(thumbnailPath),
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
          isEdit == true
              ? SizedBox()
              : GestureDetector(
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
