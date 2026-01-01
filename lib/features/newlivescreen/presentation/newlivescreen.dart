// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'dart:io';

import 'package:better_player_plus/better_player_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
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
  bool _isLocked = false;
  String? _selectedSubtitle;
  String? _selectedAudio;
  bool _controlsVisible = false;
  bool _showEpisodes = false;
  bool _isSpeedPopupVisible = false;
  File? videoFile;

  bool showLoader = false;

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

  void _initializePlayer() async {
    BetterPlayerConfiguration config = BetterPlayerConfiguration(
      aspectRatio: 16 / 9,
      fit: BoxFit.cover,
      autoPlay: true,
      handleLifecycle: true,
      subtitlesConfiguration: const BetterPlayerSubtitlesConfiguration(
        fontSize: 16,
        fontColor: AppColors.white,
        outlineColor: AppColors.black,
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

    _betterPlayerController.videoPlayerController!.addListener(() {
      if (mounted) setState(() {});
    });

    _hideControlsAfterDelay();
  }

  void _hideControlsAfterDelay() {
    Future.delayed(Duration(seconds: 4), () {
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
                    context,
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
                    child: Icon(Icons.close, color: AppColors.white),
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
                      context,
                      "Audio & Subtitles",
                      fontSize: PoppinsFontSizeVariant.size12,
                      fontWeight: PoppinsFontWeightVariant.regular,
                      color: AppColors.wDark,
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.close, color: AppColors.white),
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

  String _format(Duration d) {
    String two(int n) => n.toString().padLeft(2, '0');
    final minutes = two(d.inMinutes.remainder(60));
    final seconds = two(d.inSeconds.remainder(60));
    final hours = d.inHours;
    return hours > 0 ? '$hours:$minutes:$seconds' : '$minutes:$seconds';
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
                setState(() {
                  _controlsVisible = !_controlsVisible;
                });

                if (_controlsVisible) {
                  _hideControlsAfterDelay();
                }
              },
              child: showLoader
                  ? Center(child: CircularProgressIndicator())
                  : BetterPlayer(controller: _betterPlayerController),
            ),
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
                        color: AppColors.bRegular,
                        child: Center(
                          child: Text(
                            "EP ${index + 1}",
                            style: const TextStyle(color: AppColors.white),
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
      color: AppColors.black.withOpacity(0.3),
      child: Stack(
        children: [
          if (_controlsVisible && !_isLocked)
            Center(
              child: IconButton(
                icon: Icon(
                  _betterPlayerController.isPlaying()!
                      ? Icons.pause_circle
                      : Icons.play_circle,
                  size: 90,
                ),
                onPressed: () {
                  setState(() {
                    final videoPosition = _betterPlayerController
                        .videoPlayerController!
                        .value
                        .position;
                    final videoDuration = _betterPlayerController
                        .videoPlayerController!
                        .value
                        .duration;

                    if (_betterPlayerController.isPlaying()!) {
                      _betterPlayerController.pause();
                    } else {
                      if (videoPosition >= videoDuration!) {
                        _betterPlayerController.seekTo(Duration.zero);
                      }
                      _betterPlayerController.play();
                    }
                  });
                },
              ),
            ),

          Positioned(
            bottom: 10,
            child: SizedBox(
              width: screenSize.width,
              child: Column(
                children: [
                  if (_betterPlayerController != null &&
                      _betterPlayerController.videoPlayerController != null)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Slider(
                            activeColor: AppColors.white,
                            inactiveColor: AppColors.white.withOpacity(0.3),
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
                              _betterPlayerController.videoPlayerController!
                                  .seekTo(
                                    Duration(milliseconds: value.toInt()),
                                  );
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: Text(
                            _format(
                              _betterPlayerController
                                  .videoPlayerController!
                                  .value
                                  .position,
                            ),
                            style: TextStyle(color: AppColors.white),
                          ),
                        ),
                      ],
                    ),

                  SizedBox(height: 4),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (_) => _speedPopup(),
                          );
                        },
                        child: Row(
                          children: [
                            Image.asset(
                              Assets.images.speed.path,
                              width: 16,
                              height: 16,
                            ),
                            SizedBox(width: 10),
                            PoppinsText(
                              context,
                              "Speed",
                              fontSize: PoppinsFontSizeVariant.size12,
                              fontWeight: PoppinsFontWeightVariant.semiBold,
                              color: AppColors.white,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 32),

                      GestureDetector(
                        onTap: _openAudioSubtitlePopup,
                        child: Row(
                          children: [
                            Image.asset(
                              Assets.images.audioSubtitles.path,
                              width: 16,
                              height: 16,
                            ),
                            SizedBox(width: 10),
                            PoppinsText(
                              context,
                              "Audio & Subtitle",
                              fontSize: PoppinsFontSizeVariant.size12,
                              fontWeight: PoppinsFontWeightVariant.semiBold,
                              color: AppColors.white,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 32),

                      Row(
                        children: [
                          Image.asset(
                            Assets.images.audioSubtitles.path,
                            width: 16,
                            height: 16,
                          ),
                          SizedBox(width: 10),
                          PoppinsText(
                            context,
                            "Picture in Picture",
                            fontSize: PoppinsFontSizeVariant.size12,
                            fontWeight: PoppinsFontWeightVariant.semiBold,
                            color: AppColors.white,
                          ),
                        ],
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
                color: AppColors.white,
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
            text == "Normal" ? 1.0 : double.parse(text.replaceAll('x', '')),
          );
        });
        Navigator.pop(context); // Popup close
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
                  ? Icon(Icons.check, color: AppColors.white, size: 20)
                  : SizedBox.shrink(),
            ),
            SizedBox(width: 12),
            Expanded(
              child: PoppinsText(
                context,
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
        }

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
                  ? Icon(Icons.check, color: AppColors.white, size: 20)
                  : SizedBox.shrink(),
            ),
            SizedBox(width: 12),
            Expanded(
              child: PoppinsText(
                context,
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

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations(DeviceOrientation.values);
    _betterPlayerController.dispose();
    super.dispose();
  }
}
