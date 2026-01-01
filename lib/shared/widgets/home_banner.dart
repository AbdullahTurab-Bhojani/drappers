import 'package:flutter/material.dart';

import '../../core/extensions/theme_extension.dart';
import '../../drappers.dart';
import '../../gen/assets.gen.dart';

class HomeBanner extends StatefulWidget {
  final String title;
  final String subtitle;
  final String backgroundImage;
  final String buttonText;
  final Color buttonColor;
  final Color buttonBorderColor;
  final double buttonBorderWidth;
  final List<Color>? buttonGradient;
  final VoidCallback? onTap;

  const HomeBanner({
    super.key,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.buttonColor,
    required this.buttonBorderColor,
    required this.backgroundImage,
    required this.buttonBorderWidth,
    this.buttonGradient,
    this.onTap,
  });

  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;

    return GestureDetector(
      onTap: widget.onTap,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 238,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.backgroundImage),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PoppinsText(
                  context,
                  widget.title,
                  color: customColors.textColor,
                  fontSize: PoppinsFontSizeVariant.size24,
                  fontWeight: PoppinsFontWeightVariant.medium,
                ),
                const SizedBox(height: 10),
                PoppinsText(
                  context,
                  widget.subtitle,
                  color: customColors.textColor,
                  fontSize: PoppinsFontSizeVariant.size16,
                  fontWeight: PoppinsFontWeightVariant.medium,
                ),
                const SizedBox(height: 30),
                AppButton(
                  onPressed: widget.onTap ?? () {},
                  title: widget.buttonText,
                  buttonSize: const Size(186, 45),
                  suffixIcon: Image.asset(
                    Assets.images.playfillnewicon.path,
                    width: 12,
                    height: 12,
                  ),
                  border: true,
                  color: widget.buttonColor,
                  borderColor: widget.buttonBorderColor,
                  borderWidth: widget.buttonBorderWidth,
                  buttonGradient: widget.buttonGradient,
                ),
              ],
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: Image.asset(
              Assets.images.textLogo.path,
              width: 100,
              height: 36,
            ),
          ),
          Positioned(
            bottom: 8,
            right: 8,
            child: Image.asset(
              Assets.images.iconLogo.path,
              width: 36,
              height: 36,
            ),
          ),
        ],
      ),
    );
  }
}
