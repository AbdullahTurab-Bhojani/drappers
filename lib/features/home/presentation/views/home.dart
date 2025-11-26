// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart';
import '../../../../core/extensions/theme_extension.dart';
import '../../../../drappers.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../shared/widgets/app_bar/main_app_bar.dart';
import '../../../../shared/widgets/cardwidget/card_widget.dart';
import '../../../../shared/widgets/documentries_card/documentries_card_widget.dart';
import '../../../../shared/widgets/home_banner.dart';
import '../../../../shared/widgets/more_info_bottom_sheet.dart';
import '../../../../shared/widgets/podcardswidget/podcards_widget.dart';
import '../../../../shared/widgets/reelcard/reelcard_widget.dart';
import '../../../../shared/widgets/watch_history.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  VideoPlayerController? _controller;
  bool _showControls = true;
  final posterPath = '/mnt/data/Live Tv.png';
  VoidCallback? _controllerListener;

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

    // Define listener and store reference
    _controllerListener = () {
      setState(() {}); // Update UI whenever controller changes
    };

    _controller!.addListener(_controllerListener!);
  }

  @override
  void dispose() {
    // Remove the listener properly
    if (_controllerListener != null) {
      _controller!.removeListener(_controllerListener!);
    }

    // Dispose controller
    _controller?.dispose();
    super.dispose();
  }

  String _format(Duration d) {
    String two(int n) => n.toString().padLeft(2, '0');
    final minutes = two(d.inMinutes.remainder(60));
    final seconds = two(d.inSeconds.remainder(60));
    final hours = d.inHours;
    return hours > 0 ? '$hours:$minutes:$seconds' : '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    List<String> documentriescard = [
      Assets.images.documentaries1.path,
      Assets.images.documentaries2.path,
      Assets.images.documentaries3.path,
      Assets.images.documentaries4.path,
      Assets.images.documentaries5.path,
      Assets.images.documentaries6.path,
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
      Assets.images.trendingshowimage1.path,
      Assets.images.trendingshowimage2.path,
      Assets.images.trendingshowimage3.path,
      Assets.images.trendingshowimage4.path,
      Assets.images.trendingshowimage5.path,
      Assets.images.trendingshowimage6.path,
      Assets.images.trendingshowimage7.path,
    ];
    List<String> hometab = [
      'Live Pitches',
      'Success Stories',
      'Overnight Success',
      'Entrepreneur Stories',
    ];
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
                width: 285,
                leadingText: "Welcome Back John!",
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
                  SizedBox(width: 16),
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(AppRoutes.notificationScreen.name);
                    },
                    child: Stack(
                      children: [
                        Image.asset(
                          Assets.images.notificationsiconnew.path,
                          width: 24,
                          height: 24,
                          color: customColors.textColor,
                        ),
                        Positioned(
                          top: 0,
                          right: 2,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                ],
              ),

              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30),

                        SizedBox(
                          height: 45,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (context, index) =>
                                SizedBox(width: 10),
                            shrinkWrap: true,
                            itemCount: hometab.length,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                    color: customColors.greyColor,
                                    width: 1,
                                  ),
                                ),
                                child: Center(
                                  child: PoppinsText(
                                    hometab[index],
                                    fontSize: PoppinsFontSizeVariant.size16,
                                    fontWeight:
                                        PoppinsFontWeightVariant.regular,
                                    color: customColors.textColor,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),

                        SizedBox(height: 30),

                        Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(18),
                            child: SizedBox(
                              width: 400,
                              height: 500,
                              child: Stack(
                                children: [
                                  _controller!.value.isInitialized
                                      ? VideoPlayer(_controller!)
                                      : (File(posterPath).existsSync()
                                            ? Image.file(
                                                File(posterPath),
                                                fit: BoxFit.cover,
                                              )
                                            : Container(
                                                color: Colors.grey[900],
                                              )),
                        
                                  Container(
                                    color: Colors.black.withOpacity(0.18),
                                  ),
                        
                                  Positioned(
                                    top: 12,
                                    left: 14,
                                    right: 14,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: PoppinsText(
                                            'Meet The Drapers - Live',
                                            color: Colors.white,
                                            fontWeight:
                                                PoppinsFontWeightVariant
                                                    .medium,
                                            fontSize:
                                                PoppinsFontSizeVariant.size14,
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 6,
                                          ),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.circle,
                                                size: 8,
                                                color: Colors.red,
                                              ),
                                              SizedBox(width: 6),
                                              PoppinsText(
                                                'Live TV',
                                                color: Colors.white,
                                                fontWeight:
                                                    PoppinsFontWeightVariant
                                                        .regular,
                                                fontSize:
                                                    PoppinsFontSizeVariant
                                                        .size12,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Icon(
                                          Icons.more_vert,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                        
                                  Positioned.fill(
                                    child: GestureDetector(
                                      onTap: () => setState(
                                        () => _showControls = !_showControls,
                                      ),
                                      child: Center(
                                        child: AnimatedOpacity(
                                          duration: Duration(
                                            milliseconds: 200,
                                          ),
                                          opacity: _showControls ? 1 : 0,
                                          child: Container(
                                            padding: EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                              color: Colors.black.withOpacity(
                                                0.45,
                                              ),
                                              shape: BoxShape.circle,
                                            ),
                                            child: IconButton(
                                              iconSize: 36,
                                              color: Colors.white,
                                              icon: Icon(
                                                _controller!.value.isPlaying
                                                    ? Icons.pause
                                                    : Icons.play_arrow,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  _controller!.value.isPlaying
                                                      ? _controller!.pause()
                                                      : _controller!.play();
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                        
                                  Positioned(
                                    bottom: 10,
                                    left: 12,
                                    right: 12,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 14,
                                              vertical: 6,
                                            ),
                                            height: 36,
                                            decoration: BoxDecoration(
                                              color: Colors.black.withOpacity(
                                                0.35,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(
                                                  Icons.info_outline,
                                                  size: 18,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(width: 8),
                                                PoppinsText(
                                                  'More Info',
                                                  color:
                                                      customColors.textColor,
                                                  fontSize:
                                                      PoppinsFontSizeVariant
                                                          .size12,
                                                  fontWeight:
                                                      PoppinsFontWeightVariant
                                                          .medium,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
                              border: true,
                              onPressed: () {
                                context.goNamed(AppRoutes.trendingshow.name);
                              },
                              title: "View More",
                              borderColor: customColors.textColor,
                              borderWidth: 1,
                              fontSize: PoppinsFontSizeVariant.size12,
                              fontWeight: PoppinsFontWeightVariant.regular,
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
                              return GestureDetector(
                                onTap: () {
                                  context.pushNamed(
                                    AppRoutes.contentDetail.name,
                                  );
                                },
                                child: CardWidget(
                                  assetImage: trendingimages[index],
                                  showSaveIcon: false,
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 30),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            PoppinsText(
                              'Continue Watching',
                              fontSize: PoppinsFontSizeVariant.size16,
                              fontWeight: PoppinsFontWeightVariant.medium,
                              color: customColors.textColor,
                            ),
                            AppButton(
                              buttonSize: Size(80, 25),
                              color: Colors.transparent,
                              border: true,
                              onPressed: () {
                                context.pushNamed(
                                  AppRoutes.continueWatchingViewmore.name,
                                );
                              },
                              title: "View More",
                              borderColor: customColors.textColor,
                              borderWidth: 1,
                              fontSize: PoppinsFontSizeVariant.size12,
                              fontWeight: PoppinsFontWeightVariant.regular,
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
                              return WatchHistory(
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
                              borderWidth: 1,
                              fontSize: PoppinsFontSizeVariant.size12,
                              fontWeight: PoppinsFontWeightVariant.regular,
                              border: true,
                              onPressed: () {
                                context.goNamed(AppRoutes.podcasts.name);
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
                        HomeBanner(
                          title: 'Ready to Pitch?',
                          subtitle:
                              'Submit your company details for\nmeet the Drapers',
                          buttonText: 'Apply to Pitch',
                          buttonColor: Colors.white,
                          buttonBorderColor: Colors.transparent,
                          backgroundImage: Assets.images.banner1.path,
                          buttonBorderWidth: 0,
                          buttonGradient: [],
                          onTap: () {
                            context.pushNamed(AppRoutes.applyPitch.name);
                          },
                        ),
                        SizedBox(height: 30),
                        HomeBanner(
                          title: "Vote for Startups!",
                          subtitle: "Cast your vote in the \ncompetition. ",
                          buttonText: "Vote Now",
                          buttonColor: Color(0xff582983),
                          buttonBorderColor: Color(0xff9333E9),
                          backgroundImage: Assets.images.banner2.path,
                          buttonBorderWidth: 2,
                          buttonGradient: [
                            Color(0xff582983),
                            Color(0xff582983),
                          ],
                          onTap: () {
                            context.pushNamed(
                              AppRoutes.voteForStartupScreen.name,
                            );
                          },
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
                            AppButton(
                              buttonSize: Size(80, 25),
                              color: Colors.transparent,
                              borderColor: customColors.textColor,
                              borderWidth: 1,
                              fontSize: PoppinsFontSizeVariant.size12,
                              fontWeight: PoppinsFontWeightVariant.regular,
                              border: true,
                              onPressed: () {
                                context.goNamed(AppRoutes.reelWidget.name);
                              },
                              title: "View More",
                            ),
                          ],
                        ),
                        SizedBox(height: 20),

                        SizedBox(
                          height: 273,
                          child: ListView.separated(
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
                              borderColor: customColors.textColor,
                              borderWidth: 1,
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
