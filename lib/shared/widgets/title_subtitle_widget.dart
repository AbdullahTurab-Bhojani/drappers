import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/extensions/theme_extension.dart';
import '../../drappers.dart';
import '../../core/theme/app_scalar.dart';
import 'package:flutter_html/flutter_html.dart';

class TitleSubtitleWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final AppCustomColors colors;

  const TitleSubtitleWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: AppScaler.scaleHeight(context, 20),
            bottom: AppScaler.scaleHeight(context, 8),
          ),
          child: PoppinsText(
            context,
            title,
            color: colors.textColor,
            fontSize: PoppinsFontSizeVariant.size16,
            fontWeight: PoppinsFontWeightVariant.medium,
          ),
        ),
        Html(
          data: subtitle,
          onLinkTap: (url, attributes, element) async {
            if (url == null) return;

            final uri = Uri.parse(url);

            if (uri.scheme == 'mailto') {
              await launchUrl(uri);
            } else if (uri.scheme == 'tel') {
              await launchUrl(uri);
            } else {
              await launchUrl(uri, mode: LaunchMode.externalApplication);
            }
          },
          style: {
            "p": Style(
              fontFamily: 'Poppins',
              fontSize: FontSize(13),
              fontWeight: FontWeight.w400,
              color: colors.textColor,
              margin: Margins.zero,
            ),
            "body": Style(margin: Margins.zero),
          },
        ),
      ],
    );
  }
}
