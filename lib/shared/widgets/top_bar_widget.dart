import 'package:flutter/material.dart';
import '../../../gen/assets.gen.dart';
import '../../drappers.dart';

class TopBarWidget extends StatelessWidget {
  final String title;
  final VoidCallback onBack;
  final VoidCallback onClose;

  const TopBarWidget({
    super.key,
    required this.title,
    required this.onBack,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onBack,
            child: Image.asset(
              Assets.images.casting.path,
              width: 24,
              height: 24,
            ),
          ),
          Expanded(
            child: Center(
              child: PoppinsText(
                context,
                title,
                fontSize: PoppinsFontSizeVariant.size40,
                fontWeight: PoppinsFontWeightVariant.semiBold,
                color: AppColors.wDark,
                maxLines: 1,
                textOverflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          GestureDetector(
            onTap: onClose,
            child: Image.asset(
              Assets.images.crossnewicon.path,
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
    );
  }
}
