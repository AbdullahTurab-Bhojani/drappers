import 'package:flutter/material.dart';
import '../../core/extensions/theme_extension.dart';
import '../../drappers.dart';

class GenreBoxWidget extends StatefulWidget {
  final String title;
  const GenreBoxWidget({super.key, required this.title});

  @override
  State<GenreBoxWidget> createState() => _GenreBoxWidgetState();
}

class _GenreBoxWidgetState extends State<GenreBoxWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;
    return Container(
      height: 56,
      // width: 100,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: customColors.blackshade,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PoppinsText(
            widget.title,
            fontSize: PoppinsFontSizeVariant.size16,
            fontWeight: PoppinsFontWeightVariant.medium,
            color: customColors.textColor,
          ),
          SizedBox(width: 10),
          Icon(Icons.arrow_forward_ios_rounded, size: 12),
        ],
      ),
    );
  }
}
