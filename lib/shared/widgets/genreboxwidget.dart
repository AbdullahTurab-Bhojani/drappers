import 'package:flutter/material.dart';
import '../../core/extensions/theme_extension.dart';
import '../../drappers.dart';

class GenreBoxWidget extends StatefulWidget {
  final String title;
  final bool showBorder;
  final VoidCallback? onTap;

  const GenreBoxWidget({
    super.key,
    required this.title,
    this.showBorder = false,
    this.onTap,
  });

  @override
  State<GenreBoxWidget> createState() => _GenreBoxWidgetState();
}

class _GenreBoxWidgetState extends State<GenreBoxWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;

    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 56,
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: customColors.regular,
          borderRadius: BorderRadius.circular(5),
          border: widget.showBorder
              ? Border(
                  left: BorderSide(
                    color: customColors.buttonColors.first,
                    width: 4,
                  ),
                )
              : null,
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
      ),
    );
  }
}
