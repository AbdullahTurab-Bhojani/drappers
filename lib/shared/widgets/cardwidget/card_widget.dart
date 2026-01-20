// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../../../core/theme/app_scalar.dart';
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
  final VoidCallback? onTap;

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
    this.onTap,
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
      onTap: widget.onTap,
      child: Container(
        width: AppScaler.scaleSize(context, 125),
        height: AppScaler.scaleHeight(context, 180),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: isNetworkImage
                ? NetworkImage(widget.assetImage)
                : AssetImage(widget.assetImage) as ImageProvider,
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: widget.showSaveIcon
              ? EdgeInsets.only(
                  left: AppScaler.scaleSize(context, 8),
                  top: AppScaler.scaleHeight(context, 5),
                  bottom: AppScaler.scaleHeight(context, 5),
                  right: AppScaler.scaleSize(context, 5),
                )
              : EdgeInsets.only(top: AppScaler.scaleHeight(context, 5)),
          child: Stack(
            children: [
              if (widget.index == 0 && widget.showLiveTvBadge)
                Align(
                  alignment: Alignment.topRight,
                  child: _liveTvBadge(context),
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
                    child: _moreInfoButton(context),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _liveTvBadge(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppScaler.scaleSize(context, 4),
        vertical: AppScaler.scaleHeight(context, 2),
      ),
      decoration: BoxDecoration(
        color: AppColors.colorFF0000,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: AppScaler.scaleSize(context, 6),
            height: AppScaler.scaleHeight(context, 6),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.wDark,
            ),
          ),
          SizedBox(width: AppScaler.scaleSize(context, 4)),
          PoppinsText(
            context,
            'Live TV',
            fontSize: PoppinsFontSizeVariant.size8,
            fontWeight: PoppinsFontWeightVariant.bold,
            color: AppColors.wDark,
          ),
        ],
      ),
    );
  }

  Widget _moreInfoButton(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: AppScaler.scaleHeight(context, 5)),
      padding: EdgeInsets.symmetric(
        horizontal: AppScaler.scaleSize(context, 12),
      ),
      height: AppScaler.scaleHeight(context, 36),
      decoration: BoxDecoration(
        color: AppColors.color121212.withOpacity(0.6),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.info_outline,
            size: AppScaler.scaleSize(context, 12),
            color: AppColors.white,
          ),
          SizedBox(width: AppScaler.scaleSize(context, 8)),
          PoppinsText(
            context,
            'More Info',
            fontSize: PoppinsFontSizeVariant.size12,
            fontWeight: PoppinsFontWeightVariant.medium,
            color: AppColors.wDark,
          ),
        ],
      ),
    );
  }
}
