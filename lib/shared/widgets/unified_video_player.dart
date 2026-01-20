// ignore_for_file: deprecated_member_use, use_build_context_synchronously, unused_field, sized_box_for_whitespace, curly_braces_in_flow_control_structures

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
import '../../../shared/widgets/top_bar_widget.dart';

enum PlayerMode { live, vod }

class UnifiedVideoPlayerScreen extends StatefulWidget {
  final PlayerMode mode;
  const UnifiedVideoPlayerScreen({super.key, required this.mode});

  @override
  State<UnifiedVideoPlayerScreen> createState() =>
      _UnifiedVideoPlayerScreenState();
}

class _UnifiedVideoPlayerScreenState extends State<UnifiedVideoPlayerScreen> {
  late BetterPlayerController _betterPlayerController;
  bool _controlsVisible = true;
  bool _isLocked = false;
  bool _showEpisodes = false;
  bool _isLoading = true;
  File? videoFile;
  Timer? _lockTimer;

  late String videoUrl;
  late List<Map<String, String>> episodesData;
  String _selectedSpeed = "1x";
  String _selectedQuality = "720p";
  String? _selectedSubtitle;

  @override
  void initState() {
    super.initState();
    _setLandscapeAndFullscreen();
    _setVideoData();
    WidgetsBinding.instance.addPostFrameCallback((_) => _initializePlayer());
  }

  void _setVideoData() {
    if (widget.mode == PlayerMode.live) {
      videoUrl = 'assets/images/livefullview.mp4';
      episodesData = List.generate(
        10,
        (index) => {
          "title": "Live Stream $index",
          "url": 'assets/images/livefullview.mp4',
          "image": Assets.images.watchlistcard1.path,
        },
      );
      _controlsVisible = false;
    } else {
      videoUrl = 'assets/images/contentdetailvodep.mp4';
      episodesData = List.generate(
        10,
        (index) => {
          "title": "Episode $index",
          "url": 'assets/images/contentdetailvodep.mp4',
          "image": Assets.images.watchlistcard1.path,
        },
      );
      _controlsVisible = true;
    }
  }

  @override
  void dispose() {
    _betterPlayerController.dispose();
    _lockTimer?.cancel();
    SystemChrome.setPreferredOrientations(DeviceOrientation.values);
    super.dispose();
  }

  void _setLandscapeAndFullscreen() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  Future<File> _assetToFile(String assetPath) async {
    setState(() => _isLoading = true);
    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/${assetPath.split('/').last}');
    if (!await file.exists()) {
      final byteData = await rootBundle.load(assetPath);
      await file.writeAsBytes(byteData.buffer.asUint8List());
    }
    setState(() {
      videoFile = file;
      _isLoading = false;
    });
    return file;
  }

  Future<void> _initializePlayer() async {
    await _assetToFile(videoUrl);
    final config = BetterPlayerConfiguration(
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
    _betterPlayerController = BetterPlayerController(
      config,
      betterPlayerDataSource: BetterPlayerDataSource(
        BetterPlayerDataSourceType.file,
        videoFile!.path,
      ),
    );
    _betterPlayerController.videoPlayerController!.addListener(() {
      if (mounted) setState(() {});
    });
  }

  void _toggleLock() {
    setState(() => _isLocked = !_isLocked);
    if (_isLocked) {
      _lockTimer?.cancel();
      _lockTimer = Timer(Duration(seconds: 2), () {
        if (mounted) setState(() => _controlsVisible = false);
      });
    }
  }

  void _playEpisode(int index) {
    final source = BetterPlayerDataSource(
      BetterPlayerDataSourceType.file,
      episodesData[index]['url']!,
    );
    _betterPlayerController.setupDataSource(source);
  }

  @override
  Widget build(BuildContext context) {
    Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.images.screensbg.path),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  if (!_isLocked && widget.mode == PlayerMode.vod) {
                    setState(() => _controlsVisible = !_controlsVisible);
                  } else if (_isLocked) {
                    _toggleLock();
                  }
                },
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: BetterPlayer(controller: _betterPlayerController),
                    ),
                    // Top Bar
                    if (_controlsVisible &&
                        !_isLocked &&
                        widget.mode == PlayerMode.vod)
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
                    // Center Controls
                    // Center Controls (play/pause/back/forward)
                    if (_controlsVisible &&
                        !_isLocked &&
                        widget.mode == PlayerMode.vod &&
                        !_showEpisodes)
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
                                final controller = _betterPlayerController
                                    .videoPlayerController!;
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
                                final controller = _betterPlayerController
                                    .videoPlayerController!;
                                if (controller.value.isPlaying) {
                                  controller.pause();
                                } else {
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
                                final controller = _betterPlayerController
                                    .videoPlayerController!;
                                final pos = controller.value.position;
                                final dur =
                                    controller.value.duration ?? Duration.zero;
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

                    if (_controlsVisible &&
                        !_isLocked &&
                        widget.mode == PlayerMode.vod)
                      Positioned(
                        bottom: 20,
                        left: 0,
                        right: 0,
                        child: BottomControlsWidget(
                          betterController: _betterPlayerController,
                          isLocked: _isLocked,
                          showEpisodes: _showEpisodes,
                          selectedSpeed: _selectedSpeed,
                          selectedQuality: _selectedQuality,
                          changeSpeed: () {},
                          toggleLock: _toggleLock,
                          openAudioSubtitlePopup: () {},
                          openVideoQualityPopup: () {},
                          onEpisodesToggle: (val) =>
                              setState(() => _showEpisodes = val),
                        ),
                      ),
                    if (_controlsVisible && !_isLocked && !_showEpisodes)
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
              ),
      ),
    );
  }
}
