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

  final GlobalKey _iconKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: widget.showSaveIcon
          ? MainAxisAlignment.spaceBetween
          : MainAxisAlignment.end,
      children: [
        if (widget.showSaveIcon)
          Image.asset(Assets.images.saveIcon.path, width: 30, height: 30),

        GestureDetector(
          key: _iconKey,
          behavior: HitTestBehavior.translucent,
          onTap: () => _showMenuBelowIcon(context, customColors),
          child: Image.asset(
            Assets.images.dotsIcon.path,
            width: 17,
            height: 17,
          ),
        ),
      ],
    );
  }

  void _showMenuBelowIcon(BuildContext context, AppCustomColors customColors) {
    final RenderBox renderBox =
        _iconKey.currentContext!.findRenderObject() as RenderBox;

    final Offset offset = renderBox.localToGlobal(Offset.zero);
    final Size size = renderBox.size;

    showMenu<String>(
      context: context,
      color: AppColors.dRegular,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      position: RelativeRect.fromLTRB(
        offset.dx + (size.width / 2) - 90, 
        offset.dy + size.height + 0, 
        offset.dx,
        offset.dy,
      ),
      items: [
        _buildMenuItem(
          routePath: AppRoutes.reportContent.name,
          iconPath: Assets.images.reporticon.path,
          text: 'Report',
          customColors: customColors,
        ),
        _buildMenuItem(
          routePath: AppRoutes.reportContent.name,
          iconPath: Assets.images.interestedicon.path,
          text: 'Interested',
          customColors: customColors,
        ),
        _buildMenuItem(
          routePath: AppRoutes.reportContent.name,
          iconPath: Assets.images.notinterestedicon.path,
          text: 'Not Interested',
          customColors: customColors,
        ),
      ],
    );
  }

  PopupMenuItem<String> _buildMenuItem({
    required String routePath,
    required String iconPath,
    required String text,
    required AppCustomColors customColors,
  }) {
    return PopupMenuItem<String>(
      value: text,
      onTap: () {
        context.pushNamed(routePath);
      },
      child: SizedBox(
        width: 140,
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
