// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart';
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
  VideoPlayerController? _controller;
  final posterPath = '/mnt/data/Live Tv.png';

  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.network(
            'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
          )
          ..initialize().then((_) {
            setState(() {});
            _controller!.play();
          });

    // Keep controls visible when user interacts
    _controller!.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _controller!.removeListener(() {});
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List trendingimages = [
      Assets.images.trendingshowimage1.path,
      Assets.images.trendingshowimage2.path,
      Assets.images.trendingshowimage3.path,
      Assets.images.trendingshowimage4.path,
      Assets.images.trendingshowimage5.path,
      Assets.images.trendingshowimage6.path,
      Assets.images.trendingshowimage7.path,
    ];

    List<String> podcardimages = [
      Assets.images.podcastimage1.path,
      Assets.images.podcastimage2.path,
      Assets.images.podcastimage3.path,
      Assets.images.podcastimage4.path,
      Assets.images.podcastimage5.path,
    ];
    List<String> documentriescard = [
      Assets.images.documentaries1.path,
      Assets.images.documentaries2.path,
      Assets.images.documentaries3.path,
      Assets.images.documentaries4.path,
      Assets.images.documentaries5.path,
      Assets.images.documentaries6.path,
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
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(Assets.images.screensbg.path, fit: BoxFit.cover),
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
                  InkWell(
                    onTap: () {
                      context.pushNamed(AppRoutes.searchscreen.name);
                    },
                    child: Image.asset(
                      Assets.images.searchicon.path,
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
                              borderColor: customColors.textColor,
                              borderWidth: 0.3,
                              fontSize: PoppinsFontSizeVariant.size12,
                              fontWeight: PoppinsFontWeightVariant.regular,
                              border: true,
                              onPressed: () {
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
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (context, index) =>
                                SizedBox(width: 15),
                            itemCount: trendingimages.length,
                            itemBuilder: (context, index) {
                              return CardWidget(
                                assetImage: trendingimages[index],
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
                              'Podcasts',
                              fontSize: PoppinsFontSizeVariant.size16,
                              fontWeight: PoppinsFontWeightVariant.medium,
                              color: customColors.textColor,
                            ),
                            AppButton(
                              buttonSize: Size(80, 25),
                              color: Colors.transparent,
                              borderColor: customColors.textColor,
                              borderWidth: 0.3,
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
                              'Documentaries',
                              fontSize: PoppinsFontSizeVariant.size16,
                              fontWeight: PoppinsFontWeightVariant.medium,
                              color: customColors.textColor,
                            ),
                            AppButton(
                              buttonSize: Size(80, 25),
                              color: Colors.transparent,
                              borderColor: customColors.textColor,
                              borderWidth: 0.3,
                              fontSize: PoppinsFontSizeVariant.size12,
                              fontWeight: PoppinsFontWeightVariant.regular,
                              border: true,
                              onPressed: () {
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

                        SizedBox(height: 50),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
