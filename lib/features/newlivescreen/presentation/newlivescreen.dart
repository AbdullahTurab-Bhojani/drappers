// ignore_for_file: deprecated_member_use, use_build_context_synchronously, prefer_final_fields

import 'dart:io';
import 'package:better_player_plus/better_player_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import '../../../core/theme/app_scalar.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';
import '../../../shared/widgets/player_action_button.dart';
import '../../../shared/widgets/popupmenuitem/audio_subtitle_popup.dart';
import '../../../shared/widgets/popupmenuitem/speed_popup.dart';

class Newlivescreen extends StatefulWidget {
  const Newlivescreen({super.key});

  @override
  State<Newlivescreen> createState() => _NewlivescreenState();
}

class _NewlivescreenState extends State<Newlivescreen> {
  late BetterPlayerController _betterPlayerController;

  String _selectedSpeed = "1x";
  String? _selectedSubtitle;
  bool _controlsVisible = false;
  bool _isLocked = false;
  bool showLoader = false;

  File? videoFile;

  final String videoUrl = 'assets/images/livefullview.mp4';

  final List<String> episodes = List.generate(
    10,
    (index) => 'assets/images/livefullview.mp4',
  );

  @override
  void initState() {
    super.initState();
    _setLandscapeAndFullscreen();
    _initializePlayer();
  }

  void _setLandscapeAndFullscreen() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  Future<File> assetToFile(String assetPath) async {
    setState(() => showLoader = true);
    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/${assetPath.split('/').last}');

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

  void _initializePlayer() async {
    final config = BetterPlayerConfiguration(
      autoPlay: true,
      fit: BoxFit.cover,
      controlsConfiguration: BetterPlayerControlsConfiguration(
        showControls: false,
      ),
    );

    await assetToFile(videoUrl);

    final source = BetterPlayerDataSource(
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
  }

  void _hideControlsAfterDelay() {
    Future.delayed(Duration(seconds: 4), () {
      if (mounted && _betterPlayerController.isPlaying() == true) {
        setState(() => _controlsVisible = false);
      }
    });
  }

  String _format(Duration d) {
    final m = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final s = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return "$m:$s";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                setState(() => _controlsVisible = !_controlsVisible);
                if (_controlsVisible) _hideControlsAfterDelay();
              },
              child: showLoader
                  ? Center(child: LoadingWidget())
                  : BetterPlayer(controller: _betterPlayerController),
            ),
          ),

          if (_controlsVisible) _buildControls(),

          if (_controlsVisible)
            Positioned(
              top: 24,
              right: 16,
              child: GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: Image.asset(
                  Assets.images.crossnewicon.path,
                  width: 28,
                  height: 28,
                  color: AppColors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildControls() {
    final controller = _betterPlayerController.videoPlayerController!;
    final pos = controller.value.position;
    final dur = controller.value.duration ?? Duration.zero;

    return Container(
      color: Colors.black.withOpacity(0.35),
      child: Column(
        mainAxisAlignment: .spaceBetween,
        children: [
          SizedBox(height: AppScaler.scaleHeight(context, 56)),
          if (!_isLocked)
            IconButton(
              iconSize: 90,
              icon: Icon(
                controller.value.isPlaying
                    ? Icons.pause_circle
                    : Icons.play_circle,
                color: AppColors.white,
              ),
              onPressed: () {
                if (controller.value.isPlaying) {
                  controller.pause();
                } else {
                  if (controller.value.position >= controller.value.duration!) {
                    controller.seekTo(Duration.zero);
                  }
                  controller.play();
                }
              },
            ),

          Padding(
            padding: EdgeInsets.only(bottom: 20, left: 16, right: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
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
                    // SizedBox(width: 8),
                    PoppinsText(
                      context,
                      _format(pos),
                      fontSize: PoppinsFontSizeVariant.size28,
                      fontWeight: PoppinsFontWeightVariant.regular,
                      color: AppColors.wDark,
                    ),
                  ],
                ),

                // SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 24),
                      Row(
                        children: [
                          PlayerActionButton(
                            imagePath: Assets.images.speed.path,
                            label: "Speed ($_selectedSpeed)",
                            onTap: _changeSpeed,
                          ),
                          SizedBox(width: 16),
                          PlayerActionButton(
                            imagePath: Assets.images.audioSubtitles.path,
                            label: "Audio & Subtitles",
                            onTap: _openAudioSubtitlePopup,
                          ),
                          SizedBox(width: 16),
                          PlayerActionButton(
                            imagePath: Assets.images.picture.path,
                            label: "Picture in Picture",
                            onTap: () {},
                          ),
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
        ],
      ),
    );
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

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations(DeviceOrientation.values);
    _betterPlayerController.dispose();
    super.dispose();
  }
}
