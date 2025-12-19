// ignore_for_file: file_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/extensions/theme_extension.dart';
import '../../../../drappers.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../shared/widgets/app_bar/main_app_bar.dart';
import '../../../shared/widgets/cardwidget/card_widget.dart';
import '../../../shared/widgets/documentries_card/documentries_card_widget.dart';
import '../../../shared/widgets/guestloginwidget.dart';
import '../../../shared/widgets/podcardswidget/podcards_widget.dart';
import '../../../shared/widgets/reelcard/reelcard_widget.dart';

class LivepitchesScreen extends StatefulWidget {
  const LivepitchesScreen({super.key});

  @override
  State<LivepitchesScreen> createState() => _LivepitchesScreenState();
}

class _LivepitchesScreenState extends State<LivepitchesScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> documentriescard = [
      Assets.images.documentriesimage1.path,
      Assets.images.documentriesimage2.path,
      Assets.images.documentriesimage3.path,
      Assets.images.documentriesimage4.path,
      Assets.images.documentriesimage5.path,
      Assets.images.documentriesimage6.path,
    ];
    List<String> podcardimages = [
      Assets.images.podcastimage1.path,
      Assets.images.podcastimage2.path,
      Assets.images.podcastimage3.path,
      Assets.images.podcastimage4.path,
      Assets.images.podcastimage5.path,
    ];
    List<String> reelimages = [
      Assets.images.reelimage1.path,
      Assets.images.reelimage2.path,
      Assets.images.reelimage3.path,
      Assets.images.reelimage4.path,
      Assets.images.reelimage5.path,
    ];
    List<String> reelTitles = [
      'Rio De Janeiro - Meet The Drappers',
      'Brand Acceleration - Meet The Drappers',
      'Season 5, India - Meet The Drappers',
      'The Frontier - Meet The Drappers',
      'Season 6, Saudi Arabia - Meet The Drappers',
    ];
    List trendingimages = [
      Assets.images.trendingimage1.path,
      Assets.images.trendingimage2.path,
      Assets.images.trendingimage3.path,
      Assets.images.trendingimage4.path,
      Assets.images.trendingimage5.path,
      Assets.images.trendingimage6.path,
      Assets.images.trendingimage7.path,
    ];
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;

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
                behavior: HitTestBehavior.opaque,
                onTap: () => Navigator.of(context).pop(),
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Image.asset(
                    "assets/images/backicon.png",
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
              title: "Live Pitches",
              centerTitle: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PoppinsText(
                            'Trending Shows',
                            fontSize: PoppinsFontSizeVariant.size16,
                            fontWeight: PoppinsFontWeightVariant.medium,
                            color: customColors.textColor,
                          ),
                          AppButton(
                            buttonSize: Size(80, 25),
                            color: Colors.transparent,
                            borderColor: customColors.textColor.withOpacity(
                              0.5,
                            ),
                            borderWidth: 1,
                            fontSize: PoppinsFontSizeVariant.size12,
                            fontWeight: PoppinsFontWeightVariant.regular,
                            border: true,
                            onPressed: () {
                              if (GuestHelper.isGuest) {
                                GuestHelper.checkGuest(context);
                                return;
                              }
                              context.pushNamed(AppRoutes.trendingshow.name);
                            },
                            title: "View More",
                          ),
                        ],
                      ),

                      SizedBox(height: 20),

                      SizedBox(
                        height: 180,
                        child: ListView.separated(
                          clipBehavior: Clip.none,
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 15),
                          itemCount: trendingimages.length,
                          itemBuilder: (context, index) {
                            return CardWidget(
                              assetImage: trendingimages[index],
                              showSaveIcon: false,
                              fromEpisode: true, allowGuestNavigation: false,
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 30),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PoppinsText(
                            'Podcasts',
                            fontSize: PoppinsFontSizeVariant.size16,
                            fontWeight: PoppinsFontWeightVariant.medium,
                            color: customColors.textColor,
                          ),
                          AppButton(
                            buttonSize: Size(80, 25),
                            color: Colors.transparent,
                            borderColor: customColors.textColor.withOpacity(
                              0.5,
                            ),
                            borderWidth: 1,
                            fontSize: PoppinsFontSizeVariant.size12,
                            fontWeight: PoppinsFontWeightVariant.regular,
                            border: true,
                            onPressed: () {
                              if (GuestHelper.isGuest) {
                                GuestHelper.checkGuest(context);
                                return;
                              }
                              context.pushNamed(AppRoutes.podcasts.name);
                            },

                            title: "View More",
                          ),
                        ],
                      ),
                      SizedBox(height: 20),

                      SizedBox(
                        height: 180,
                        child: ListView.separated(
                          clipBehavior: Clip.none,
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 15),
                          itemCount: podcardimages.length,
                          itemBuilder: (context, index) {
                            return PodcardsWidget(
                              assetImage: podcardimages[index],
                              title: '',
                              showSaveIcon: false,
                              fontSizeVariant: PoppinsFontSizeVariant.size14,
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PoppinsText(
                            'Reels',
                            fontSize: PoppinsFontSizeVariant.size16,
                            fontWeight: PoppinsFontWeightVariant.medium,
                            color: customColors.textColor,
                          ),
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,

                            onTap: () {
                              if (GuestHelper.isGuest) {
                                GuestHelper.checkGuest(context);
                                return;
                              }
                              context.pushNamed(AppRoutes.reelWidget.name);
                            },
                            child: AppButton(
                              buttonSize: Size(80, 25),
                              color: Colors.transparent,
                              borderColor: customColors.textColor.withOpacity(
                                0.5,
                              ),
                              borderWidth: 1,
                              fontSize: PoppinsFontSizeVariant.size12,
                              fontWeight: PoppinsFontWeightVariant.regular,
                              border: true,
                              onPressed: () {
                                if (GuestHelper.isGuest) {
                                  GuestHelper.checkGuest(context);
                                  return;
                                }
                                context.pushNamed(AppRoutes.reelWidget.name);
                              },
                              title: "View More",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),

                      SizedBox(
                        height: 273,
                        child: ListView.separated(
                          padding: EdgeInsets.zero,
                          clipBehavior: Clip.none,
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 15),
                          itemCount: reelimages.length,
                          itemBuilder: (context, index) {
                            return ReelcardWidget(
                              reelCardHeight: 273,
                              reelCardWidth: 149,
                              fontSizeVariant: PoppinsFontSizeVariant.size12,
                              assetImagePath: reelimages[index],
                              title: reelTitles[index],
                              showSaveIcon: false,
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 30),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PoppinsText(
                            'Documentaries',
                            fontSize: PoppinsFontSizeVariant.size16,
                            fontWeight: PoppinsFontWeightVariant.medium,
                            color: customColors.textColor,
                          ),
                          AppButton(
                            buttonSize: Size(80, 25),
                            color: Colors.transparent,
                            borderColor: customColors.textColor.withOpacity(
                              0.5,
                            ),
                            borderWidth: 1,
                            fontSize: PoppinsFontSizeVariant.size12,
                            fontWeight: PoppinsFontWeightVariant.regular,
                            border: true,
                            onPressed: () {
                              if (GuestHelper.isGuest) {
                                GuestHelper.checkGuest(context);
                                return;
                              }
                              context.pushNamed(AppRoutes.documentries.name);
                            },
                            title: "View More",
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        height: 180,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 15),
                          itemCount: documentriescard.length,
                          itemBuilder: (context, index) {
                            return DocumentriesCardWidget(
                              assetImage: documentriescard[index],
                              showSaveIcon: false,
                            );
                          },
                        ),
                      ),

                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
