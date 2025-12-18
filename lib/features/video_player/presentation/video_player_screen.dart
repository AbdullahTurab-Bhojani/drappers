// ignore_for_file: unused_field, deprecated_member_use

import 'dart:io';

import 'package:better_player_plus/better_player_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';

class CustomVideoPlayerScreen extends StatefulWidget {
  const CustomVideoPlayerScreen({super.key});

  @override
  State<CustomVideoPlayerScreen> createState() =>
      _CustomVideoPlayerScreenState();
}

class _CustomVideoPlayerScreenState extends State<CustomVideoPlayerScreen> {
  VideoPlayerController? _controller;
  late BetterPlayerController _betterPlayerController;
  String? _selectedSubtitle;
  String? _selectedAudio;
  bool _controlsVisible = true;
  bool _isLocked = false;
  bool _showEpisodes = false;
  final bool _isSpeedPopupVisible = false;
  final bool _isQualityPopupVisible = false;
  bool showLoader = false;
  File? videoFile;

  String _selectedQuality = "720p";

  String _selectedSpeed = "1x";

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$minutes:$seconds";
  }

  final List<Map<String, String>> episodesData = List.generate(
    10,
    (index) => {
      "title": "Meet The Drapers Season 6 (2023)",
      "url":
          // "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
          "assets/images/contentdetailvodep.mp4",
      "image": Assets.images.watchlistcard1.path,
    },
  );

  final String videoUrl =
      // "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4";
      "assets/images/contentdetailvodep.mp4";

  final List<String> episodes = List.generate(
    10,
    (index) =>
        // "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
        "assets/images/contentdetailvodep.mp4",
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
    setState(() {
      showLoader = true;
    });

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

  void _changeSpeed() {
    showDialog(context: context, builder: (_) => _speedPopup());
  }

  Widget _videoQuality(Function(String) onSelected, String selectedQuality) {
    List<String> videoQualities = ['4k', '1440p', '1080p', '480p'];

    return GestureDetector(
      behavior: HitTestBehavior.opaque,

      onTap: () => Navigator.canPop(context),
      child: Dialog(
        backgroundColor: Colors.transparent,
        child: Center(
          child: Container(
            width: 320,
            padding: EdgeInsets.only(top: 16, left: 24, right: 24),
            decoration: BoxDecoration(
              color: AppColors.dRegular,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PoppinsText(
                      "Quality",
                      fontSize: PoppinsFontSizeVariant.size12,
                      fontWeight: PoppinsFontWeightVariant.regular,
                      color: AppColors.wDark,
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.close, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Divider(),
                // SizedBox(height: 12),
                ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: videoQualities.length,
                  itemBuilder: (context, index) {
                    final text = videoQualities[index];
                    final bool isSelected = selectedQuality == text;

                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,

                      onTap: () {
                        onSelected(text);
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 12,
                        ),
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.popselectcolor19193F
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (isSelected)
                              Icon(Icons.check, color: Colors.white, size: 18),
                            if (isSelected) SizedBox(width: 10),
                            PoppinsText(
                              text,
                              fontSize: PoppinsFontSizeVariant.size12,
                              fontWeight: PoppinsFontWeightVariant.regular,
                              color: AppColors.wDark,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _initializePlayer() async {
    setState(() => showLoader = true);

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

    await assetToFile(videoUrl);

    BetterPlayerDataSource source = BetterPlayerDataSource(
      BetterPlayerDataSourceType.file,
      videoFile!.path,
    );

    _betterPlayerController = BetterPlayerController(
      config,
      betterPlayerDataSource: source,
    );

    // ← ADD THIS LISTENER
    _betterPlayerController.videoPlayerController!.addListener(() {
      if (mounted) setState(() {}); // this updates slider & timer
    });

    _hideControlsAfterDelay();

    setState(() => showLoader = false);
  }

  void _hideControlsAfterDelay() {
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted && _betterPlayerController.isPlaying() == true) {
        setState(() => _controlsVisible = false);
      }
    });
  }

  void _toggleLock() {
    setState(() {
      _isLocked = true;
      _controlsVisible = true;
    });
  }

  void _openVideoQualityPopup() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Center(
          child: Material(
            color: Colors.transparent,
            child: _videoQuality((selected) {
              setState(() {
                _selectedQuality = selected;
              });
            }, _selectedQuality),
          ),
        );
      },
    );
  }

  Widget _audioSubtitle() {
    List<String> audioSubtitles = ['Off', 'English', 'Urdu', 'Arabic'];

    return GestureDetector(
      behavior: HitTestBehavior.opaque,

      onTap: () => Navigator.pop(context),
      child: Dialog(
        backgroundColor: Colors.transparent,
        child: Center(
          child: Container(
            width: 320,
            padding: EdgeInsets.only(top: 16, left: 24, right: 24),
            decoration: BoxDecoration(
              color: AppColors.dRegular,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PoppinsText(
                      "Audio & Subtitles",
                      fontSize: PoppinsFontSizeVariant.size12,
                      fontWeight: PoppinsFontWeightVariant.regular,
                      color: AppColors.wDark,
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,

                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.close, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Divider(),

                // SizedBox(height: 12),
                ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: audioSubtitles.length,
                  itemBuilder: (context, index) {
                    final text = audioSubtitles[index];
                    final bool isSelected = _selectedSubtitle == text;

                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,

                      onTap: () {
                        setState(() {
                          _selectedSubtitle = text;
                        });
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 12,
                        ),
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.popselectcolor19193F
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (isSelected)
                              Icon(Icons.check, color: Colors.white, size: 18),
                            if (isSelected) SizedBox(width: 10),
                            PoppinsText(
                              text,
                              fontSize: PoppinsFontSizeVariant.size12,
                              fontWeight: PoppinsFontWeightVariant.regular,
                              color: AppColors.wDark,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _speedPopup() {
    List<String> speedList = ['0.25x', '0.5x', '0.75x', 'Normal'];
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Dialog(
        backgroundColor: Colors.transparent,
        child: Center(
          child: Container(
            width: 320,
            padding: EdgeInsets.only(top: 16, left: 24, right: 24),
            decoration: BoxDecoration(
              color: AppColors.dRegular,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PoppinsText(
                      "Speed",
                      fontSize: PoppinsFontSizeVariant.size12,
                      fontWeight: PoppinsFontWeightVariant.regular,
                      color: AppColors.wDark,
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.close, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Divider(),
                // SizedBox(height: 12),
                ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: speedList.length,
                  itemBuilder: (context, index) {
                    final text = speedList[index];
                    final bool isSelected = _selectedSpeed == text;

                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,

                      onTap: () {
                        setState(() {
                          _selectedSpeed = text;
                          _betterPlayerController.setSpeed(
                            double.parse(text.replaceAll('x', '')),
                          );
                        });
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 12,
                        ),
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.popselectcolor19193F
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (isSelected)
                              Icon(Icons.check, color: Colors.white, size: 18),

                            if (isSelected) SizedBox(width: 10),

                            PoppinsText(
                              text,
                              fontSize: PoppinsFontSizeVariant.size12,
                              fontWeight: PoppinsFontWeightVariant.regular,
                              color: AppColors.wDark,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
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
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(8),
                ),
                image: DecorationImage(
                  image: AssetImage(episode['image']!),
                  fit: BoxFit.cover,
                ),
              ),
              child: episode['title']!.contains('FINALE')
                  ? const Center(
                      child: Text(
                        "E14\nFINALE",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          shadows: [Shadow(blurRadius: 3, color: Colors.black)],
                        ),
                      ),
                    )
                  : null,
            ),

            Padding(
              padding: EdgeInsets.all(4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PoppinsText(
                    episode['title']!,
                    fontSize: PoppinsFontSizeVariant.size16,
                    fontWeight: PoppinsFontWeightVariant.medium,
                    color: AppColors.wDark,
                  ),
                ],
              ),
            ),
          ],
        ),
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

            onTap: () {
              setState(() {
                _showEpisodes = false;
              });
            },
            child: Container(color: Colors.transparent),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,

              onTap: () {},
              onVerticalDragUpdate: (details) {
                if (details.delta.dy > 5) {
                  setState(() {
                    _showEpisodes = false;
                  });
                }
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    color: AppColors.color000032,
                    child: PoppinsText(
                      'E14 Finale',
                      fontSize: PoppinsFontSizeVariant.size24,
                      fontWeight: PoppinsFontWeightVariant.medium,
                      color: AppColors.wDark,
                    ),
                  ),
                  Container(
                    height: 190,
                    color: AppColors.color040412,
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 20);
                      },
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(left: 20),
                      itemCount: episodesData.length,
                      itemBuilder: (context, index) {
                        final episode = episodesData[index];
                        return _buildHorizontalEpisodeItem(episode, index);
                      },
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: BetterPlayer(controller: _betterPlayerController),
          ),

          if (!_isLocked)
            Positioned.fill(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,

                onTap: () {
                  setState(() => _controlsVisible = !_controlsVisible);
                  if (_controlsVisible) _hideControlsAfterDelay();
                },
              ),
            ),

          if (_controlsVisible) _buildControls(),

          if (_showEpisodes) _buildEpisodesHorizontalBar(),
          // /*
          // // if (_showEpisodes)
          // //   Positioned(
          // //     bottom: 70,
          // //     left: 0,
          // //     right: 0,
          // //     child: SizedBox(
          // //       height: 80,
          // //       child: ListView.builder(
          // //         scrollDirection: Axis.horizontal,
          // //         itemCount: episodes
          // //             .length, // NOTE: this uses 'episodes' which is now unused
          // //         itemBuilder: (context, index) {
          // //           return GestureDetector(
          // //             onTap: () {
          // //               _playEpisode(index);
          // //               setState(() => _showEpisodes = false);
          // //             },
          // //             child: Container(
          // //               margin: const EdgeInsets.all(6),
          // //               padding: const EdgeInsets.all(12),
          // //               color: Colors.black54,
          // //               child: Center(
          // //                 child: Text(
          // //                   "EP ${index + 1}",
          // //                   style: const TextStyle(color: Colors.white),
          // //                 ),
          // //               ),
          // //             ),
          // //           );
          // //         },
          // //       ),
          // //     ),
          // //   ),
          // */
        ],
      ),
    );
  }

  Widget _buildControls() {
    final Size screenSize = MediaQuery.of(context).size;

    return Container(
      color: Colors.black.withOpacity(0.3),
      child: Stack(
        children: [
          if (!_isLocked)
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Image.asset(
                      Assets.images.back10seconds.path,
                      width: 64,
                      height: 64,
                    ),
                    onPressed: () {
                      final pos = _betterPlayerController
                          .videoPlayerController!
                          .value
                          .position;
                      _betterPlayerController.seekTo(
                        pos - const Duration(seconds: 10),
                      );
                    },
                  ),
                  const SizedBox(width: 40),
                  IconButton(
                    icon: Icon(
                      _betterPlayerController.isPlaying()!
                          ? Icons.pause_circle
                          : Icons.play_circle,
                      size: 90,
                    ),
                    onPressed: () {
                      if (_betterPlayerController.isPlaying() == true) {
                        _betterPlayerController.pause();
                      } else {
                        _betterPlayerController.play();
                      }
                      setState(() {});
                    },
                  ),
                  SizedBox(width: 40),
                  IconButton(
                    icon: Image.asset(
                      Assets.images.forward10seconds.path,
                      width: 64,
                      height: 64,
                    ),
                    onPressed: () {
                      final pos = _betterPlayerController
                          .videoPlayerController!
                          .value
                          .position;
                      _betterPlayerController.seekTo(
                        pos + const Duration(seconds: 10),
                      );
                    },
                  ),
                ],
              ),
            ),

          if (!_isLocked)
            Positioned(
              bottom: 20,
              child: SizedBox(
                width: screenSize.width - 0,
                child: Column(
                  children: [
                    if (_betterPlayerController
                        .videoPlayerController!
                        .value
                        .isPlaying)
                      Row(
                        children: [
                          Expanded(
                            child: Slider(
                              activeColor: Colors.white,
                              inactiveColor: AppColors.sliderbar4C4C4C,
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
                              onChanged: (v) {
                                _betterPlayerController.videoPlayerController!
                                    .seekTo(Duration(milliseconds: v.round()));
                              },
                            ),
                          ),
                          PoppinsText(
                            _formatDuration(
                              _betterPlayerController
                                  .videoPlayerController!
                                  .value
                                  .position,
                            ),
                            fontSize: PoppinsFontSizeVariant.size12,
                            fontWeight: PoppinsFontWeightVariant.regular,
                            color: AppColors.wDark,
                          ),
                          // SizedBox(width: 10),
                          // PoppinsText(
                          //   _formatDuration(
                          //     _betterPlayerController
                          //         .videoPlayerController!
                          //         .value
                          //         .duration!,
                          //   ),
                          //   fontSize: PoppinsFontSizeVariant.size12,
                          //   fontWeight: PoppinsFontWeightVariant.regular,
                          //   color: AppColors.wDark.withOpacity(0.7),
                          // ),
                        ],
                      ),

                    Row(
                      children: [
                        Spacer(),

                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _btn(
                              Assets.images.speed.path,
                              "Speed ($_selectedSpeed)",
                              _changeSpeed,
                            ),
                            SizedBox(width: 40),
                            _btn(
                              Assets.images.videolock.path,
                              "Lock",
                              _toggleLock,
                            ),
                            SizedBox(width: 40),
                            _btn(Assets.images.episode.path, "Episodes", () {
                              setState(() => _showEpisodes = !_showEpisodes);
                            }),
                            SizedBox(width: 40),
                            _btn(
                              Assets.images.audioSubtitles.path,
                              "Audio & Subtitles",
                              _openAudioSubtitlePopup,
                            ),
                            SizedBox(width: 40),
                            _btn(
                              Assets.images.quality.path,
                              "Quality ($_selectedQuality)",
                              _openVideoQualityPopup,
                            ),
                            SizedBox(width: 40),
                            _btn(
                              Assets.images.nextepisode.path,
                              "Next Ep.",
                              () {
                                if (episodesData.length > 1) _playEpisode(1);
                              },
                            ),
                          ],
                        ),

                        Spacer(),

                        Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () => Navigator.pop(context),
                            child: Image.asset(
                              Assets.images.fullscreenicon.path,
                              width: 24,
                              height: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

          if (_isLocked)
            Positioned(
              top: 36,
              right: 32,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  setState(() {
                    _isLocked = false;
                  });
                },
                child: Row(
                  children: [
                    Image.asset(
                      Assets.images.videolock.path,
                      width: 15,
                      height: 15,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: 8),
                    PoppinsText(
                      "Locked",
                      fontSize: PoppinsFontSizeVariant.size12,
                      fontWeight: PoppinsFontWeightVariant.semiBold,
                      color: AppColors.wDark,
                    ),
                  ],
                ),
              ),
            ),

          if (!_isLocked)
            Positioned(
              top: 34,
              left: 0,
              right: 0,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 52),
                    child: Image.asset(
                      Assets.images.casting.path,
                      width: 30,
                      color: AppColors.white,
                    ),
                  ),

                  Expanded(
                    child: Center(
                      child: PoppinsText(
                        'Finale – Meet The Drapers Seaso....',
                        fontSize: PoppinsFontSizeVariant.size22,
                        fontWeight: PoppinsFontWeightVariant.medium,
                        color: AppColors.white,
                        maxLines: 1,
                        textOverflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),

                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => Navigator.pop(context),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 28),
                      child: Image.asset(
                        Assets.images.crossnewicon.path,
                        width: 30,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
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
            label,
            fontSize: PoppinsFontSizeVariant.size12,
            fontWeight: PoppinsFontWeightVariant.semiBold,
            color: AppColors.wDark,
          ),
        ],
      ),
    );
  }

  void _openAudioSubtitlePopup() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Center(
          child: Material(color: Colors.transparent, child: _audioSubtitle()),
        );
      },
    );
  }
}
