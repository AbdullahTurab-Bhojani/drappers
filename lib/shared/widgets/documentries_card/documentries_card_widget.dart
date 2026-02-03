import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_scalar.dart';
import '../../../drappers.dart';
import '../guestloginwidget.dart';
import '../popupmenuitem/popupmenu_widget.dart';

class DocumentriesCardWidget extends StatefulWidget {
  final bool showSaveIcon;

  final String assetImage;

  const DocumentriesCardWidget({
    super.key,
    required this.assetImage,
    required this.showSaveIcon,
  });

  @override
  State<DocumentriesCardWidget> createState() => _DocumentriesCardWidgetState();
}

class _DocumentriesCardWidgetState extends State<DocumentriesCardWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        context.pushNamed(AppRoutes.contentDetail.name);
      },
      child: Container(
        width: AppScaler.scaleSize(context, 125),
        height: AppScaler.scaleHeight(context, 358),
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
            children: [PopupmenuWidget(showSaveIcon: widget.showSaveIcon)],
          ),
        ),
      ),
    );
  }
}
