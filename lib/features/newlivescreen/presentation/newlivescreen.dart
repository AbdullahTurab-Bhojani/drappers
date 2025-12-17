// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:better_player_plus/better_player_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';

class newliveScreen extends StatefulWidget {
  const newliveScreen({super.key});

  @override
  State<newliveScreen> createState() => _newliveScreenScreenState();
}

class _newliveScreenScreenState extends State<newliveScreen> {
  late BetterPlayerController _betterPlayerController;
  String _selectedSpeed = "1x";
  String? _selectedSubtitle;
  String? _selectedAudio;
  bool _controlsVisible = true;
  bool _showEpisodes = false;
  bool _isSpeedPopupVisible = false;
  void _changeSpeed() {
    setState(() {
      _isSpeedPopupVisible = !_isSpeedPopupVisible;
    });
  }

  final String videoUrl = 'https://stream.syritv.al/SyriTV/index.m3u8';

  final List<String> episodes = List.generate(
    10,
    (index) => 'https://stream.syritv.al/SyriTV/index.m3u8',
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

  void _initializePlayer() {
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
      BetterPlayerDataSourceType.network,
      videoUrl,
      resolutions: {"360p": videoUrl, "480p": videoUrl, "720p": videoUrl},
      subtitles: [
        BetterPlayerSubtitlesSource(
          type: BetterPlayerSubtitlesSourceType.network,
          name: "English",
          urls: [
            "https://bitdash-a.akamaihd.net/content/sintel/subtitles/subtitles_en.vtt",
          ],
        ),
      ],
    );

    _betterPlayerController = BetterPlayerController(
      config,
      betterPlayerDataSource: source,
    );

    // ✅ FORCE ENABLE SUBTITLES AFTER LOAD
    Future.delayed(const Duration(seconds: 1), () async {
      if (_betterPlayerController.betterPlayerSubtitlesSourceList.isNotEmpty) {
        await _betterPlayerController.setupSubtitleSource(
          _betterPlayerController.betterPlayerSubtitlesSourceList.first,
        );
      }
    });

    _hideControlsAfterDelay();
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$minutes:$seconds";
  }

