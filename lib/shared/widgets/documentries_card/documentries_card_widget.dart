import 'package:flutter/material.dart';
import '../popupmenuitem/popupmenu_widget.dart';

class DocumentriesCardWidget extends StatefulWidget {
  final String assetImage;

  const DocumentriesCardWidget({super.key, required this.assetImage});

  @override
  State<DocumentriesCardWidget> createState() => _DocumentriesCardWidgetState();
}

class _DocumentriesCardWidgetState extends State<DocumentriesCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
        padding: EdgeInsets.only(left: 0, top: 0, bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           PopupmenuWidget(),

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