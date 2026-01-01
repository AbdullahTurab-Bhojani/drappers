// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:better_player_plus/better_player_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../core/extensions/theme_extension.dart';
import '../../../../drappers.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../shared/widgets/app_bar/main_app_bar.dart';
import '../../../../shared/widgets/cardwidget/card_widget.dart';
import '../../../../shared/widgets/podcardswidget/podcards_widget.dart';
import '../../../core/theme/app_scalar.dart';
import '../../../shared/widgets/documentries_card/documentries_card_widget.dart';
import '../../../shared/widgets/genreboxwidget.dart';
import '../../../shared/widgets/popupmenuitem/popupmenu_widget.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  late BetterPlayerController _betterPlayerController;
  File? videoFile;
  bool _showControls = false;

  final String videoUrl = 'assets/images/livefullview.mp4';

  @override
  void initState() {
    super.initState();
    _initPlayer();
  }

  Future<File> _assetToFile(String assetPath) async {
    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/${assetPath.split('/').last}');
    if (!await file.exists()) {
      final bytes = await rootBundle.load(assetPath);
      await file.writeAsBytes(bytes.buffer.asUint8List());
    }
    return file;
  }

  Future<void> _initPlayer() async {
    videoFile = await _assetToFile(videoUrl);

    final config = BetterPlayerConfiguration(
      aspectRatio: 16 / 9,
      fit: BoxFit.cover,
      autoPlay: true,
      controlsConfiguration: const BetterPlayerControlsConfiguration(
        showControls: false,
      ),
    );

    final source = BetterPlayerDataSource(
      BetterPlayerDataSourceType.file,
      videoFile!.path,
    );

    _betterPlayerController = BetterPlayerController(
      config,
      betterPlayerDataSource: source,
    );

    setState(() {});
  }

  @override
  void dispose() {
    _betterPlayerController.dispose();
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
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;

    List<String> trendingimages = [
      Assets.images.trendingimage1.path,
      Assets.images.trendingimage2.path,
      Assets.images.trendingimage3.path,
      Assets.images.trendingimage4.path,
      Assets.images.trendingimage5.path,
    ];

    List<String> podcardimages = [
      Assets.images.podcastimage1.path,
      Assets.images.podcastimage2.path,
      Assets.images.podcastimage3.path,
      Assets.images.podcastimage4.path,
    ];

    List<String> documentriescard = [
      Assets.images.documentriesimage1.path,
      Assets.images.documentriesimage2.path,
      Assets.images.documentriesimage3.path,
    ];

    List<String> genretitle = [
      'All',
      'Live pitches',
      'Success Store',
      'Podcasts',
      'Shows',
      'Reels',
    ];

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(Assets.images.screensbg.path, fit: BoxFit.cover),
          ),
          Column(
            children: [
              AppMainBar(
                width: AppScaler.scaleSize(context, 133),
                leadingText: "Discover",
                title: "",
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: [
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(AppRoutes.searchscreen.name);
                    },
                    child: Image.asset(
                      Assets.images.searchstokeicon.path,
                      width: AppScaler.scaleSize(context, 24),
                      height: AppScaler.scaleHeight(context, 24),
                      color: customColors.textColor,
                    ),
                  ),
                  SizedBox(width: AppScaler.scaleSize(context, 15)),
                ],
              ),

              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppScaler.scaleSize(context, 20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: AppScaler.scaleHeight(context, 20)),
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
                                          controller: _betterPlayerController,
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
                                          () => _showControls = !_showControls,
                                        );
                                      },
                                      child: Center(
                                        child: AnimatedOpacity(
                                          duration: Duration(milliseconds: 50),
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
                                                PoppinsFontWeightVariant.medium,
                                            fontSize:
                                                PoppinsFontSizeVariant.size14,
                                          ),
                                        ),
                                        PopupmenuWidget(showSaveIcon: false),
                                      ],
                                    ),
                                  ),

                                  Positioned(
                                    bottom: AppScaler.scaleHeight(context, 10),
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
                                        if (_betterPlayerController != null &&
                                            _betterPlayerController!
                                                    .videoPlayerController !=
                                                null &&
                                            _betterPlayerController!
                                                .videoPlayerController!
                                                .value
                                                .isPlaying)
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Slider(
                                                  activeColor: AppColors.white,
                                                  inactiveColor: AppColors.white
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
                                                            milliseconds: value
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
                                                    AppRoutes.videoScreen.name,
                                                  );
                                                },
                                                child: Image.asset(
                                                  Assets
                                                      .images
                                                      .screenrotationicon
                                                      .path,
                                                  width: AppScaler.scaleSize(
                                                    context,
                                                    24,
                                                  ),
                                                  height: AppScaler.scaleHeight(
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

                      SizedBox(height: AppScaler.scaleHeight(context, 30)),
                      PoppinsText(
                        context,
                        'Genre',
                        fontSize: PoppinsFontSizeVariant.size16,
                        fontWeight: PoppinsFontWeightVariant.medium,
                        color: customColors.textColor,
                      ),

                      SizedBox(height: AppScaler.scaleHeight(context, 20)),

                      SizedBox(
                        height: AppScaler.scaleHeight(context, 56),
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (_, __) =>
                              SizedBox(width: AppScaler.scaleSize(context, 15)),
                          itemCount: genretitle.length,
                          itemBuilder: (context, index) {
                            return GenreBoxWidget(
                              title: genretitle[index],
                              showBorder: index == 0,
                              onTap: () {},
                            );
                          },
                        ),
                      ),

                      SizedBox(height: AppScaler.scaleHeight(context, 30)),

                      PoppinsText(
                        context,
                        'Trending Show',
                        fontSize: PoppinsFontSizeVariant.size16,
                        fontWeight: PoppinsFontWeightVariant.medium,
                        color: customColors.textColor,
                      ),

                      SizedBox(height: AppScaler.scaleHeight(context, 20)),

                      SizedBox(
                        height: AppScaler.scaleHeight(context, 180),
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (_, __) =>
                              SizedBox(width: AppScaler.scaleSize(context, 15)),
                          itemCount: trendingimages.length,
                          itemBuilder: (context, index) {
                            return CardWidget(
                              assetImage: trendingimages[index],
                              showSaveIcon: false,
                              fromEpisode: false,
                              allowGuestNavigation: false,
                              index: index,
                              showMenuOnly: true,
                              showLiveTvBadge: false,
                            );
                          },
                        ),
                      ),

                      SizedBox(height: AppScaler.scaleHeight(context, 30)),

                      PoppinsText(
                        context,
                        'Podcasts',
                        fontSize: PoppinsFontSizeVariant.size16,
                        fontWeight: PoppinsFontWeightVariant.medium,
                        color: customColors.textColor,
                      ),

                      SizedBox(height: AppScaler.scaleHeight(context, 20)),

                      SizedBox(
                        height: AppScaler.scaleHeight(context, 180),
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (_, __) =>
                              SizedBox(width: AppScaler.scaleSize(context, 15)),
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

                      SizedBox(height: AppScaler.scaleHeight(context, 30)),

                      PoppinsText(
                        context,
                        'Documentaries',
                        fontSize: PoppinsFontSizeVariant.size16,
                        fontWeight: PoppinsFontWeightVariant.medium,
                        color: customColors.textColor,
                      ),

                      SizedBox(height: AppScaler.scaleHeight(context, 20)),

                      SizedBox(
                        height: AppScaler.scaleHeight(context, 180),
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (_, __) =>
                              SizedBox(width: AppScaler.scaleSize(context, 15)),
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
            ],
          ),
        ],
      ),
    );
  }
}
