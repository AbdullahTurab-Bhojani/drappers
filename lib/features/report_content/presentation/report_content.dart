import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/extensions/theme_extension.dart';
import '../../../../drappers.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../shared/widgets/app_bar/main_app_bar.dart';
import '../widgets/report_content_widget.dart';

class ReportItem {
  final String title;
  final String subtitle;
  bool isValue;

  ReportItem({
    required this.title,
    required this.subtitle,
    required this.isValue,
  });
}

class ReportContent extends StatefulWidget {
  const ReportContent({super.key});

  @override
  State<ReportContent> createState() => _ReportContentState();
}

class _ReportContentState extends State<ReportContent> {
  final List<ReportItem> _reportcontenr = [
    ReportItem(
      title: "Inappropriate Content",
      subtitle: "Violence, sexual content, hate speech, or offensive material",
      isValue: false,
    ),
    ReportItem(
      title: "Technical/Playback Issue",
      subtitle: "Video not playing, audio problems, or streaming issues",
      isValue: false,
    ),
    ReportItem(
      title: "Subtitle/Audio Issue",
      subtitle: "Incorrect translations, sync issues, or missing subtitles",
      isValue: false,
    ),
    ReportItem(
      title: "Incorrect Metadata",
      subtitle: "Wrong description, cast info, or content details",
      isValue: false,
    ),
    ReportItem(
      title: "Broken or Duplicate Content",
      subtitle: "Duplicate titles, wrong order, or accessibility issues",
      isValue: false,
    ),
    ReportItem(title: "", isValue: false, subtitle: "Something Else"),
  ];
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;
    const double horizontalPadding = 15.0;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.images.screensbg.path),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppMainBar(
              leading: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Image.asset(
                    "assets/images/backicon.png",
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
              title: "",
              centerTitle: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: 10.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PoppinsText(
                      "Report Content",
                      fontSize: PoppinsFontSizeVariant.size24,
                      fontWeight: PoppinsFontWeightVariant.semiBold,
                      color: customColors.textColor,
                    ),
                    SizedBox(height: 20,),
                    PoppinsText(
                      "Help us improve your experience by sharing what's wrong.",
                      fontSize: PoppinsFontSizeVariant.size16,
                      fontWeight: PoppinsFontWeightVariant.regular,
                      color: customColors.textColor,
                    ),
                    SizedBox(height: 30.0),
                    PoppinsText(
                      "Select the Issue Category",
                      fontSize: PoppinsFontSizeVariant.size16,
                      fontWeight: PoppinsFontWeightVariant.regular,
                      color: customColors.textColor,
                    ),
                    SizedBox(height: 30),
                    ListView.separated(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _reportcontenr.length,
                      itemBuilder: (context, index) {
                        final item = _reportcontenr[index];

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              for (var i = 0; i < _reportcontenr.length; i++) {
                                _reportcontenr[i].isValue = false;
                              }

                              _reportcontenr[index].isValue = true;
                              isSelected = _reportcontenr[index].isValue = true;
                            });
                          },
                          child: ReportContentWidget(
                            item.title,
                            item.subtitle,
                            item.isValue,
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: 10);
                      },
                    ),
                    SizedBox(height: 30.0),
                    if (isSelected)
                      AppButton(
                        onPressed: () {
                          context.push(
                            AppRoutes.reportContentSomehingElse.path,
                          );
                        },
                        title: "Submit",
                      ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
