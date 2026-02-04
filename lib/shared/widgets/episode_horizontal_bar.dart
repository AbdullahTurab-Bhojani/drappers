import 'package:flutter/material.dart';
import '../../../drappers.dart';
import 'horizontal_episode_item.dart';

class EpisodesHorizontalBar extends StatelessWidget {
  final bool show;
  final List<Map<String, String>> episodesData;
  final VoidCallback onClose;
  final Function(int index) onEpisodeTap;
  final String title;

  const EpisodesHorizontalBar({
    super.key,
    required this.show,
    required this.episodesData,
    required this.onClose,
    required this.onEpisodeTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    if (!show) return const SizedBox.shrink();

    return Stack(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onClose,
          child: Container(color: Colors.transparent),
        ),

        Align(
          alignment: Alignment.bottomCenter,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onVerticalDragUpdate: (details) {
              if (details.delta.dy > 5) onClose();
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  color: AppColors.color000032,
                  child: PoppinsText(
                    context,
                    title,
                    fontSize: PoppinsFontSizeVariant.size40,
                    fontWeight: PoppinsFontWeightVariant.medium,
                    color: AppColors.wDark,
                  ),
                ),

                Container(
                  height: 190,
                  color: AppColors.color040412,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(left: 20),
                    separatorBuilder: (_, _) => const SizedBox(width: 20),
                    itemCount: episodesData.length,
                    itemBuilder: (_, index) => HorizontalEpisodeItem(
                      episode: episodesData[index],
                      onTap: () => onEpisodeTap(index),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
