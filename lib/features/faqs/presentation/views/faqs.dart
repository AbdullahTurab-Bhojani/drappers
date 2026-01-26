import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/extensions/theme_extension.dart';
import '../../../../../core/theme/app_scalar.dart';
import '../../../../../drappers.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../shared/widgets/app_bar/main_app_bar.dart';
import '../../provider/faq_provider.dart';

class FaqsScreen extends ConsumerStatefulWidget {
  const FaqsScreen({super.key});

  @override
  ConsumerState<FaqsScreen> createState() => _FaqsScreenState();
}

class _FaqsScreenState extends ConsumerState<FaqsScreen> {
  Set<int> expandedIndices = {};

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;

    final faqAsync = ref.watch(faqProvider);

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.images.screensbg.path),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppMainBar(
              leading: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => Navigator.of(context).pop(),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: AppScaler.scaleSize(context, 20),
                  ),
                  child: Image.asset(
                    "assets/images/backicon.png",
                    width: AppScaler.scaleSize(context, 20),
                    height: AppScaler.scaleHeight(context, 20),
                  ),
                ),
              ),
              title: "FAQ's",
              centerTitle: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            Expanded(
              child: faqAsync.when(
                loading: () => Center(
                  child: LoadingWidget(color: AppColors.buttoncolor.first),
                ),
                error: (e, _) => Center(child: Text(e.toString())),
                data: (faqModel) {
                  final faqs = faqModel.data;
                  return ListView.builder(
                    padding: EdgeInsets.only(
                      top: AppScaler.scaleHeight(context, 10),
                    ),
                    itemCount: faqs.length,
                    itemBuilder: (context, index) {
                      final faq = faqs[index];
                      final isExpanded = expandedIndices.contains(index);
                      return Padding(
                        padding: EdgeInsets.only(
                          left: AppScaler.scaleSize(context, 20),
                          right: AppScaler.scaleSize(context, 20),
                          bottom: AppScaler.scaleHeight(context, 24),
                        ),
                        child: Theme(
                          data: theme.copyWith(
                            dividerColor: Colors.transparent,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.submitticket0E0E0E,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ExpansionTile(
                              key: ValueKey(index),
                              initiallyExpanded: isExpanded,
                              backgroundColor: Colors.transparent,
                              collapsedBackgroundColor: Colors.transparent,
                              title: PoppinsText(
                                context,
                                faq.question,
                                fontSize: PoppinsFontSizeVariant.size16,
                                fontWeight: PoppinsFontWeightVariant.semiBold,
                                color: customColors.textColor,
                              ),
                              trailing: isExpanded
                                  ? Icon(Icons.remove, color: AppColors.white)
                                  : Icon(Icons.add, color: AppColors.white),
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: AppScaler.scaleSize(context, 20),
                                    right: AppScaler.scaleSize(context, 20),
                                    bottom: AppScaler.scaleHeight(context, 16),
                                  ),
                                  child: PoppinsText(
                                    context,
                                    faq.answer,
                                    fontSize: PoppinsFontSizeVariant.size12,
                                    fontWeight:
                                        PoppinsFontWeightVariant.regular,
                                    color: customColors.textColor,
                                  ),
                                ),
                              ],
                              onExpansionChanged: (expanded) {
                                setState(() {
                                  if (expanded) {
                                    expandedIndices.add(index);
                                  } else {
                                    expandedIndices.remove(index);
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
