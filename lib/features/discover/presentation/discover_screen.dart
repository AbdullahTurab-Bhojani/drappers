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
import '../../../core/theme/app_scalar.dart';
import '../../../shared/widgets/documentries_header.dart';
import '../../../shared/widgets/full_screen_imagescreen.dart';
import '../../../shared/widgets/genreboxwidget.dart';
import '../../../shared/widgets/podcast_header.dart';
import '../../../shared/widgets/trendingshows_header.dart';

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

    List<String> genretitle = [
      'All',
      'Live pitches',
      'Success Store',
      'Podcasts',
      'Shows',
      'Reels',
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        image: DecorationImage(
          image: AssetImage(Assets.images.screensbg.path),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
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
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppScaler.scaleSize(context, 16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
          
                TrendingshowsHeader(
                  showLiveTvBadge: false,
                  showMoreInfo: false,
                ),
          
                SizedBox(height: AppScaler.scaleHeight(context, 30)),
                PodcastHeader(),
                SizedBox(height: AppScaler.scaleHeight(context, 30)),
                DocumentriesHeader(),
                SizedBox(height: AppScaler.scaleHeight(context, 10)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
