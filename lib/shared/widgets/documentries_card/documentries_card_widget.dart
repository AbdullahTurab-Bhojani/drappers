import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../drappers.dart';
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
      onTap: () {
        context.pushNamed(AppRoutes.documentries.name);
      },
      child: Container(
        width: 125,
        height: 358,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(widget.assetImage),
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
