import 'package:flutter/material.dart';
import '../../../drappers.dart';

class PlayerActionButton extends StatelessWidget {
  final String? imagePath;
  final String? label;
  final VoidCallback onTap;
  final Color? color;
  final double imageSize;

  const PlayerActionButton({
    super.key,
    this.imagePath,
    this.label,
    required this.onTap,
    this.color,
    this.imageSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (imagePath != null)
            Image.asset(
              imagePath!,
              width: imageSize,
              height: imageSize,
              fit: BoxFit.contain,
            ),

          if (imagePath != null && label != null) const SizedBox(width: 6),

          if (label != null)
            PoppinsText(
              context,
              label!,
              fontSize: PoppinsFontSizeVariant.size28,
              fontWeight: PoppinsFontWeightVariant.semiBold,
              color: color ?? AppColors.wDark,
            ),
        ],
      ),
    );
  }
}
