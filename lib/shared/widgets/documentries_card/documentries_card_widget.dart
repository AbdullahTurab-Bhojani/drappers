import 'package:flutter/material.dart';

import '../../../core/extensions/theme_extension.dart';
import '../../../drappers.dart';
import '../popupmenuitem/popupmenu_widget.dart';

class DocumentriesCardWidget extends StatefulWidget {
  final String AssetImage;

  const DocumentriesCardWidget({super.key, required this.AssetImage});

  @override
  State<DocumentriesCardWidget> createState() => _DocumentriesCardWidgetState();
}

class _DocumentriesCardWidgetState extends State<DocumentriesCardWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;
    return Container(
      width: 125,
      height: 358,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(widget.AssetImage),
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