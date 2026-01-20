// ignore_for_file: deprecated_member_use, sized_box_for_whitespace, unused_element, unused_field, unused_local_variable, unnecessary_null_comparison

import 'dart:io';
import 'package:better_player_plus/better_player_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import '../../../../core/extensions/theme_extension.dart';
import '../../../../core/local/domain/repositories/local_storage_repository.dart';
import '../../../../core/theme/app_scalar.dart';
import '../../../../drappers.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../shared/widgets/app_bar/main_app_bar.dart';
import '../../../../shared/widgets/continuewatching_header.dart';
import '../../../../shared/widgets/documentries_header.dart';
import '../../../../shared/widgets/full_screen_imagescreen.dart';
import '../../../../shared/widgets/guestloginwidget.dart';
import '../../../../shared/widgets/home_banner.dart';
import '../../../../shared/widgets/homeheader_tab.dart';
import '../../../../shared/widgets/podcast_header.dart';
import '../../../../shared/widgets/reels_header.dart';
import '../../../../shared/widgets/trendingshows_header.dart';
import '../../../user/domain/models/user_model.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  bool get showSaveIcon => false;

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final bool _showControls = false;
  final posterPath = '/mnt/data/Live Tv.png';
  bool _wasPlayingBeforeNavigation = false;
  BetterPlayerController? _betterPlayerController;
  BetterPlayerController? get controller => _betterPlayerController;
  File? videoFile;
  bool _controlsVisible = false;
  UserData? user;
  bool showLoader = false;
  final String videoUrl = 'assets/images/livefullview.mp4';

  @override
  void initState() {
    super.initState();
    _initializePlayer();
    _loadUser();
  }

  Future<void> _loadUser() async {
    user = await ref.read(localDataProvider).getUser();
    setState(() {});
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
          _betterPlayerController != null &&
          _betterPlayerController!.videoPlayerController!.value.isPlaying) {
        setState(() => _controlsVisible = false);
      }
    });
  }

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
        fontColor: AppColors.white,
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

    _betterPlayerController!.videoPlayerController!.addListener(() {
      if (mounted) {}
    });

    _hideControlsAfterDelay();

    setState(() => showLoader = false);
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$minutes:$seconds";
  }

  Future<void> _navigateToFullscreenPlayer() async {
    if (_betterPlayerController == null ||
        !_betterPlayerController!.videoPlayerController!.value.isPlaying) {
      return;
    }

    if (GuestHelper.isGuest) {
      GuestHelper.checkGuest(context);
      return;
    }

    _wasPlayingBeforeNavigation =
        _betterPlayerController!.videoPlayerController!.value.isPlaying;

    if (_wasPlayingBeforeNavigation) {
      await _betterPlayerController!.pause();
    }

    if (_wasPlayingBeforeNavigation && mounted) {
      await _betterPlayerController!.play();
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
    if (showLoader) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }

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
      child: Container(
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
            width: AppScaler.scaleSize(context, 285),
            leadingText: user != null
                ? (user!.firstName != null &&
                          user!.firstName!.isNotEmpty &&
                          user!.lastName != null &&
                          user!.lastName!.isNotEmpty
                      ? "Welcome Back ${user!.firstName!} ${user!.lastName!}!"
                      : "Welcome Back ${user!.fullName}!")
                : "Welcome Back Guest User!",
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
                  if (_betterPlayerController != null &&
                      _betterPlayerController!.isVideoInitialized() != null) {
                    _betterPlayerController!.pause();
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

          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppScaler.scaleSize(context, 16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeheaderTab(),
                  SizedBox(height: AppScaler.scaleHeight(context, 30)),
                  FullscreenImageScreen(
                    imagePath: Assets.images.livetvnew.path,
                    title: "We're Training Heroes of Future!",
                  ),
                  SizedBox(height: AppScaler.scaleHeight(context, 30)),

                  TrendingshowsHeader(
                    showLiveTvBadge: true,
                    showMoreInfo: true,
                  ),

                  SizedBox(height: AppScaler.scaleHeight(context, 30)),
                  ContinuewatchingHeader(),

                  SizedBox(height: AppScaler.scaleHeight(context, 30)),

                  PodcastHeader(),
                  SizedBox(height: AppScaler.scaleHeight(context, 30)),
                  HomeBanner(
                    title: 'Ready to Pitch?',
                    subtitle:
                        'Submit your company details for\nmeet the Drapers',
                    buttonText: 'Apply to Pitch',
                    buttonColor: AppColors.white,
                    buttonBorderColor: Colors.transparent,
                    backgroundImage: Assets.images.banner1.path,
                    buttonBorderWidth: 0,
                    buttonGradient: [],
                    onTap: () {
                      if (_betterPlayerController != null) {
                        _betterPlayerController!.pause();
                      }
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
                    buttonGradient: [Color(0xff582983), Color(0xff582983)],
                    onTap: () {
                      if (_betterPlayerController != null) {
                        _betterPlayerController!.pause();
                      }
                      context.pushNamed('voteForStartupScreen');
                    },
                  ),
                  SizedBox(height: AppScaler.scaleHeight(context, 30)),
                  ReelsHeader(),
                  SizedBox(height: AppScaler.scaleHeight(context, 30)),
                  DocumentriesHeader(),
                  SizedBox(height: AppScaler.scaleHeight(context, 10)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
