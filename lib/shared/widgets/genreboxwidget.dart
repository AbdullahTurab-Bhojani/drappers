import 'package:flutter/material.dart';
import '../../core/extensions/theme_extension.dart';
import '../../core/theme/app_scalar.dart';
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
      behavior: HitTestBehavior.opaque,

      onTap: widget.onTap,
      child: Container(
        height: AppScaler.scaleHeight(context, 50),
        padding: EdgeInsets.symmetric(horizontal: AppScaler.scaleSize(context, 15)),
        decoration: BoxDecoration(
          color: AppColors.color000032,
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
              context,
              widget.title,
              fontSize: PoppinsFontSizeVariant.size16,
              fontWeight: PoppinsFontWeightVariant.medium,
              color: customColors.textColor,
            ),
            SizedBox(width: AppScaler.scaleSize(context, 10)),
            Icon(Icons.arrow_forward_ios_rounded, size: 12),
          ],
        ),
      ),
    );
  }
}
