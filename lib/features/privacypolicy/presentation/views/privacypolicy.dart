import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/extensions/theme_extension.dart';
import '../../../../core/theme/app_scalar.dart';
import '../../../../drappers.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../shared/widgets/app_bar/main_app_bar.dart';
import '../../../../shared/widgets/title_subtitle_widget.dart';
import '../../../setting&preferences/providers/static_content_provider.dart';

class PrivacypolicyScreen extends ConsumerStatefulWidget {
  const PrivacypolicyScreen({super.key});

  @override
  ConsumerState<PrivacypolicyScreen> createState() =>
      _PrivacypolicyScreenState();
}

class _PrivacypolicyScreenState extends ConsumerState<PrivacypolicyScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;
    final double paddingValue = 20.0;

    final privacyAsync = ref.watch(staticContentProvider('privacyPolicy'));

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.images.screensbg.path),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppMainBar(
          leading: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => Navigator.of(context).pop(),
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Image.asset(
                "assets/images/backicon.png",
                width: 20,
                height: 20,
              ),
            ),
          ),
          title: "Privacy Policy",
          centerTitle: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppScaler.scaleSize(context, 20),
            vertical: AppScaler.scaleHeight(context, 20),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.submitticket0E0E0E,
              borderRadius: BorderRadius.circular(20),
            ),
            child: privacyAsync.when(
              loading: () => Center(
                child: LoadingWidget(color: AppColors.buttoncolor.first),
              ),
              error: (e, _) => Center(
                child: Text(
                  e.toString(),
                  style: TextStyle(color: customColors.textColor),
                ),
              ),
              data: (content) {
                return SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(
                    paddingValue,
                    20,
                    paddingValue,
                    20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PoppinsText(
                        context,
                        "Last updated: ${content.data.modifiedOn.toLocal().toString().split(' ').first}",
                        color: customColors.textColor,
                        fontSize: PoppinsFontSizeVariant.size16,
                        fontWeight: PoppinsFontWeightVariant.medium,
                      ),
                      SizedBox(height: AppScaler.scaleHeight(context, 16)),

                      TitleSubtitleWidget(
                        title: "Privacy Policy",
                        subtitle: content.data.value,
                        colors: customColors,
                      ),

                      SizedBox(height: AppScaler.scaleHeight(context, 20)),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
