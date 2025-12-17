// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../core/extensions/theme_extension.dart';
import '../../../drappers.dart';

class ReportContentWidget extends StatefulWidget {
  final String title;
  final String subTitle;
  bool? isVisible;
  ReportContentWidget(this.title, this.subTitle, this.isVisible, {super.key});

  @override
  State<ReportContentWidget> createState() => _ReportContentWidgetState();
}

Set<int> expandedIndices = {};

class _ReportContentWidgetState extends State<ReportContentWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;

    // Check if it's the "Something Else" case (title is empty)
    final isSomethingElse = widget.title.isEmpty;

    return Container(
      padding: EdgeInsets.all(14.0),
      decoration: BoxDecoration(
        color: customColors.blackshade,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: isSomethingElse
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Icon
          !widget.isVisible!
              ? Icon(Icons.circle_outlined)
              : Icon(Icons.circle, color: customColors.buttonColors.first),
          SizedBox(width: 10),
          // Text
          Expanded(
            child: isSomethingElse
                ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PoppinsText(
                    widget.subTitle,
                    fontSize: PoppinsFontSizeVariant.size16,
                    fontWeight: PoppinsFontWeightVariant.regular,
                    color: customColors.textColor,
                  ),
                )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PoppinsText(
                        widget.title,
                        fontSize: PoppinsFontSizeVariant.size12,
                        fontWeight: PoppinsFontWeightVariant.regular,
                        color: customColors.labelColor,
                      ),
                      SizedBox(height: 5.0),
                      PoppinsText(
                        widget.subTitle,
                        fontSize: PoppinsFontSizeVariant.size16,
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
