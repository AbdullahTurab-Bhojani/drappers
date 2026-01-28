// ignore_for_file: deprecated_member_use, unused_element, use_build_context_synchronously

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/extensions/theme_extension.dart';
import '../../../core/theme/app_scalar.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';
import '../../../shared/widgets/app_bar/main_app_bar.dart';
import '../../../shared/widgets/featured_episode_card.dart';
import '../../voteforstartup/provider/startup_vote_provider.dart';
import '../provider/startup_detail_provider.dart';
import 'package:share_plus/share_plus.dart';

class Startupdetails extends ConsumerStatefulWidget {
  const Startupdetails({super.key, required this.startupId});

  final int startupId;
  @override
  ConsumerState<Startupdetails> createState() => _StartupdetailsState();
}

class _TagChip extends StatelessWidget {
  final String label;
  final AppCustomColors customColors;

  const _TagChip({required this.label, required this.customColors});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: customColors.greyColor, width: 1),
      ),
      child: PoppinsText(
        context,
        label,
        fontSize: PoppinsFontSizeVariant.size12,
        fontWeight: PoppinsFontWeightVariant.regular,
        color: customColors.textColor,
      ),
    );
  }
}

class _CompanyInfoRow extends StatelessWidget {
  final String label;
  final String value;
  final AppCustomColors customColors;

  const _CompanyInfoRow({
    required this.label,
    required this.value,
    required this.customColors,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppScaler.scaleHeight(context, 6),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PoppinsText(
            context,
            '$label:',
            fontSize: PoppinsFontSizeVariant.size14,
            fontWeight: PoppinsFontWeightVariant.regular,
            color: customColors.labelColor,
          ),
          PoppinsText(
            context,
            value,
            fontSize: PoppinsFontSizeVariant.size14,
            fontWeight: PoppinsFontWeightVariant.medium,
            color: customColors.textColor,
          ),
        ],
      ),
    );
  }
}

class _StartupdetailsState extends ConsumerState<Startupdetails> {
  bool isSaved = false;
  bool isVoted = false;

  double sliderValue = 40;

  @override
  Widget build(BuildContext context) {
    final asyncStartup = ref.watch(startupDetailProvider(widget.startupId));
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
            child: Image.asset(
              "assets/images/backicon.png",
              width: AppScaler.scaleSize(context, 20),
              height: AppScaler.scaleHeight(context, 20),
            ),
          ),
          title: "Startup Details",
          centerTitle: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                SharePlus.instance.share(
                  ShareParams(text: 'check out my website https://example.com'),
                );
              },
              child: Image.asset(
                Assets.images.shareicon.path,
                height: AppScaler.scaleHeight(context, 18),
                width: AppScaler.scaleSize(context, 18),
              ),
            ),
            SizedBox(width: AppScaler.scaleSize(context, 15)),
          ],
        ),
        body: asyncStartup.when(
          loading: () =>
              Center(child: LoadingWidget(color: AppColors.buttoncolor.first)),
          error: (e, _) => Center(
            child: Text(
              e.toString(),
              style: const TextStyle(color: Colors.red),
            ),
          ),
          data: (startup) {
            if (startup == null) {
              return const Center(child: Text("Startup not found"));
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    context.pushNamed(
                      AppRoutes.videoScreen.name,
                      extra: startup.videoLink,
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: AppScaler.scaleHeight(context, 215),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: startup.thumbnailUrl != null
                            ? CachedNetworkImageProvider(startup.thumbnailUrl!)
                            : CachedNetworkImageProvider(
                                'https://mis.ihc.gov.pk/img/no-video.jpg',
                              ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: AppScaler.scaleHeight(context, 10),
                          right: AppScaler.scaleSize(context, 10),
                          child: Image.asset(Assets.images.muteicon.path),
                        ),
                        Positioned(
                          top: AppScaler.scaleHeight(context, 10),
                          right: AppScaler.scaleSize(context, 10),
                          child: GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () => context.pop(),
                            child: Container(
                              width: AppScaler.scaleSize(context, 30),
                              height: AppScaler.scaleHeight(context, 30),
                              decoration: BoxDecoration(
                                color: AppColors.color000011,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.close,
                                color: AppColors.white,
                                size: AppScaler.scaleFont(context, 16),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FeaturedEpisodeCard(
                          startupModel: startup,
                          onVotePressed: () async {
                            try {
                              await ref.read(startupVoteProvider(startup.id))();
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Vote failed: ${e.toString()}'),
                                ),
                              );
                            }
                          },
                        ),
                        SizedBox(height: AppScaler.scaleHeight(context, 20)),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
