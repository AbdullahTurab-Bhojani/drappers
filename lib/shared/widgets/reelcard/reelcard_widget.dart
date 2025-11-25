import 'package:flutter/material.dart';
import '../../../drappers.dart';
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
    return Container(
      width: widget.reelCardWidth,
      height: widget.reelCardHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(widget.assetImagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: widget.showSaveIcon ? EdgeInsets.only(left: 8, top: 5, bottom: 5,right: 8)  : EdgeInsetsGeometry.only(top: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PopupmenuWidget(
              showSaveIcon: widget.showSaveIcon,
            ),
            PoppinsText(
              widget.title,
              fontSize: widget.fontSizeVariant,
              fontWeight: PoppinsFontWeightVariant.medium,
            ),
          ],
        ),
      ),
    );
  }
}
