import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_scalar.dart';
import '../../../drappers.dart';
import '../popupmenuitem/popupmenu_widget.dart';

class PodcardsWidget extends StatefulWidget {
  final String title;
  final bool showSaveIcon;
  final PoppinsFontSizeVariant fontSizeVariant;

  final String assetImage;

  const PodcardsWidget({
    super.key,
    required this.assetImage,
    required this.title,
    required this.showSaveIcon,
    required this.fontSizeVariant,
  });

  @override
  State<PodcardsWidget> createState() => _PodcardsWidgetState();
}

class _PodcardsWidgetState extends State<PodcardsWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,

      onTap: () {
        context.pushNamed(AppRoutes.contentDetail.name);
      },
      child: Container(
        width: AppScaler.scaleSize(context, 125),
        height: AppScaler.scaleHeight(context, 180),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(widget.assetImage),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
