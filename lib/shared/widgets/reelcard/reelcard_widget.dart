// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_scalar.dart';
import '../../../drappers.dart';
import '../guestloginwidget.dart';
import '../popupmenuitem/popupmenu_widget.dart';

class ReelcardWidget extends StatefulWidget {
  final String assetImagePath;
  final String title;
  final double reelCardHeight;
  final double reelCardWidth;
  final PoppinsFontSizeVariant fontSizeVariant;
  final bool showSaveIcon;

  const ReelcardWidget({
    super.key,
    required this.assetImagePath,
    required this.title,
    required this.reelCardHeight,
    required this.reelCardWidth,
    required this.fontSizeVariant,
    required this.showSaveIcon,
  });

  @override
  State<ReelcardWidget> createState() => _ReelcardWidgetState();
}

class _ReelcardWidgetState extends State<ReelcardWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (GuestHelper.isGuest) {
          GuestHelper.checkGuest(context);
          return;
        }
        context.pushNamed(AppRoutes.reelsviewScreen.name);
      },
      child: Container(
        width: widget.reelCardWidth,
        height: widget.reelCardHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(widget.assetImagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.transparent,
                      Colors.black.withOpacity(0.9),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: widget.showSaveIcon
                  ? EdgeInsets.only(
                      left: AppScaler.scaleSize(context, 8),
                      top: AppScaler.scaleHeight(context, 5),
                      bottom: AppScaler.scaleHeight(context, 5),
                      right: AppScaler.scaleSize(context, 5),
                    )
                  : EdgeInsets.only(top: AppScaler.scaleHeight(context, 5)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PopupmenuWidget(showSaveIcon: widget.showSaveIcon),
                  PoppinsText(
                    context,
                    widget.title,
                    fontSize: widget.fontSizeVariant,
                    fontWeight: PoppinsFontWeightVariant.medium,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
