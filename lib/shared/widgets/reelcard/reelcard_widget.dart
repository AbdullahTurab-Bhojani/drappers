import 'package:flutter/material.dart';
import '../../../drappers.dart';
import '../popupmenuitem/popupmenu_widget.dart';

class ReelcardWidget extends StatefulWidget {
  final String assetImagePath;
  final String title;

  const ReelcardWidget({
    super.key,
    required this.assetImagePath,
    required this.title,
  });

  @override
  State<ReelcardWidget> createState() => _ReelcardWidgetState();
}

class _ReelcardWidgetState extends State<ReelcardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125,
      height: 358,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(widget.assetImagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 0, top: 0, bottom: 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PopupmenuWidget(),
            PoppinsText(
              widget.title,
              fontSize: PoppinsFontSizeVariant.size14,
              fontWeight: PoppinsFontWeightVariant.medium,
            ),
          ],
        ),
      ),
    );
  }
}
