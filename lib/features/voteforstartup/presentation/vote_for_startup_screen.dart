// ignore_for_file: deprecated_member_use, avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_scalar.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';
import '../../../shared/widgets/app_bar/main_app_bar.dart';
import '../../../shared/widgets/custom_video_card.dart';
import '../../../shared/widgets/startup_card.dart';
import '../domain/models/startup_model.dart';
import '../provider/startup_provider.dart';
import '../provider/startup_vote_provider.dart';

class VoteForStartupScreen extends ConsumerStatefulWidget {
  const VoteForStartupScreen({super.key});

  @override
  ConsumerState<VoteForStartupScreen> createState() =>
      _VoteForStartupScreenState();
}

class _VoteForStartupScreenState extends ConsumerState<VoteForStartupScreen> {
  @override
  Widget build(BuildContext context) {
    final startupsAsync = ref.watch(startupListProvider(''));

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
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Image.asset(
              "assets/images/backicon.png",
              width: AppScaler.scaleSize(context, 20),
              height: AppScaler.scaleHeight(context, 20),
            ),
          ),
          title: "Vote for Startup",
          centerTitle: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: AppScaler.scaleSize(context, 20)),
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  context.pushNamed(AppRoutes.searchscreen.name);
                },
                child: Image.asset(
                  Assets.images.searchstokeicon.path,
                  width: AppScaler.scaleSize(context, 20),
                  height: AppScaler.scaleHeight(context, 20),
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppScaler.scaleSize(context, 20),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: AppScaler.scaleHeight(context, 10)),

                CustomVideoCard(
                  fillGradient: LinearGradient(
                    colors: [Color(0xFF1FCFFF), Color(0xFF0063FF)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  strokeColor: Colors.transparent,
                  strokeWidth: 2,
                  title: "Meet the Drapers Competition",
                  subtitle:
                      "Vote for your favourite startup from season 5, Episode 12.",
                  thumbnailPath: Assets.images.trendingimage1.path,
                  playIconPath: Assets.images.play.path,
                  height: 85,
                ),

                SizedBox(height: AppScaler.scaleHeight(context, 16)),

                CustomVideoCard(
                  strokeColor: AppColors.dGrey,
                  strokeWidth: 1,
                  title: "Voting Instructions",
                  subtitle:
                      "Lorem ipsum dolor sit amet consectetur. Lorem at elit eu facilisis. Sed cursus volutpat.",
                  thumbnailPath: Assets.images.trendingimage1.path,
                  playIconPath: Assets.images.play.path,
                  height: 85,
                ),

                SizedBox(height: AppScaler.scaleHeight(context, 16)),
                startupsAsync.when(
                  loading: () => Padding(
                    padding: EdgeInsets.only(
                      top: AppScaler.scaleHeight(context, 40),
                    ),
                    child: LoadingWidget(color: AppColors.buttoncolor.first),
                  ),

                  error: (e, _) => Padding(
                    padding: EdgeInsets.only(
                      top: AppScaler.scaleHeight(context, 40),
                    ),
                    child: Text(
                      e.toString(),
                      style: TextStyle(color: Colors.red),
                    ),
                  ),

                  data: (List<StartupModel> startups) {
                    if (startups.isEmpty) {
                      return Padding(
                        padding: EdgeInsets.only(
                          top: AppScaler.scaleHeight(context, 40),
                        ),
                        child: Text("No startups found"),
                      );
                    }

                    return Column(
                      children: startups.map((startup) {
                        return Padding(
                          padding: EdgeInsets.only(
                            bottom: AppScaler.scaleHeight(context, 16),
                          ),
                          child: StartupCard(
                            isVotedByUser: startup.isLikedByUser ?? false,
                            imagePath: startup.thumbnailUrl ?? '',
                            title: startup.startupTitle,
                            subtitle: startup.startupSubTitle,
                            description: startup.aboutStartup,
                            episodeTitle: startup.startupExpertise,
                            initialCount: 0,
                            onWatchPressed: () {
                              context.pushNamed(
                                AppRoutes.videoScreen.name,
                                extra: startup.videoLink,
                              );
                            },
                            onVotePressed: () async {
                              try {
                                await ref.read(
                                  startupVoteProvider(startup.id).future,
                                );
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Vote failed: ${e.toString()}',
                                    ),
                                  ),
                                );
                              }
                            },
                            onCardTap: () {
                              context.pushNamed(
                                AppRoutes.startupdetails.name,
                                extra: startup.id,
                              );
                            },
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
