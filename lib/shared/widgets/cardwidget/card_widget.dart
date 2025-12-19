import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../drappers.dart';
import '../guestloginwidget.dart';
import '../popupmenuitem/popupmenu_widget.dart';

class CardWidget extends StatefulWidget {
  final bool showSaveIcon;
  final bool fromEpisode;
  final String assetImage;
  final bool allowGuestNavigation;

  const CardWidget({
    super.key,
    required this.assetImage,
    required this.showSaveIcon,
    required this.fromEpisode,
    required this.allowGuestNavigation,
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
        if (widget.fromEpisode == true) {
          context.pushNamed(AppRoutes.videoScreen.name);
        } else {
          context.pushNamed(AppRoutes.contentDetail.name);
        }
      },

      child: Container(
        margin: EdgeInsets.zero,
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
              : EdgeInsetsGeometry.only(top: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PopupmenuWidget(showSaveIcon: widget.showSaveIcon),

              // PoppinsText(
              //   widget.title,
              //   fontSize: PoppinsFontSizeVariant.size14,
              //   fontWeight: PoppinsFontWeightVariant.medium,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
