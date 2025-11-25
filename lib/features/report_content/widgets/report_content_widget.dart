import 'package:flutter/material.dart';

import '../../../core/extensions/theme_extension.dart';
import '../../../drappers.dart';
import '../presentation/report_content.dart';

class ReportContentWidget extends StatefulWidget {
  final String title;
  final String subTitle;
   bool? isVisible;
   ReportContentWidget(this.title, this.subTitle,this.isVisible, {super.key});

  @override
  State<ReportContentWidget> createState() => _ReportContentWidgetState();
}



Set<int> expandedIndices = {};

class _ReportContentWidgetState extends State<ReportContentWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;
    return Container(
      padding: EdgeInsets.all(14.0),
      decoration: BoxDecoration(
        color: customColors.blackshade,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        !widget.isVisible!? 
        Icon(Icons.circle_outlined): Icon(Icons.circle, color: customColors.buttonColors.first,),
          SizedBox(width: 10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PoppinsText(
                  widget.title,
                  fontSize: PoppinsFontSizeVariant.size16,
                  fontWeight: PoppinsFontWeightVariant.semiBold,
                  color: customColors.textColor,
                ),
                SizedBox(height: 5.0),
                if(  widget.subTitle != "")
                PoppinsText(
                  widget.subTitle,
                  fontSize: PoppinsFontSizeVariant.size12,
                  fontWeight: PoppinsFontWeightVariant.regular,
                  color: customColors.textColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
