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
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        widget.showSaveIcon == true
            ? Image.asset(Assets.images.savereelicon.path)
            : SizedBox(),

        PopupMenuButton<String>(
          color: AppColors.dRegular,
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          icon: Image.asset(Assets.images.a3dotsicon.path),
          offset: Offset(-50, 36),
          onSelected: (value) {
            print('$value clicked');
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            PopupMenuItem<String>(
              value: 'Report',
              child: SizedBox(
                width: 120,
                child: Row(
                  children: [
                    Image.asset(Assets.images.reporticon.path),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        context.pushReplacement(AppRoutes.reportContent.path);
                      },
                      child: PoppinsText(
                        'Report',
                        fontSize: PoppinsFontSizeVariant.size12,
                        fontWeight: PoppinsFontWeightVariant.medium,
                        color: customColors.textColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            PopupMenuItem<String>(
              value: 'Interested',
              child: SizedBox(
                width: 120,
                child: Row(
                  children: [
                    Image.asset(Assets.images.interestedicon.path),
                    SizedBox(width: 10),
                    PoppinsText(
                      'Interested',
                      fontSize: PoppinsFontSizeVariant.size12,
                      fontWeight: PoppinsFontWeightVariant.medium,
                      color: customColors.textColor,
                    ),
                  ],
                ),
              ),
            ),
            PopupMenuItem<String>(
              value: 'Not Interested',
              child: SizedBox(
                width: 120,
                child: Row(
                  children: [
                    Image.asset(Assets.images.notinterestedicon.path),
                    SizedBox(width: 10),
                    PoppinsText(
                      'Not Interested',
                      fontSize: PoppinsFontSizeVariant.size12,
                      fontWeight: PoppinsFontWeightVariant.medium,
                      color: customColors.textColor,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
