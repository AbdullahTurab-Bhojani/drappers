// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../gen/assets.gen.dart';
import '../../core/theme/app_scalar.dart';
import '../../drappers.dart';
import 'popupmenuitem/popupmenu_widget.dart';

class WatchHistory extends StatefulWidget {
  final String assetImage;
  final bool showSaveIcon;

  const WatchHistory({
    super.key,
    required this.assetImage,
    required this.showSaveIcon,
  });

  @override
  State<WatchHistory> createState() => _WatchHistoryState();
}

class _WatchHistoryState extends State<WatchHistory> {
  double _sliderValue = 60;

  @override
  Widget build(BuildContext context) {
    bool isNetworkImage = widget.assetImage.startsWith('http');

    return GestureDetector(
      behavior: HitTestBehavior.opaque,

      onTap: () {
        // if (GuestHelper.isGuest) {
        //   GuestHelper.checkGuest(context);
        //   return;
        // }
        context.pushNamed(AppRoutes.videoScreen.name);
      },
      child: Container(
        width: AppScaler.scaleSize(context, 125),
        height: AppScaler.scaleHeight(context, 180),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: isNetworkImage
                ? NetworkImage(widget.assetImage) as ImageProvider
                : AssetImage(widget.assetImage),
            fit: BoxFit.cover,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            color: Colors.black.withOpacity(0.4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                    ],
                  ),
                ),
                Image.asset(Assets.images.playwithbgicon.path),
                Padding(
                  padding: EdgeInsets.only(
                    left: AppScaler.scaleSize(context, 8),
                    right: AppScaler.scaleSize(context, 8),
                    bottom: AppScaler.scaleHeight(context, 10),
                  ),
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: AppScaler.scaleHeight(context, 3),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 0),
                    ),
                    child: Slider(
                      activeColor: AppColors.white,
                      inactiveColor: AppColors.white.withOpacity(0.5),
                      value: _sliderValue,
                      thumbColor: Colors.transparent,
                      min: 0,
                      max: 100,
                      onChanged: (v) {
                        setState(() {
                          _sliderValue = v;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
