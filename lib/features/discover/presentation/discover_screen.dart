// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/extensions/theme_extension.dart';
import '../../../../drappers.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../shared/widgets/app_bar/main_app_bar.dart';
import '../../../../shared/widgets/cardwidget/card_widget.dart';
import '../../../../shared/widgets/podcardswidget/podcards_widget.dart';
import '../../../shared/widgets/documentries_card/documentries_card_widget.dart';
import '../../../shared/widgets/genreboxwidget.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List trendingimages = [
      Assets.images.trendingimage1.path,
      Assets.images.trendingimage2.path,
      Assets.images.trendingimage3.path,
      Assets.images.trendingimage4.path,
      Assets.images.trendingimage5.path,
      Assets.images.trendingimage6.path,
      Assets.images.trendingimage7.path,
    ];

    List<String> podcardimages = [
      Assets.images.podcastimage1.path,
      Assets.images.podcastimage2.path,
      Assets.images.podcastimage3.path,
      Assets.images.podcastimage4.path,
      Assets.images.podcastimage5.path,
    ];
    List<String> documentriescard = [
      Assets.images.documentriesimage1.path,
      Assets.images.documentriesimage2.path,
      Assets.images.documentriesimage3.path,
      Assets.images.documentriesimage4.path,
      Assets.images.documentriesimage5.path,
      Assets.images.documentriesimage6.path,
    ];
    List<String> genretitle = [
      'All',
      'Live pitches',
      'Success Store',
      'Podcasts',
      'Shows',
      'Reels',
    ];
    final Map<String, String> genreRoutes = {
      'All': '/LivepitchesScreen',
      'Live pitches': '/LivepitchesScreen',
      'Success Store': '/LivepitchesScreen',
      'Podcasts': '/LivepitchesScreen',
      'Shows': '/LivepitchesScreen',
      'Reels': '/LivepitchesScreen',
    };
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;
    bool canExit = false;

    return WillPopScope(
      onWillPop: () async {
        if (!canExit) {
          canExit = true;
          return false;
        }

        return true;
      },
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                Assets.images.screensbg.path,
                fit: BoxFit.cover,
              ),
            ),

            Column(
              children: [
                AppMainBar(
                  width: 133,
                  leadingText: "Discover",
                  title: "",
                  centerTitle: false,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  actions: [
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,

                      onTap: () {
                        context.pushNamed(AppRoutes.searchscreen.name);
                      },
                      child: Image.asset(
                        Assets.images.searchstokeicon.path,
                        width: 24,
                        height: 24,
                        color: customColors.textColor,
                      ),
                    ),
                    SizedBox(width: 15),
                  ],
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
                                'Genre',
                                fontSize: PoppinsFontSizeVariant.size16,
                                fontWeight: PoppinsFontWeightVariant.medium,
                                color: customColors.textColor,
                              ),
                            ],
                          ),

                          SizedBox(height: 20),

                          SizedBox(
                            height: 56,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              separatorBuilder: (context, index) =>
                                  SizedBox(width: 15),
                              itemCount: genretitle.length,
                              itemBuilder: (context, index) {
                                final title = genretitle[index];

                                return GenreBoxWidget(
                                  title: title,
                                  showBorder: index == 0,
                                  onTap: () {
                                    final route = genreRoutes[title];
                                    if (route != null) {
                                      context.push(route);
                                    }
                                  },
                                );
                              },
                            ),
                          ),

                          SizedBox(height: 30),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PoppinsText(
                                'Trending Show',
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
                                  context.pushNamed(
                                    AppRoutes.trendingshow.name,
                                  );
                                },
                                title: "View More",
                              ),
                            ],
                          ),

                          SizedBox(height: 20),

                          SizedBox(
                            height: 180,
                            child: ListView.separated(
                              padding: EdgeInsets.zero,
                              clipBehavior: Clip.none,
                              scrollDirection: Axis.horizontal,
                              separatorBuilder: (context, index) =>
                                  SizedBox(width: 15),
                              itemCount: trendingimages.length,
                              itemBuilder: (context, index) {
                                return CardWidget(
                                  assetImage: trendingimages[index],
                                  showSaveIcon: false,
                                  fromEpisode: false,
                                  allowGuestNavigation: false,
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
                              padding: EdgeInsets.zero,
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
                                  fontSizeVariant:
                                      PoppinsFontSizeVariant.size14,
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
                                  context.pushNamed(
                                    AppRoutes.documentries.name,
                                  );
                                },
                                title: "View More",
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            height: 180,
                            child: ListView.separated(
                              padding: EdgeInsets.zero,
                              clipBehavior: Clip.none,
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
          ],
        ),
      ),
    );
  }
}