  void _hideControlsAfterDelay() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted && _betterPlayerController.isPlaying() == true) {
        setState(() => _controlsVisible = false);
      }
    });
  }

  Widget _speedPopup() {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Center(
        child: Container(
          width: 336,
          padding: EdgeInsets.only(top: 32, left: 24, right: 24),
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

                    onTap: () {
                      setState(() {
                        _isSpeedPopupVisible = false;
                      });
                    },
                    child: Icon(Icons.close, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Divider(),
              SizedBox(height: 12),
              _speedOption("0.5x"),
              _speedOption("1x"),
              _speedOption("1.5x"),
              _speedOption("2x"),
            ],
          ),
        ),
      ),
    );
  }

  void _openAudioSubtitlePopup() {
    final List<String> subtitleOptions = ["Off", "English", "Urdu", "Arabic"];

    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: Colors.transparent,
        child: Center(
          child: Container(
            width: 336,
            padding: EdgeInsets.only(top: 32, left: 24, right: 24),
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
                SizedBox(height: 16),
                Divider(),
                SizedBox(height: 12),
                ...subtitleOptions.map(
                  (option) => _audioSubtitleOption(option, isSubtitle: true),
                ),
                SizedBox(height: 12),
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
      episodes[index],
    );

    _betterPlayerController.setupDataSource(source);
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

          if (_controlsVisible) _buildControls(),

          if (_showEpisodes)
            Positioned(
              bottom: 70,
              left: 0,
              right: 0,
              child: SizedBox(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: episodes.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,

                      onTap: () {
                        _playEpisode(index);
                        setState(() => _showEpisodes = false);
                      },
                      child: Container(
                        margin: EdgeInsets.all(6),
                        padding: EdgeInsets.all(12),
                        color: Colors.black54,
                        child: Center(
                          child: Text(
                            "EP ${index + 1}",
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

          if (_isSpeedPopupVisible) Center(child: _speedPopup()),
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
                    _betterPlayerController.isPlaying()!
                        ? _betterPlayerController.pause()
                        : _betterPlayerController.play();
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

          Positioned(
            bottom: 20,
            child: SizedBox(
              width: screenSize.width - 0,
              child: Column(
                children: [
                  if (_betterPlayerController
                      .videoPlayerController!
                      .value
                      .initialized)
                    Row(
                      children: [
                        Expanded(
                          child: Slider(
                            activeColor: Colors.white,
                            inactiveColor: AppColors.sliderbar4C4C4C,
                            value: _betterPlayerController
                                .videoPlayerController!
                                .value
                                .position
                                .inMilliseconds
                                .toDouble(),
                            max: _betterPlayerController
                                .videoPlayerController!
                                .value
                                .duration!
                                .inMilliseconds
                                .toDouble(),
                            onChanged: (v) {
                              _betterPlayerController.seekTo(
                                Duration(milliseconds: v.round()),
                              );
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
                        SizedBox(width: 20),
                      ],
                    ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _btn(
                        Assets.images.speed.path,
                        "Speed (1x)",
                        _changeSpeed,
                      ),
                      SizedBox(width: 20),
                      _btn(
                        Assets.images.audioSubtitles.path,
                        "Audio & Subtitles",
                        _openAudioSubtitlePopup,
                      ),
                      SizedBox(width: 20),
                      _btn(
                        Assets.images.audioSubtitles.path,
                        "Picture In Picture",
                        () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            top: 34,
            right: 28,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,

              onTap: () => Navigator.pop(context),
              child: Image.asset(
                Assets.images.crossnewicon.path,
                width: 30,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _speedOption(String text) {
    bool isSelected = _selectedSpeed == text;

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
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.popselectcolor19193F
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              width: 20,
              alignment: Alignment.center,
              child: isSelected
                  ? Icon(Icons.check, color: Colors.white, size: 20)
                  : SizedBox.shrink(),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: PoppinsText(
                  text,
                  fontSize: PoppinsFontSizeVariant.size12,
                  fontWeight: PoppinsFontWeightVariant.regular,
                  color: AppColors.wDark,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _audioSubtitleOption(String text, {required bool isSubtitle}) {
    bool isSelected = isSubtitle
        ? _selectedSubtitle == text
        : _selectedAudio == text;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,

      onTap: () async {
        setState(() {
          if (isSubtitle) {
            _selectedSubtitle = text;
          } else {
            _selectedAudio = text;
          }
        });

        if (isSubtitle) {
          if (text == "Off") {
            await _betterPlayerController.setupSubtitleSource(
              BetterPlayerSubtitlesSource(
                type: BetterPlayerSubtitlesSourceType.none,
              ),
            );
          } else {
            final subSource = BetterPlayerSubtitlesSource(
              type: BetterPlayerSubtitlesSourceType.network,
              name: text,
              urls: ["https://example.com/${text.toLowerCase()}.vtt"],
            );
            await _betterPlayerController.setupSubtitleSource(subSource);
          }
        } else {}

        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.popselectcolor19193F
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 20,
              child: isSelected
                  ? Icon(Icons.check, color: Colors.white, size: 20)
                  : SizedBox.shrink(),
            ),
            SizedBox(width: 12),
            Expanded(
              child: PoppinsText(
                text,
                fontSize: PoppinsFontSizeVariant.size12,
                fontWeight: PoppinsFontWeightVariant.regular,
                color: AppColors.wDark,
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
          SizedBox(width: 8),
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

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations(DeviceOrientation.values);
    _betterPlayerController.dispose();
    super.dispose();
  }
}



















// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import '../../../core/extensions/theme_extension.dart';
// import '../../../drappers.dart';
// import '../../../gen/assets.gen.dart';
// import '../../../shared/widgets/app_bar/main_app_bar.dart';

// class newliveScreen extends StatefulWidget {
//   const newliveScreen({super.key});

//   @override
//   State<newliveScreen> createState() => _newliveScreenState();
// }

// class _newliveScreenState extends State<newliveScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final customColors = Theme.of(context).extension<AppCustomColors>()!;
//     return Scaffold(
//       body: Column(children: [
        
       
//         ],
//       ),
//     );
//   }
// }
