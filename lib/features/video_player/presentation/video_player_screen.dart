import 'package:better_player_plus/better_player_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';

class CustomVideoPlayerScreen extends StatefulWidget {
  const CustomVideoPlayerScreen({super.key});

  @override
  State<CustomVideoPlayerScreen> createState() =>
      _CustomVideoPlayerScreenState();
}

class _CustomVideoPlayerScreenState extends State<CustomVideoPlayerScreen> {
  bool _showControls = true;
  VoidCallback? _controllerListener;
  late BetterPlayerController _betterPlayerController;

  final String videoUrl =
      "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4";

  bool _controlsVisible = true;

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
    BetterPlayerConfiguration betterPlayerConfiguration =
        BetterPlayerConfiguration(
          aspectRatio: 16 / 9,
          fit: BoxFit.cover,
          handleLifecycle: true,
          controlsConfiguration: BetterPlayerControlsConfiguration(
            showControls: false,
            enableFullscreen: true,
          ),
          autoPlay: true,
        );

    BetterPlayerDataSource dataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      videoUrl,
    );

    _betterPlayerController = BetterPlayerController(
      betterPlayerConfiguration,
      betterPlayerDataSource: dataSource,
    );

    _hideControlsAfterDelay();
  }

  void _hideControlsAfterDelay() {
    Future.delayed(Duration(seconds: 3), () {
      if (mounted && _betterPlayerController.isPlaying() == true) {
        setState(() {
          _controlsVisible = false;
        });
      }
    });
  }

  void _toggleControlsVisibility() {
    setState(() {
      _controlsVisible = !_controlsVisible;
      if (_controlsVisible) {
        _hideControlsAfterDelay();
      }
    });
  }

  void _changePlaybackSpeed() {
    double currentSpeed =
        _betterPlayerController.videoPlayerController?.value.speed ?? 1.0;
    double newSpeed = currentSpeed > 1.0 ? 1.0 : 1.5;

    _betterPlayerController.setSpeed(newSpeed);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Speed set to ${newSpeed.toStringAsFixed(1)}x')),
    );

    _toggleControlsVisibility();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: BetterPlayer(controller: _betterPlayerController),
          ),

          Positioned.fill(
            child: GestureDetector(
              onTap: _toggleControlsVisibility,
              child: Container(color: Colors.transparent),
            ),
          ),

          AnimatedOpacity(
            opacity: _controlsVisible ? 1.0 : 0.0,
            duration: Duration(milliseconds: 300),
            child: Container(
              color: Colors.black.withOpacity(0.3),
              child: Stack(
                children: [
                  Center(child: _buildCenterControls()),

                  Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: _buildProgressBar(),
                  ),

                  Positioned(
                    top: 10,
                    left: 10,
                    right: 10,
                    child: _buildTopTitleAndControls(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopTitleAndControls() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.cast, color: Colors.white),

          PoppinsText(
            "Finale - Meet The Drapers Seaso...",
            color: Colors.white,
            fontSize: PoppinsFontSizeVariant.size22,
            fontWeight: PoppinsFontWeightVariant.medium,
          ),

          GestureDetector(
            onTap: () => Navigator.of(context).pop(),

            child: Image.asset(
              Assets.images.cancelicon.path,
              width: 30,
              height: 30,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeftSideControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _buildControlIcon(Icons.speed, 'Speed (1x)', _changePlaybackSpeed),
        _buildControlIcon(Icons.lock_open, 'Lock', () {}),
        _buildControlIcon(Icons.list, 'Episodes', () {}),
        _buildControlIcon(Icons.subtitles, 'Audio & Subtitles', () {}),
        _buildControlIcon(Icons.hd, 'HD Quality', () {}),
        _buildControlIcon(Icons.skip_next, 'Next Ep.', () {}),
      ],
    );
  }

  Widget _buildControlIcon(IconData icon, String label, VoidCallback onTap) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Icon(icon, color: Colors.white, size: 28),
              SizedBox(width: 8),
              PoppinsText(
                label,
                color: Colors.white,
                fontSize: PoppinsFontSizeVariant.size12,
                fontWeight: PoppinsFontWeightVariant.semiBold,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCenterControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.replay_10, color: Colors.white, size: 48),
          onPressed: () {
            final currentPosition =
                _betterPlayerController.videoPlayerController!.value.position;

            final newPosition = currentPosition - Duration(seconds: 10);

            _betterPlayerController.seekTo(
              newPosition > Duration.zero ? newPosition : Duration.zero,
            );

            _toggleControlsVisibility();
          },
        ),
        SizedBox(width: 40),

        IconButton(
          icon: Icon(
            _betterPlayerController.isPlaying() == true
                ? Icons.pause_circle_filled
                : Icons.play_circle_filled,
            color: Colors.white,
            size: 80,
          ),
          onPressed: () {
            _betterPlayerController.isPlaying() == true
                ? _betterPlayerController.pause()
                : _betterPlayerController.play();
          },
        ),
        SizedBox(width: 40),

        IconButton(
          icon: Icon(Icons.forward_10, color: Colors.white, size: 48),
          onPressed: () {
            final currentPosition =
                _betterPlayerController.videoPlayerController!.value.position;

            _betterPlayerController.seekTo(
              currentPosition + Duration(seconds: 10),
            );

            _toggleControlsVisibility();
          },
        ),
      ],
    );
  }

  Widget _buildProgressBar() {
    return ValueListenableBuilder(
      valueListenable: _betterPlayerController.videoPlayerController!,
      builder: (context, videoValue, child) {
        final currentPosition = videoValue.position;
        final totalDuration = videoValue.duration;

        final double progress =
            totalDuration != null && totalDuration.inMilliseconds > 0
            ? currentPosition.inMilliseconds / totalDuration.inMilliseconds
            : 0.0;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 60),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 6.0,
                        ),
                        overlayShape: SliderComponentShape.noOverlay,
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Colors.white38,
                        trackHeight: 3.0,
                      ),
                      child: Slider(
                        value: progress,
                        onChanged: (value) {
                          final newPosition = Duration(
                            milliseconds:
                                (totalDuration!.inMilliseconds * value).round(),
                          );

                          _betterPlayerController.seekTo(newPosition);
                        },
                        onChangeStart: (value) {
                          _betterPlayerController.pause();
                        },
                        onChangeEnd: (value) {
                          _betterPlayerController.play();
                          _hideControlsAfterDelay();
                        },
                      ),
                    ),
                  ),

                  SizedBox(width: 10),

                  Text(
                    _formatDuration(currentPosition),
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),

              SizedBox(height: 10),

              _buildLeftSideControls(),
            ],
          ),
        );
      },
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");

    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    final hours = twoDigits(duration.inHours);

    if (duration.inHours > 0) {
      return "$hours:$minutes:$seconds";
    }
    return "$minutes:$seconds";
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    _betterPlayerController.dispose();
    super.dispose();
  }
}
