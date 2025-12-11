import 'package:flutter/material.dart';
import '../../../../drappers.dart';
import '../../../../core/extensions/theme_extension.dart';

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
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () => onToggle(!isChecked),
            child: Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  gradient: isChecked
                      ? const LinearGradient(
                          colors: [Color(0xFF007bff), Color(0xFF00c4ff)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )
                      : null,
                  border: isChecked
                      ? null
                      : Border.all(color: customColors.textColor, width: 1),
                ),
                child: isChecked
                    ? const Center(
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 18.0,
                        ),
                      )
                    : null,
              ),
            ),
          ),

          Container(
            width: 130,
            height: 75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: AssetImage(thumbnailPath),
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PoppinsText(
                  title,
                  fontSize: PoppinsFontSizeVariant.size16,
                  fontWeight: PoppinsFontWeightVariant.medium,
                  color: customColors.textColor,
                  maxLines: 2,
                  textOverflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                PoppinsText(
                  'Season $year',
                  fontSize: PoppinsFontSizeVariant.size14,
                  fontWeight: PoppinsFontWeightVariant.regular,
                  color: customColors.textColor.withOpacity(0.7),
                ),
              ],
            ),
          ),

          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
