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

    final isSomethingElse = widget.title.isEmpty;

    return InkWell(
      child: Container(
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
            !(widget.isVisible ?? false)
                ? const Icon(Icons.circle_outlined)
                : Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(
                        Icons.circle_outlined,
                        size: 24,
                        color: customColors.buttonColors.first,
                      ),
                      Icon(
                        Icons.circle,
                        size: 12,
                        color: customColors.buttonColors.first,
                      ),
                    ],
                  ),
            SizedBox(width: 10),
            Expanded(
              child: isSomethingElse
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PoppinsText(
                        context,
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
                          context,
                          widget.title,
                          fontSize: PoppinsFontSizeVariant.size12,
                          fontWeight: PoppinsFontWeightVariant.regular,
                          color: customColors.labelColor,
                        ),
                        SizedBox(height: 5.0),
                        PoppinsText(
                          context,
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
      ),
    );
  }
}
