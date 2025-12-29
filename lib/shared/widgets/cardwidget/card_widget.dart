// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../drappers.dart';
import '../popupmenuitem/popupmenu_widget.dart';

class CardWidget extends StatefulWidget {
  final bool showSaveIcon;
  final bool fromEpisode;
  final String assetImage;
  final bool allowGuestNavigation;
  final int index;
  final bool showMenuOnly;
  final bool showMoreInfo;
  final VoidCallback? onMoreInfoTap;
  final bool showLiveTvBadge;

  const CardWidget({
    super.key,
    required this.assetImage,
    required this.showSaveIcon,
    required this.fromEpisode,
    required this.allowGuestNavigation,
    required this.index,
    this.showMenuOnly = false,
    this.showMoreInfo = false,
    this.onMoreInfoTap,
    required this.showLiveTvBadge,
  });

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    bool isNetworkImage = widget.assetImage.startsWith('http');

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (widget.index == 0) {
          context.pushNamed(AppRoutes.newliveScreen.name);
        } else {
          context.pushNamed(AppRoutes.contentDetail.name);
        }
      },

      child: Container(
        width: 125,
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: isNetworkImage
                ? NetworkImage(widget.assetImage) as ImageProvider
                : AssetImage(widget.assetImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: widget.showSaveIcon
              ? EdgeInsets.only(left: 8, top: 5, bottom: 5, right: 8)
              : EdgeInsets.only(top: 5),
          child: Stack(
            children: [
              if (widget.index == 0 && widget.showLiveTvBadge)
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Container(
                      width: 50,
                      height: 20,
                      decoration: BoxDecoration(
                        color: AppColors.colorFF0000,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.wDark,
                            ),
                          ),
                          SizedBox(width: 6),
                          PoppinsText(
                            'Live TV',
                            fontSize: PoppinsFontSizeVariant.size8,
                            fontWeight: PoppinsFontWeightVariant.bold,
                            color: AppColors.wDark,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              else
                Align(
                  alignment: Alignment.topRight,
                  child: PopupmenuWidget(showSaveIcon: widget.showSaveIcon),
                ),

              if (widget.index == 0 && widget.showMoreInfo)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: widget.onMoreInfoTap,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 5),
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      height: 36,
                      decoration: BoxDecoration(
                        color: AppColors.color121212.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.info_outline,
                            size: 18,
                            color: AppColors.white,
                          ),
                          SizedBox(width: 8),
                          PoppinsText(
                            'More Info',
                            fontSize: PoppinsFontSizeVariant.size12,
                            fontWeight: PoppinsFontWeightVariant.medium,
                            color: AppColors.wDark,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
