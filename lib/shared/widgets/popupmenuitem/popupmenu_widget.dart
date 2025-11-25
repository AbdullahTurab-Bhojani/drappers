// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/extensions/theme_extension.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';

class PopupmenuWidget extends StatefulWidget {
  final bool showSaveIcon;

  const PopupmenuWidget({super.key, this.showSaveIcon = true});

  @override
  State<PopupmenuWidget> createState() => _PopupmenuWidgetState();
}

class _PopupmenuWidgetState extends State<PopupmenuWidget> {
  final double _menuItemSpacing = 12;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: widget.showSaveIcon == true
          ? MainAxisAlignment.spaceBetween
          : MainAxisAlignment.end,
      children: [
        // Save Icon
        if (widget.showSaveIcon)
          Image.asset(Assets.images.saveIcon.path, width: 30, height: 30),

        Align(
          alignment: Alignment.centerRight, // optional: align it to right
          child: SizedBox(
            width: 30, // same width as your icon
            height: 20, // same height as your icon
            child: PopupMenuButton<String>(
              padding: EdgeInsets.zero,
              color: AppColors.dRegular,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              icon: Image.asset(
                Assets.images.dotsIcon.path,
                width: 17,
                height: 17,
              ),
              offset: const Offset(-15, 40),
              onSelected: (value) {
                print('$value clicked');
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                _buildMenuItem(
                  iconPath: Assets.images.reporticon.path,
                  text: 'Report',
                  customColors: customColors,
                ),
                _buildMenuItem(
                  iconPath: Assets.images.interestedicon.path,
                  text: 'Interested',
                  customColors: customColors,
                ),
                _buildMenuItem(
                  iconPath: Assets.images.notinterestedicon.path,
                  text: 'Not Interested',
                  customColors: customColors,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  PopupMenuItem<String> _buildMenuItem({
    required String iconPath,
    required String text,
    required AppCustomColors customColors,
  }) {
    return PopupMenuItem<String>(
      value: text,
      child: SizedBox(
        width: 120,
        child: Row(
          children: [
            Image.asset(iconPath),
            SizedBox(width: _menuItemSpacing),
            PoppinsText(
              text,
              fontSize: PoppinsFontSizeVariant.size12,
              fontWeight: PoppinsFontWeightVariant.medium,
              color: customColors.textColor,
            ),
          ],
        ),
      ),
    );
  }
}
