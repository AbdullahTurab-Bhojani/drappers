// ignore_for_file: unused_field, deprecated_member_use, sized_box_for_whitespace, unnecessary_string_interpolations

import 'dart:async';
import 'dart:io';
import 'package:better_player_plus/better_player_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';
import '../../../shared/widgets/popupmenuitem/audio_subtitle_popup.dart';
import '../../../shared/widgets/popupmenuitem/quality_popup.dart';
import '../../../shared/widgets/popupmenuitem/speed_popup.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late BetterPlayerController _betterPlayerController;

  String? _selectedSubtitle;
  String _selectedQuality = "720p";
  String _selectedSpeed = "1x";

  bool _controlsVisible = true;
  bool _isLocked = false;
  bool _showEpisodes = false;
  bool _showLockIndicator = false;
  bool showLoader = false;
  File? videoFile;

  Timer? _lockTimer;

  final String videoUrl = "assets/images/contentdetailvodep.mp4";

  final List<Map<String, String>> episodesData = List.generate(
    10,
    (index) => {
      "title": "Meet The Drapers Season 6 (2023)",
      "url": "assets/images/contentdetailvodep.mp4",
      "image": Assets.images.watchlistcard1.path,
    },
  );

  @override
  void initState() {
    super.initState();
    _setLandscapeAndFullscreen();
    _initializePlayer();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations(DeviceOrientation.values);
    _betterPlayerController.dispose();
    super.dispose();
  }

  void _setLandscapeAndFullscreen() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  Future<File> assetToFile(String assetPath, {String? fileName}) async {
    setState(() => showLoader = true);

    final name = fileName ?? assetPath.split('/').last;
    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/$name');

    if (await file.exists()) {
      setState(() {
        videoFile = file;
        showLoader = false;
      });
      return file;
    }

    final byteData = await rootBundle.load(assetPath);
    await file.writeAsBytes(byteData.buffer.asUint8List());

    setState(() {
      videoFile = file;
      showLoader = false;
    });

    return file;
  }

  Future<void> _initializePlayer() async {
    setState(() => showLoader = true);

    BetterPlayerConfiguration config = BetterPlayerConfiguration(
      aspectRatio: 16 / 9,
      fit: BoxFit.cover,
      autoPlay: true,
      handleLifecycle: true,
      subtitlesConfiguration: BetterPlayerSubtitlesConfiguration(
        fontSize: 16,
        fontColor: AppColors.white,
        outlineColor: Colors.black,
      ),
      controlsConfiguration: BetterPlayerControlsConfiguration(
        showControls: false,
      ),
    );

    await assetToFile(videoUrl);

    BetterPlayerDataSource source = BetterPlayerDataSource(
      BetterPlayerDataSourceType.file,
      videoFile!.path,
    );

    _betterPlayerController = BetterPlayerController(
      config,
      betterPlayerDataSource: source,
    );

    _betterPlayerController.videoPlayerController!.addListener(() {
      if (mounted) setState(() {});
    });

    _hideControlsAfterDelay();
    setState(() => showLoader = false);
  }

  void _hideControlsAfterDelay() {
    Future.delayed(Duration(seconds: 4), () {
      if (mounted && _betterPlayerController.isPlaying() == true) {
        setState(() => _controlsVisible = false);
      }
    });
  }

  void _toggleLock() {
    setState(() => _isLocked = !_isLocked);

    if (_isLocked) {
      _showLockIndicatorWithTimer();
    } else {
      _lockTimer?.cancel();
      setState(() => _showLockIndicator = false);
    }
  }

  void _showLockIndicatorWithTimer() {
    setState(() => _showLockIndicator = true);

    _lockTimer?.cancel();
    _lockTimer = Timer(Duration(seconds: 2), () {
      if (mounted) setState(() => _showLockIndicator = false);
    });
  }

  void _changeSpeed() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) => SpeedPopup(
        selectedSpeed: _selectedSpeed,
        onSelected: (value) {
          setState(() {
            _selectedSpeed = value;
            _betterPlayerController.setSpeed(
              double.parse(value.replaceAll('x', '')),
            );
          });
        },
      ),
    );
  }

  void _openVideoQualityPopup() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) => QualityPopup(
        selectedQuality: _selectedQuality,
        onSelected: (value) => setState(() => _selectedQuality = value),
      ),
    );
  }

  void _openAudioSubtitlePopup() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) => AudioSubtitlePopup(
        selectedValue: _selectedSubtitle,
        onSelected: (value) => setState(() => _selectedSubtitle = value),
      ),
    );
  }

  void _playEpisode(int index) {
    final source = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      episodesData[index]['url']!,
    );
    _betterPlayerController.setupDataSource(source);
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: BetterPlayer(controller: _betterPlayerController),
          ),

          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              if (!_isLocked) {
                setState(() => _controlsVisible = !_controlsVisible);
                if (_controlsVisible) _hideControlsAfterDelay();
              } else {
                _showLockIndicatorWithTimer();
              }
            },
          ),

          if (_controlsVisible)
            _buildTopBar("Finale – Meet The Drapers Season"),

          if (_controlsVisible && !_isLocked)
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Image.asset(
                      Assets.images.back10seconds.path,
                      width: 50,
                      height: 50,
                    ),
                    onPressed: () {
                      final controller =
                          _betterPlayerController.videoPlayerController!;
                      final pos = controller.value.position;
                      controller.seekTo(
                        pos - Duration(seconds: 10) >= Duration.zero
                            ? pos - Duration(seconds: 10)
                            : Duration.zero,
                      );
                    },
                  ),
                  SizedBox(width: 32),
                  IconButton(
                    icon: Icon(
                      _betterPlayerController
                              .videoPlayerController!
                              .value
                              .isPlaying
                          ? Icons.pause_circle
                          : Icons.play_circle,
                      size: 70,
                      color: AppColors.white,
                    ),
                    onPressed: () {
                      final controller =
                          _betterPlayerController.videoPlayerController!;
                      final pos = controller.value.position;
                      final dur = controller.value.duration ?? Duration.zero;

                      if (controller.value.isPlaying) {
                        controller.pause();
                      } else {
                        if (pos >= dur) controller.seekTo(Duration.zero);
                        controller.play();
                      }
                    },
                  ),
                  SizedBox(width: 32),
                  IconButton(
                    icon: Image.asset(
                      Assets.images.forward10seconds.path,
                      width: 50,
                      height: 50,
                    ),
                    onPressed: () {
                      final controller =
                          _betterPlayerController.videoPlayerController!;
                      final pos = controller.value.position;
                      final dur = controller.value.duration ?? Duration.zero;

                      controller.seekTo(
                        pos + Duration(seconds: 10) <= dur
                            ? pos + Duration(seconds: 10)
                            : dur,
                      );
                    },
                  ),
                ],
              ),
            ),

          if (_isLocked)
            Positioned(
              top: 16,
              right: 16,
              child: GestureDetector(
                onTap: () {
                  _toggleLock();
                  setState(() => _controlsVisible = true);
                  _hideControlsAfterDelay();
                },
                child: Row(
                  children: [
                    Icon(Icons.lock, color: AppColors.white, size: 24),
                    SizedBox(width: 4),
                    PoppinsText(
                      context,
                      "Locked",
                      fontSize: PoppinsFontSizeVariant.size28,
                      fontWeight: PoppinsFontWeightVariant.semiBold,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),

          if (_controlsVisible)
            _buildBottomControls(screenSize, _betterPlayerController),

          if (_showEpisodes) _buildEpisodesHorizontalBar(),
        ],
      ),
    );
  }

  Widget _buildTopBar(String title) {
    return Positioned(
      top: 40,
      left: 10,
      right: 10,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Image.asset(
                Assets.images.casting.path,
                width: 24,
                height: 24,
              ),
            ),
            Expanded(
              child: Center(
                child: PoppinsText(
                  context,
                  title,
                  fontSize: PoppinsFontSizeVariant.size40,
                  fontWeight: PoppinsFontWeightVariant.semiBold,
                  color: AppColors.wDark,
                  maxLines: 1,
                  textOverflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Image.asset(
                Assets.images.crossnewicon.path,
                width: 24,
                height: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomControls(
    Size screenSize,
    BetterPlayerController betterController,
  ) {
    final controller = betterController.videoPlayerController!;
    final pos = controller.value.position;
    final dur = controller.value.duration ?? Duration.zero;

    return Positioned(
      bottom: 20,
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0),
              child: Row(
                children: [
                  Expanded(
                    child: Slider(
                      min: 0,
                      max: dur.inMilliseconds.toDouble(),
                      value: pos.inMilliseconds
                          .clamp(0, dur.inMilliseconds)
                          .toDouble(),
                      onChanged: (v) {
                        controller.seekTo(Duration(milliseconds: v.round()));
                      },
                      activeColor: AppColors.white,
                      inactiveColor: AppColors.sliderbar4C4C4C,
                    ),
                  ),
                  SizedBox(width: 8),
                  PoppinsText(
                    context,
                    "${_formatDuration(pos)}",
                    fontSize: PoppinsFontSizeVariant.size28,
                    fontWeight: PoppinsFontWeightVariant.regular,
                    color: AppColors.wDark,
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _btn(
                        Assets.images.speed.path,
                        "Speed ($_selectedSpeed)",
                        _changeSpeed,
                      ),
                      SizedBox(width: 16),

                      GestureDetector(
                        onTap: _toggleLock,
                        child: Row(
                          children: [
                            Image.asset(
                              Assets.images.videolock.path,
                              width: 20,
                              height: 20,
                              fit: BoxFit.contain,
                            ),

                            SizedBox(width: 4),
                            PoppinsText(
                              context,
                              "Locked",
                              fontSize: PoppinsFontSizeVariant.size28,
                              fontWeight: PoppinsFontWeightVariant.semiBold,
                              color: AppColors.white,
                            ),
                          ],
                        ),
                      ),

                      SizedBox(width: 16),
                      _btn(
                        Assets.images.episode.path,
                        "Episodes",
                        () => setState(() => _showEpisodes = !_showEpisodes),
                      ),
                      SizedBox(width: 16),
                      _btn(
                        Assets.images.audioSubtitles.path,
                        "Audio & Subtitles",
                        _openAudioSubtitlePopup,
                      ),
                      SizedBox(width: 16),
                      _btn(
                        Assets.images.quality.path,
                        "Quality ($_selectedQuality)",
                        _openVideoQualityPopup,
                      ),
                      SizedBox(width: 16),
                      _btn(Assets.images.nextepisode.path, "Next Ep.", () {}),
                    ],
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Image.asset(
                      Assets.images.fullscreenicon.path,
                      width: 24,
                      height: 24,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _btn(String imagePath, String label, VoidCallback onTap) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Row(
        children: [
          Image.asset(imagePath, width: 20, height: 20, fit: BoxFit.contain),
          SizedBox(width: 6),
          PoppinsText(
            context,
            label,
            fontSize: PoppinsFontSizeVariant.size28,
            fontWeight: PoppinsFontWeightVariant.semiBold,
            color: AppColors.wDark,
          ),
        ],
      ),
    );
  }

  Widget _buildEpisodesHorizontalBar() {
    if (!_showEpisodes) return SizedBox.shrink();
    return Positioned.fill(
      child: Stack(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => setState(() => _showEpisodes = false),
            child: Container(color: Colors.transparent),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onVerticalDragUpdate: (details) {
                if (details.delta.dy > 5) setState(() => _showEpisodes = false);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    color: AppColors.color000032,
                    child: PoppinsText(
                      context,
                      'E14 Finale',
                      fontSize: PoppinsFontSizeVariant.size40,
                      fontWeight: PoppinsFontWeightVariant.medium,
                      color: AppColors.wDark,
                    ),
                  ),
                  Container(
                    height: 190,
                    color: AppColors.color040412,
                    child: ListView.separated(
                      separatorBuilder: (_, __) => SizedBox(width: 20),
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(left: 20),
                      itemCount: episodesData.length,
                      itemBuilder: (_, index) => _buildHorizontalEpisodeItem(
                        episodesData[index],
                        index,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalEpisodeItem(Map<String, String> episode, int index) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        _playEpisode(index);
        setState(() => _showEpisodes = false);
      },
      child: Container(
        width: 255,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 132,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                image: DecorationImage(
                  image: AssetImage(episode['image']!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(4.0),
              child: PoppinsText(
                context,
                episode['title']!,
                fontSize: PoppinsFontSizeVariant.size32,
                fontWeight: PoppinsFontWeightVariant.medium,
                color: AppColors.wDark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
