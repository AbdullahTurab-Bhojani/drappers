// ignore_for_file: deprecated_member_use, sized_box_for_whitespace, unused_element, unused_field, unused_local_variable, unnecessary_null_comparison

import 'dart:io';
import 'package:better_player_plus/better_player_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import '../../../../core/extensions/theme_extension.dart';
import '../../../../core/theme/app_scalar.dart';
import '../../../../drappers.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../shared/widgets/app_bar/main_app_bar.dart';
import '../../../../shared/widgets/cardwidget/card_widget.dart';
import '../../../../shared/widgets/documentries_card/documentries_card_widget.dart';
import '../../../../shared/widgets/guestloginwidget.dart';
import '../../../../shared/widgets/home_banner.dart';
import '../../../../shared/widgets/more_info_bottom_sheet.dart';
import '../../../../shared/widgets/podcardswidget/podcards_widget.dart';
import '../../../../shared/widgets/popupmenuitem/popupmenu_widget.dart';
import '../../../../shared/widgets/reelcard/reelcard_widget.dart';
import '../../../../shared/widgets/watch_history.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  bool get showSaveIcon => false;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showControls = false;
  final posterPath = '/mnt/data/Live Tv.png';
  bool _wasPlayingBeforeNavigation = false;
  late BetterPlayerController _betterPlayerController;
  File? videoFile;
  bool _controlsVisible = false;

  bool showLoader = false;
  final String videoUrl = 'assets/images/livefullview.mp4';

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  Future<File> assetToFile(String assetPath, {String? fileName}) async {
    setState(() => showLoader = true);

    final name = fileName ?? assetPath.split('/').last;
    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/$name');

    if (!await file.exists()) {
      final byteData = await rootBundle.load(assetPath);
      await file.writeAsBytes(byteData.buffer.asUint8List());
    }

    setState(() {
      videoFile = file;
      showLoader = false;
    });

    return file;
  }

  void _hideControlsAfterDelay() {
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted &&
          _betterPlayerController.videoPlayerController!.value.isPlaying) {
        setState(() => _controlsVisible = false);
      }
    });
  }

  // @override
  // void initState() {
  //   super.initState();
  //   _initializePlayer();
  // }

  Future<void> _initializePlayer() async {
    setState(() => showLoader = true);

    await assetToFile(videoUrl);

    BetterPlayerConfiguration config = BetterPlayerConfiguration(
      aspectRatio: 16 / 9,
      fit: BoxFit.cover,
      autoPlay: true,
      handleLifecycle: true,
      subtitlesConfiguration: const BetterPlayerSubtitlesConfiguration(
        fontSize: 16,
        fontColor: Colors.white,
        outlineColor: Colors.black,
      ),
      controlsConfiguration: const BetterPlayerControlsConfiguration(
        showControls: false,
      ),
    );

    BetterPlayerDataSource source = BetterPlayerDataSource(
      BetterPlayerDataSourceType.file,
      videoFile!.path,
    );
    _betterPlayerController = BetterPlayerController(
      config,
      betterPlayerDataSource: source,
    );

    _betterPlayerController.videoPlayerController!.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });

    _hideControlsAfterDelay();

    setState(() => showLoader = false);

    _hideControlsAfterDelay();

    setState(() => showLoader = false);
  }

  @override
  void dispose() {
    _betterPlayerController.dispose();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$minutes:$seconds";
  }

  Future<void> _navigateToFullscreenPlayer() async {
    if (!_betterPlayerController.videoPlayerController!.value.isPlaying) return;

    if (GuestHelper.isGuest) {
      GuestHelper.checkGuest(context);
      return;
    }

    _wasPlayingBeforeNavigation =
        _betterPlayerController.videoPlayerController!.value.isPlaying;

    if (_wasPlayingBeforeNavigation) {
      await _betterPlayerController.pause();
    }

    // Navigate to fullscreen screen if needed
    // await Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => newliveScreen(
    //       videoController: _betterPlayerController,
    //       wasPlaying: _wasPlayingBeforeNavigation,
    //     ),
    //   ),
    // );

    if (_wasPlayingBeforeNavigation && mounted) {
      await _betterPlayerController.play();
      _wasPlayingBeforeNavigation = false;
    }
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
      Assets.images.reel1.path,
      Assets.images.reel2.path,
      Assets.images.reel3.path,
      Assets.images.reel4.path,
      Assets.images.reel5.path,
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
    List<String> hometab = [
      'Live Pitches',
      'Success Stories',
      'Overnight Success',
      'Entrepreneur Stories',
    ];

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
                  width: AppScaler.scaleSize(context, 285),
                  leadingText: "Welcome Back John!",
                  title: "",
                  centerTitle: false,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  actions: [
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        if (GuestHelper.isGuest) {
                          GuestHelper.checkGuest(context);
                          return;
                        }
                        context.pushNamed('searchscreen');
                      },
                      child: Image.asset(
                        Assets.images.searchstokeicon.path,
                        width: AppScaler.scaleSize(context, 24),
                        height: AppScaler.scaleHeight(context, 24),
                        color: customColors.textColor,
                      ),
                    ),
                    SizedBox(width: AppScaler.scaleSize(context, 16)),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        if (_betterPlayerController.isVideoInitialized() !=
                            null) {
                          _betterPlayerController.pause();
                        }
                        if (GuestHelper.isGuest) {
                          GuestHelper.checkGuest(context);
                          return;
                        }
                        context.pushNamed('notificationScreen');
                      },
                      child: Stack(
                        children: [
                          Image.asset(
                            Assets.images.notificationsiconnew.path,
                            width: AppScaler.scaleSize(context, 24),
                            height: AppScaler.scaleHeight(context, 24),
                            color: customColors.textColor,
                          ),
                          Positioned(
                            top: 0,
                            right: 2,
                            child: Container(
                              width: AppScaler.scaleSize(context, 8),
                              height: AppScaler.scaleHeight(context, 8),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppScaler.scaleSize(context, 20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: AppScaler.scaleHeight(context, 20)),
                          SizedBox(
                            height: AppScaler.scaleHeight(context, 45),
                            child: ListView.separated(
                              padding: EdgeInsets.zero,
                              clipBehavior: Clip.none,
                              scrollDirection: Axis.horizontal,
                              separatorBuilder: (context, index) => SizedBox(
                                width: AppScaler.scaleSize(context, 10),
                              ),
                              shrinkWrap: true,
                              itemCount: hometab.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () {
                                    if (_betterPlayerController
                                            .isVideoInitialized() !=
                                        null) {
                                      _betterPlayerController.pause();
                                    }
                                    if (GuestHelper.isGuest) {
                                      GuestHelper.checkGuest(context);
                                      return;
                                    }
                                    context.pushNamed(
                                      AppRoutes.livepitchesScreen.name,
                                    );
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: AppScaler.scaleSize(
                                        context,
                                        16,
                                      ),
                                      vertical: AppScaler.scaleHeight(
                                        context,
                                        8,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                        color: AppColors.shadegreycolor6B6B6B,
                                        width: 1,
                                      ),
                                    ),
                                    child: Center(
                                      child: PoppinsText(
                                        context,
                                        hometab[index],
                                        fontSize: PoppinsFontSizeVariant.size16,
                                        fontWeight:
                                            PoppinsFontWeightVariant.regular,
                                        color: customColors.textColor,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: AppScaler.scaleHeight(context, 30)),
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.35),
                                    blurRadius: 30,
                                    spreadRadius: 4,
                                    offset: Offset(0, 6),
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: SizedBox(
                                  width: AppScaler.scaleSize(context, 400),
                                  height: AppScaler.scaleHeight(context, 450),
                                  child: Stack(
                                    children: [
                                      _betterPlayerController
                                                  .isVideoInitialized() !=
                                              null
                                          ? BetterPlayer(
                                              controller:
                                                  _betterPlayerController,
                                            )
                                          : Container(),
                                      Container(
                                        color: Colors.black.withOpacity(0.18),
                                      ),

                                      if (_betterPlayerController
                                              .isVideoInitialized() !=
                                          null)
                                        GestureDetector(
                                          behavior: HitTestBehavior.opaque,
                                          onTap: () {
                                            // if (GuestHelper.isGuest) {
                                            //   GuestHelper.checkGuest(context);
                                            //   return;
                                            // }
                                            setState(
                                              () => _showControls =
                                                  !_showControls,
                                            );
                                          },
                                          child: Center(
                                            child: AnimatedOpacity(
                                              duration: Duration(
                                                milliseconds: 50,
                                              ),
                                              opacity: _showControls ? 1 : 0,
                                              child: Container(
                                                padding: EdgeInsets.all(12),
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: IconButton(
                                                  icon: Icon(
                                                    _betterPlayerController
                                                            .isPlaying()!
                                                        ? Icons.pause_circle
                                                        : Icons.play_circle,
                                                    size: AppScaler.scaleSize(
                                                      context,
                                                      70,
                                                    ),
                                                  ),
                                                  onPressed: () async {
                                                    setState(() {
                                                      final videoPosition =
                                                          _betterPlayerController
                                                              .videoPlayerController!
                                                              .value
                                                              .position;
                                                      final videoDuration =
                                                          _betterPlayerController
                                                              .videoPlayerController!
                                                              .value
                                                              .duration;

                                                      if (_betterPlayerController
                                                          .isPlaying()!) {
                                                        _betterPlayerController
                                                            .pause();
                                                      } else {
                                                        if (videoPosition >=
                                                            videoDuration!) {
                                                          _betterPlayerController
                                                              .seekTo(
                                                                Duration.zero,
                                                              );
                                                        }
                                                        _betterPlayerController
                                                            .play();
                                                      }
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      Positioned(
                                        top: AppScaler.scaleHeight(context, 16),
                                        left: AppScaler.scaleSize(context, 14),
                                        right: AppScaler.scaleSize(context, 14),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: PoppinsText(
                                                context,
                                                'Meet The Drapers - Live',
                                                color: AppColors.white,
                                                fontWeight:
                                                    PoppinsFontWeightVariant
                                                        .medium,
                                                fontSize: PoppinsFontSizeVariant
                                                    .size14,
                                              ),
                                            ),
                                            PopupmenuWidget(
                                              showSaveIcon: false,
                                            ),
                                          ],
                                        ),
                                      ),

                                      Positioned(
                                        bottom: AppScaler.scaleHeight(
                                          context,
                                          10,
                                        ),
                                        left: AppScaler.scaleSize(context, 12),
                                        right: AppScaler.scaleSize(context, 12),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: AppScaler.scaleHeight(
                                                context,
                                                8,
                                              ),
                                            ),
                                            if (_betterPlayerController !=
                                                    null &&
                                                _betterPlayerController!
                                                        .videoPlayerController !=
                                                    null &&
                                                _betterPlayerController!
                                                    .videoPlayerController!
                                                    .value
                                                    .isPlaying)
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Slider(
                                                      activeColor:
                                                          AppColors.white,
                                                      inactiveColor: AppColors
                                                          .white
                                                          .withOpacity(0.3),
                                                      min: 0,
                                                      max: _betterPlayerController
                                                          .videoPlayerController!
                                                          .value
                                                          .duration!
                                                          .inMilliseconds
                                                          .toDouble(),
                                                      value: _betterPlayerController
                                                          .videoPlayerController!
                                                          .value
                                                          .position
                                                          .inMilliseconds
                                                          .clamp(
                                                            0,
                                                            _betterPlayerController
                                                                .videoPlayerController!
                                                                .value
                                                                .duration!
                                                                .inMilliseconds,
                                                          )
                                                          .toDouble(),
                                                      onChanged: (value) {
                                                        _betterPlayerController
                                                            .videoPlayerController!
                                                            .seekTo(
                                                              Duration(
                                                                milliseconds:
                                                                    value
                                                                        .toInt(),
                                                              ),
                                                            );
                                                      },
                                                    ),
                                                  ),
                                                  Text(
                                                    _format(
                                                      _betterPlayerController
                                                          .videoPlayerController!
                                                          .value
                                                          .position,
                                                    ),
                                                    style: TextStyle(
                                                      color: AppColors.white,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: AppScaler.scaleSize(
                                                      context,
                                                      15,
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    behavior:
                                                        HitTestBehavior.opaque,
                                                    onTap: () {
                                                      _betterPlayerController
                                                          .videoPlayerController!
                                                          .pause();
                                                      // if (GuestHelper.isGuest) {
                                                      //   GuestHelper.checkGuest(
                                                      //     context,
                                                      //   );
                                                      //   return;
                                                      // }
                                                      context.pushNamed(
                                                        AppRoutes
                                                            .videoScreen
                                                            .name,
                                                      );
                                                    },
                                                    child: Image.asset(
                                                      Assets
                                                          .images
                                                          .screenrotationicon
                                                          .path,
                                                      width:
                                                          AppScaler.scaleSize(
                                                            context,
                                                            24,
                                                          ),
                                                      height:
                                                          AppScaler.scaleHeight(
                                                            context,
                                                            24,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              
                              ),
                            ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PoppinsText(
                                context,
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
                                  // if (GuestHelper.isGuest) {
                                  //   GuestHelper.checkGuest(context);
                                  //   return;
                                  // }
                                  context.pushNamed('trendingshow');
                                },
                                title: "View More",
                              ),
                            ],
                          ),

                          SizedBox(height: AppScaler.scaleHeight(context, 20)),

                          SizedBox(
                            height: AppScaler.scaleHeight(context, 180),
                            child: ListView.separated(
                              padding: EdgeInsets.zero,
                              clipBehavior: Clip.none,
                              scrollDirection: Axis.horizontal,
                              separatorBuilder: (context, index) => SizedBox(
                                width: AppScaler.scaleSize(context, 15),
                              ),
                              itemCount: trendingimages.length,
                              itemBuilder: (context, index) {
                                return CardWidget(
                                  assetImage: trendingimages[index],
                                  showSaveIcon: false,
                                  fromEpisode: false,
                                  allowGuestNavigation: false,
                                  index: index,
                                  showMenuOnly: true,
                                  showMoreInfo: index == 0,
                                  onMoreInfoTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      useRootNavigator: true,
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      builder: (context) =>
                                          MoreInfoBottomSheet(),
                                    );
                                  },
                                  showLiveTvBadge: true,
                                );
                              },
                            ),
                          ),
                          SizedBox(height: AppScaler.scaleHeight(context, 30)),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PoppinsText(
                                context,
                                'Continue Watching',
                                fontSize: PoppinsFontSizeVariant.size16,
                                fontWeight: PoppinsFontWeightVariant.medium,
                                color: customColors.textColor,
                              ),
                              AppButton(
                                onPressed: () {
                                  _betterPlayerController.pause();
                                  if (GuestHelper.isGuest) {
                                    GuestHelper.checkGuest(context);
                                    return;
                                  }
                                  context.pushNamed('continueWatchingViewmore');
                                },
                                title: "View More",
                                buttonSize: Size(80, 25),
                                color: Colors.transparent,
                                borderColor: customColors.textColor.withOpacity(
                                  0.5,
                                ),
                                borderWidth: 1,
                                fontSize: PoppinsFontSizeVariant.size12,
                                fontWeight: PoppinsFontWeightVariant.regular,
                                border: true,
                              ),
                            ],
                          ),
                          SizedBox(height: AppScaler.scaleHeight(context, 20)),
                          SizedBox(
                            height: AppScaler.scaleHeight(context, 180),
                            child: ListView.separated(
                              padding: EdgeInsets.zero,
                              clipBehavior: Clip.none,
                              scrollDirection: Axis.horizontal,
                              separatorBuilder: (context, index) => SizedBox(
                                width: AppScaler.scaleSize(context, 15),
                              ),
                              itemCount: trendingimages.length,
                              itemBuilder: (context, index) {
                                return WatchHistory(
                                  assetImage: trendingimages[index],
                                  showSaveIcon: false,
                                );
                              },
                            ),
                          ),
                          SizedBox(height: AppScaler.scaleHeight(context, 30)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PoppinsText(
                                context,
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
                                  // if (GuestHelper.isGuest) {
                                  //   GuestHelper.checkGuest(context);
                                  //   return;
                                  // }
                                  context.pushNamed('podcasts');
                                },

                                title: "View More",
                              ),
                            ],
                          ),
                          SizedBox(height: AppScaler.scaleHeight(context, 20)),

                          SizedBox(
                            height: AppScaler.scaleHeight(context, 180),
                            child: ListView.separated(
                              padding: EdgeInsets.zero,
                              clipBehavior: Clip.none,
                              scrollDirection: Axis.horizontal,
                              separatorBuilder: (context, index) => SizedBox(
                                width: AppScaler.scaleSize(context, 15),
                              ),
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
                          SizedBox(height: AppScaler.scaleHeight(context, 30)),
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
                              _betterPlayerController.pause();
                              if (GuestHelper.isGuest) {
                                GuestHelper.checkGuest(context);
                                return;
                              }
                              context.pushNamed('applyPitch');
                            },
                          ),
                          SizedBox(height: AppScaler.scaleHeight(context, 30)),
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
                              _betterPlayerController.pause();
                              // if (GuestHelper.isGuest) {
                              //   GuestHelper.checkGuest(context);
                              //   return;
                              // }
                              context.pushNamed('voteForStartupScreen');
                            },
                          ),

                          SizedBox(height: AppScaler.scaleHeight(context, 30)),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PoppinsText(
                                context,
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
                                  context.pushNamed('reelWidget');
                                },
                                child: AppButton(
                                  buttonSize: Size(80, 25),
                                  color: Colors.transparent,
                                  borderColor: customColors.textColor
                                      .withOpacity(0.5),
                                  borderWidth: 1,
                                  fontSize: PoppinsFontSizeVariant.size12,
                                  fontWeight: PoppinsFontWeightVariant.regular,
                                  border: true,
                                  onPressed: () {
                                    // if (GuestHelper.isGuest) {
                                    //   GuestHelper.checkGuest(context);
                                    //   return;
                                    // }
                                    context.pushNamed('reelWidget');
                                  },
                                  title: "View More",
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: AppScaler.scaleHeight(context, 20)),

                          SizedBox(
                            height: AppScaler.scaleHeight(context, 273),
                            child: ListView.separated(
                              padding: EdgeInsets.zero,
                              clipBehavior: Clip.none,
                              scrollDirection: Axis.horizontal,
                              separatorBuilder: (context, index) => SizedBox(
                                width: AppScaler.scaleSize(context, 15),
                              ),
                              itemCount: reelimages.length,
                              itemBuilder: (context, index) {
                                return ReelcardWidget(
                                  reelCardHeight: AppScaler.scaleHeight(
                                    context,
                                    273,
                                  ),
                                  reelCardWidth: AppScaler.scaleSize(
                                    context,
                                    149,
                                  ),
                                  fontSizeVariant:
                                      PoppinsFontSizeVariant.size12,
                                  assetImagePath: reelimages[index],
                                  title: reelTitles[index],
                                  showSaveIcon: false,
                                );
                              },
                            ),
                          ),
                          SizedBox(height: AppScaler.scaleHeight(context, 30)),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PoppinsText(
                                context,
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
                                  _betterPlayerController.pause();

                                  // if (GuestHelper.isGuest) {
                                  //   GuestHelper.checkGuest(context);
                                  //   return;
                                  // }
                                  context.pushNamed('documentries');
                                },
                                title: "View More",
                              ),
                            ],
                          ),
                          SizedBox(height: AppScaler.scaleHeight(context, 20)),
                          SizedBox(
                            height: AppScaler.scaleHeight(context, 180),
                            child: ListView.separated(
                              padding: EdgeInsets.zero,
                              clipBehavior: Clip.none,
                              scrollDirection: Axis.horizontal,
                              separatorBuilder: (context, index) => SizedBox(
                                width: AppScaler.scaleSize(context, 15),
                              ),
                              itemCount: documentriescard.length,
                              itemBuilder: (context, index) {
                                return DocumentriesCardWidget(
                                  assetImage: documentriescard[index],
                                  showSaveIcon: false,
                                );
                              },
                            ),
                          ),

                          SizedBox(height: AppScaler.scaleHeight(context, 10)),
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
