import 'package:flutter/material.dart';
import '../../core/extensions/theme_extension.dart';
import '../../core/theme/app_scalar.dart';
import '../../drappers.dart';
import 'cardwidget/card_widget.dart';

class TrendingGrid extends StatelessWidget {
  final String title;
  final List<String> images;

  const TrendingGrid({super.key, required this.title, required this.images});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty) ...[
          PoppinsText(
            context,
            title,
            fontSize: PoppinsFontSizeVariant.size16,
            fontWeight: PoppinsFontWeightVariant.medium,
            color: customColors.textColor,
          ),
          SizedBox(height: AppScaler.scaleHeight(context, 20)),
        ],

        LayoutBuilder(
          builder: (context, constraints) {
            final double itemWidth = (constraints.maxWidth - (15 * 2)) / 3;
            final double itemHeight = itemWidth / 0.6;

            return GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: images.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: itemWidth / itemHeight,
              ),
              itemBuilder: (context, index) {
                return CardWidget(
                  assetImage: images[index],
                  showSaveIcon: false,
                  fromEpisode: false,
                  allowGuestNavigation: false,
                  index: index,
                  showMenuOnly: true,
                  showLiveTvBadge: false,
                );
              },
            );
          },
        ),
      ],
    );
  }
}
