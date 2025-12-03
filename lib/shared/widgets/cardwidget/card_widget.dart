import 'package:flutter/material.dart';
import '../../../gen/assets.gen.dart';
import '../popupmenuitem/popupmenu_widget.dart';

class CardWidget extends StatefulWidget {
  final bool showSaveIcon;

  final String assetImage; 
  const CardWidget({super.key, required this.assetImage, required this.showSaveIcon});

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    bool isNetworkImage = widget.assetImage.startsWith('http');

    return Container(
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
         padding: widget.showSaveIcon ? EdgeInsets.only(left: 8, top: 5, bottom: 5,right: 8)  : EdgeInsetsGeometry.only(top: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           PopupmenuWidget(
             showSaveIcon: widget.showSaveIcon,
           ),

            // PoppinsText(
            //   widget.title,
            //   fontSize: PoppinsFontSizeVariant.size14,
            //   fontWeight: PoppinsFontWeightVariant.medium,
            // ),
          ],
        ),
      ),
    );
  }
}
