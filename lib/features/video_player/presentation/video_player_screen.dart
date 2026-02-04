// ignore_for_file: unused_field, deprecated_member_use, sized_box_for_whitespace, unnecessary_string_interpolations, curly_braces_in_flow_control_structures

import 'dart:async';
import 'dart:io';
import 'package:better_player_plus/better_player_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';
import '../../../shared/widgets/bottom_controls_widget.dart';
import '../../../shared/widgets/episode_horizontal_bar.dart';
import '../../../shared/widgets/popupmenuitem/audio_subtitle_popup.dart';
import '../../../shared/widgets/popupmenuitem/quality_popup.dart';
import '../../../shared/widgets/popupmenuitem/speed_popup.dart';
import '../../../shared/widgets/top_bar_widget.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  BetterPlayerController? _betterPlayerController;

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
    _betterPlayerController?.dispose();
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
      // iOS par custom controls ko stable rakhne ke liye ye zaroori hain
      fullScreenByDefault: false,
      allowedScreenSleep: false,
      autoDetectFullscreenDeviceOrientation: false,
      subtitlesConfiguration: BetterPlayerSubtitlesConfiguration(
        fontSize: 16,
        fontColor: AppColors.white,
        outlineColor: Colors.black,
      ),
      controlsConfiguration: BetterPlayerControlsConfiguration(
        showControls: false, // Native controls disable kar diye
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

    _betterPlayerController!.videoPlayerController!.addListener(() {
      if (mounted) setState(() {});
    });

    _hideControlsAfterDelay();
    setState(() => showLoader = false);
  }

  void _hideControlsAfterDelay() {
    Future.delayed(Duration(seconds: 4), () {
      if (mounted &&
          !_isLocked &&
          !_showEpisodes &&
          _betterPlayerController?.isPlaying() == true) {
        setState(() => _controlsVisible = false);
      }
    });
  }

  void _toggleLock() {
    setState(() {
      _isLocked = !_isLocked;
      _controlsVisible = !_isLocked;
    });

    if (_isLocked) {
      _showLockIndicatorWithTimer();
    } else {
      _lockTimer?.cancel();
      setState(() => _showLockIndicator = false);
      _hideControlsAfterDelay();
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
            _betterPlayerController!.setSpeed(
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
    _betterPlayerController!.setupDataSource(source);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _betterPlayerController == null
          ? Center(child: LoadingWidget(color: AppColors.buttoncolor.first))
          : Column(
              children: [
                Expanded(
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      if (_showEpisodes) {
                        setState(() => _showEpisodes = false);
                        return;
                      }

                      if (!_isLocked) {
                        setState(() => _controlsVisible = !_controlsVisible);
                        if (_controlsVisible) _hideControlsAfterDelay();
                      } else {
                        _showLockIndicatorWithTimer();
                      }
                    },
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: BetterPlayer(
                            controller: _betterPlayerController!,
                          ),
                        ),

                        // Top Bar
                        if (!_showEpisodes && _controlsVisible && !_isLocked)
                          Positioned(
                            top: 40,
                            left: 10,
                            right: 10,
                            child: TopBarWidget(
                              title: "Finale – Meet The Drapers Season",
                              onBack: () => Navigator.pop(context),
                              onClose: () => Navigator.pop(context),
                            ),
                          ),

                        // Center Play/Skip Controls (Functional skip)
                        if (!_showEpisodes && _controlsVisible && !_isLocked)
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
                                    final controller = _betterPlayerController!
                                        .videoPlayerController!;
                                    final pos = controller.value.position;
                                    controller.seekTo(
                                      pos - const Duration(seconds: 10) >=
                                              Duration.zero
                                          ? pos - const Duration(seconds: 10)
                                          : Duration.zero,
                                    );
                                  },
                                ),
                                const SizedBox(width: 32),
                                IconButton(
                                  icon: Icon(
                                    _betterPlayerController!
                                            .videoPlayerController!
                                            .value
                                            .isPlaying
                                        ? Icons.pause_circle
                                        : Icons.play_circle,
                                    size: 70,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    final controller = _betterPlayerController!
                                        .videoPlayerController!;
                                    controller.value.isPlaying
                                        ? controller.pause()
                                        : controller.play();
                                  },
                                ),
                                const SizedBox(width: 32),
                                IconButton(
                                  icon: Image.asset(
                                    Assets.images.forward10seconds.path,
                                    width: 50,
                                    height: 50,
                                  ),
                                  onPressed: () {
                                    final controller = _betterPlayerController!
                                        .videoPlayerController!;
                                    final pos = controller.value.position;
                                    final dur =
                                        controller.value.duration ??
                                        Duration.zero;
                                    controller.seekTo(
                                      pos + const Duration(seconds: 10) <= dur
                                          ? pos + const Duration(seconds: 10)
                                          : dur,
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),

                        // Lock Status Indicator
                        if (!_showEpisodes && (_isLocked || _showLockIndicator))
                          Positioned(
                            top: 24,
                            right: 24,
                            child: GestureDetector(
                              onTap: () {
                                _toggleLock();
                                setState(() => _controlsVisible = true);
                                _hideControlsAfterDelay();
                              },
                              child: Row(
                                children: [
                                  Image.asset(
                                    Assets.images.videolock.path,
                                    color: Colors.white,
                                    width: 20,
                                    height: 20,
                                  ),
                                  const SizedBox(width: 8),
                                  PoppinsText(
                                    context,
                                    "Locked",
                                    fontSize: PoppinsFontSizeVariant.size28,
                                    fontWeight:
                                        PoppinsFontWeightVariant.semiBold,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),

                        // Bottom Controls (Seek Bar block karne ke liye AbsorbPointer ya Stack Overlay use karein)
                        if (!_showEpisodes && _controlsVisible && !_isLocked)
                          Positioned(
                            bottom: 20,
                            left: 0,
                            right: 0,
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                BottomControlsWidget(
                                  betterController: _betterPlayerController!,
                                  isLocked: _isLocked,
                                  showEpisodes: _showEpisodes,
                                  selectedSpeed: _selectedSpeed,
                                  selectedQuality: _selectedQuality,
                                  changeSpeed: _changeSpeed,
                                  toggleLock: _toggleLock,
                                  openAudioSubtitlePopup:
                                      _openAudioSubtitlePopup,
                                  openVideoQualityPopup: _openVideoQualityPopup,
                                  onEpisodesToggle: (val) =>
                                      setState(() => _showEpisodes = val),
                                ),
                                // Transparent overlay for seekbar blocking
                                Positioned(
                                  bottom:
                                      40, // Seek bar ki vertical position ke hisab se set karein
                                  child: Container(
                                    height: 40,
                                    width: MediaQuery.of(context).size.width,
                                    color: Colors.transparent,
                                    child: const AbsorbPointer(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                EpisodesHorizontalBar(
                  show: _showEpisodes,
                  title: 'E14 Finale',
                  episodesData: episodesData,
                  onClose: () => setState(() => _showEpisodes = false),
                  onEpisodeTap: (index) {
                    _playEpisode(index);
                    setState(() => _showEpisodes = false);
                  },
                ),
              ],
            ),
    );
  }
}
