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
    final RenderBox iconBox =
        _iconKey.currentContext!.findRenderObject() as RenderBox;

    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;

    final Rect iconRect =
        iconBox.localToGlobal(Offset.zero, ancestor: overlay) & iconBox.size;

    showMenu<String>(
      context: context,
      color: AppColors.dRegular,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      position: RelativeRect.fromRect(
        Rect.fromLTWH(iconRect.left - 70, iconRect.bottom + 6, 160, 0),
        Offset.zero & overlay.size,
      ),
      items: [
        _buildMenuItem(
          routePath: AppRoutes.reportContent.name,
          iconPath: Assets.images.reporticon.path,
          text: 'Report',
          customColors: customColors,
          navigate: true, // Sirf ye item navigate karega
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
    );
  }

  PopupMenuItem<String> _buildMenuItem({
    String? routePath,
    required String iconPath,
    required String text,
    required AppCustomColors customColors,
    bool navigate = false, // default false, sirf Report ke liye true
  }) {
    return PopupMenuItem<String>(
      value: text,
      onTap: () {
        if (navigate && routePath != null) {
          context.pushNamed(routePath);
        }
      },
      child: SizedBox(
        width: 126,
        height: 40,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(iconPath, height: 18),
            SizedBox(width: 12),
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
