import 'package:flutter/material.dart';

import '../../../core/extensions/theme_extension.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';
import '../app_bar/main_app_bar.dart';
import '../popupmenuitem/popupmenu_widget.dart';

class ReelcardWidget extends StatefulWidget {
  final String backgroundImage;
  final String title;

  const ReelcardWidget({
    super.key,
    required this.backgroundImage,
    required this.title,
  });

  @override
  State<ReelcardWidget> createState() => _ReelcardWidgetState();
}

class _ReelcardWidgetState extends State<ReelcardWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;
    return Container(
      width: 125,
      height: 358,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(widget.backgroundImage),
          fit: BoxFit.cover,
        ),
      ),

      child: Padding(
        padding: EdgeInsets.only(left: 8, top: 8, bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           PopupmenuWidget(),

            PoppinsText(
              widget.title,
              fontSize: PoppinsFontSizeVariant.size14,
              fontWeight: PoppinsFontWeightVariant.medium,
            ),
          ],
        ),
      ),
    );
  }
}
