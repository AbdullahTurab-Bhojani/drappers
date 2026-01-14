// ignore_for_file: deprecated_member_use, avoid_print, unused_element, unnecessary_underscores

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
import '../../../shared/widgets/full_screen_imagescreen.dart';
import '../../../shared/widgets/genreboxwidget.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  BetterPlayerController? _betterPlayerController;
  BetterPlayerController? get controller => _betterPlayerController;
  File? videoFile;
  final String videoUrl = 'assets/images/livefullview.mp4';

  @override
  void initState() {
    super.initState();
    _initPlayer();
  }

  void _videoListener() {
    if (!mounted) return;
    setState(() {});
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
    try {
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

      _betterPlayerController!.videoPlayerController!.addListener(
        _videoListener,
      );

      setState(() {});

      setState(() {});
    } catch (e) {
      print('Error initializing player: $e');
      setState(() {});
    }
  }

  @override
  void dispose() {
    _betterPlayerController?.videoPlayerController?.removeListener(
      _videoListener,
    );
    _betterPlayerController?.dispose();
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
      appBar: AppMainBar(
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
          SizedBox(width: AppScaler.scaleSize(context, 22)),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.images.screensbg.path),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            // SizedBox(height: 30),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: AppScaler.scaleSize(context, 20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SizedBox(height: AppScaler.scaleHeight(context, 20)),
                    FullscreenImageScreen(
                      imagePath: Assets.images.livetvnew.path,
                      title: "We're Training Heroes of Future!",
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
                            onTap: () {
                              if (index == 1) {
                                context.pushNamed(
                                  AppRoutes.livepitchesScreen.name,
                                );
                              }
                            },
                          );
                        },
                      ),
                    ),

                    SizedBox(height: AppScaler.scaleHeight(context, 30)),

                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        PoppinsText(
                          context,
                          'Trending Show',
                          fontSize: PoppinsFontSizeVariant.size16,
                          fontWeight: PoppinsFontWeightVariant.medium,
                          color: customColors.textColor,
                        ),
                        AppButton(
                          buttonSize: Size(80, 25),
                          color: Colors.transparent,
                          borderColor: customColors.textColor.withOpacity(0.5),
                          borderWidth: 1,
                          fontSize: PoppinsFontSizeVariant.size12,
                          fontWeight: PoppinsFontWeightVariant.regular,
                          border: true,
                          onPressed: () {
                            if (_betterPlayerController != null) {
                              _betterPlayerController!.pause();
                            }
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
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (_, _) =>
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

                    Row(
                      mainAxisAlignment: .spaceBetween,
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
                          borderColor: customColors.textColor.withOpacity(0.5),
                          borderWidth: 1,
                          fontSize: PoppinsFontSizeVariant.size12,
                          fontWeight: PoppinsFontWeightVariant.regular,
                          border: true,
                          onPressed: () {
                            if (_betterPlayerController != null) {
                              _betterPlayerController!.pause();
                            }
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
                          borderColor: customColors.textColor.withOpacity(0.5),
                          borderWidth: 1,
                          fontSize: PoppinsFontSizeVariant.size12,
                          fontWeight: PoppinsFontWeightVariant.regular,
                          border: true,
                          onPressed: () {
                            if (_betterPlayerController != null) {
                              _betterPlayerController!.pause();
                            }
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
      ),
    );
  }
}
