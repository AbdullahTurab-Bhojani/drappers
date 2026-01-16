import 'package:flutter/material.dart';
import '../../../drappers.dart';

class HorizontalEpisodeItem extends StatelessWidget {
  final Map<String, String> episode;
  final VoidCallback onTap;

  const HorizontalEpisodeItem({
    super.key,
    required this.episode,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        width: 255,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 132,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(8),
                ),
                image: DecorationImage(
                  image: AssetImage(episode['image']!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: PoppinsText(
                context,
                episode['title']!,
                fontSize: PoppinsFontSizeVariant.size32,
                fontWeight: PoppinsFontWeightVariant.medium,
                color: AppColors.wDark,
                maxLines: 2,
                textOverflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
