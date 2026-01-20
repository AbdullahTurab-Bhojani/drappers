// ignore_for_file: deprecated_member_use, avoid_print

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_scalar.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';
import '../../../shared/widgets/app_bar/main_app_bar.dart';
import '../../../shared/widgets/custom_video_card.dart';
import '../../../shared/widgets/startup_card.dart';

class VoteForStartupScreen extends StatefulWidget {
  const VoteForStartupScreen({super.key});

  @override
  State<VoteForStartupScreen> createState() => _VoteForStartupScreenState();
}

class _VoteForStartupScreenState extends State<VoteForStartupScreen> {
  final List<Map<String, dynamic>> startups = [
    {
      "title": "Echo Tech Solutions",
      "subtitle": "Sustainable energy Revolution",
      "description":
          "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting.",
      "episodeTitle": "Meet the Drapers S512",
      "imagePath": Assets.images.studionew.path,
      "initialCount": 6,
    },
    {
      "title": "Future Innovations",
      "subtitle": "AI-powered solutions",
      "description":
          "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting.",
      "episodeTitle": "Meet the Drapers S513",
      "imagePath": Assets.images.studionew.path,
      "initialCount": 12,
    },
    {
      "title": "Green Energy Co",
      "subtitle": "Renewable energy solutions",
      "description":
          "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting.",
      "episodeTitle": "Meet the Drapers S514",
      "imagePath": Assets.images.studionew.path,
      "initialCount": 20,
    },
  ];

  @override
  Widget build(BuildContext context) {
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

                ...startups.map((startup) {
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: AppScaler.scaleHeight(context, 16),
                    ),
                    child: StartupCard(
                      imagePath: startup['imagePath'],
                      title: startup['title'],
                      subtitle: startup['subtitle'],
                      description: startup['description'],
                      episodeTitle: startup['episodeTitle'],
                      initialCount: startup['initialCount'],
                      onWatchPressed: () {
                        context.pushNamed(AppRoutes.videoScreen.name);
                      },
                      onVotePressed: () {
                        print('${startup['title']} vote pressed!');
                      },
                      onCardTap: () {
                        context.pushNamed(AppRoutes.startupdetails.name);
                      },
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
