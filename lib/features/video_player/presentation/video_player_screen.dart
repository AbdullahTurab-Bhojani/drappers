import 'package:better_player_plus/better_player_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomVideoPlayerScreen extends StatefulWidget {
  const CustomVideoPlayerScreen({super.key});

  @override
  State<CustomVideoPlayerScreen> createState() =>
      _CustomVideoPlayerScreenState();
}

class _CustomVideoPlayerScreenState extends State<CustomVideoPlayerScreen> {
  late BetterPlayerController _betterPlayerController;
  final String videoUrl =
      "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4";

  bool _controlsVisible = true;

  @override
  void initState() {
    super.initState();
    // 🔑 Step 1: Initialize hote hi landscape aur fullscreen lock karein
    _setLandscapeAndFullscreen();
    _initializePlayer();
  }

  // 🔑 Function to set Landscape and Fullscreen
  void _setLandscapeAndFullscreen() {
    // Landscape Mode mein lock karein
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    // Status bar aur navigation bar ko chhupa de (Fullscreen effect ke liye)
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  void _initializePlayer() {
    BetterPlayerConfiguration betterPlayerConfiguration =
        const BetterPlayerConfiguration(
          aspectRatio: 16 / 9,
          fit: BoxFit.contain,
          handleLifecycle: true,

          // Fullscreen shuru karne ke liye yeh property zaroori hai
          // Lekin chuki hum manually SystemChrome se control kar rahe hain,
          // isse off hi rakhte hain aur player ko full area dete hain.
          controlsConfiguration: BetterPlayerControlsConfiguration(
            showControls: false,
            enableFullscreen: false,
          ),
          // Auto play on kar sakte hain taaki video shuru hote hi chale
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
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted && _betterPlayerController.isPlaying() == true) {
        // Check ki video play ho rahi hai
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
    // 🔑 Change: SafeArea aur AspectRatio hata denge
    // Taki video poori screen ko bhar sake (Fullscreen landscape mein)
    return Scaffold(
      // Background color black rakhein taaki full screen feel aaye
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          children: <Widget>[
            // BetterPlayer ko poori screen lene dein
            BetterPlayer(controller: _betterPlayerController),

            GestureDetector(
              onTap: _toggleControlsVisibility,
              child: Container(color: Colors.transparent),
            ),
            AnimatedOpacity(
              opacity: _controlsVisible ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: Container(
                color: Colors.black.withOpacity(0.3),
                child: Stack(
                  children: [
                    Center(child: _buildCenterControls()),
                    Positioned(
                      top: 80,
                      left: 10,
                      child: _buildLeftSideControls(),
                    ),
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
      ),
    );
  }

  // ... (baaki ke widgets jaisa pehle tha, same rahenge)

  Widget _buildTopTitleAndControls() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Finale - Meet The Drapers Seas0...",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        Row(
          children: [
            Icon(Icons.brightness_medium, color: Colors.white),
            SizedBox(width: 10),
            Icon(Icons.cast, color: Colors.white),
          ],
        ),
      ],
    );
  }

  Widget _buildLeftSideControls() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Icon(icon, color: Colors.white, size: 28),
            Text(
              label.split(' ').first,
              style: const TextStyle(color: Colors.white, fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCenterControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // Rewind 10s
        IconButton(
          icon: const Icon(Icons.replay_10, color: Colors.white, size: 48),
          onPressed: () {
            // Error handling ke liye check
            final currentPosition =
                _betterPlayerController.videoPlayerController!.value.position;
            _betterPlayerController.seekTo(
              currentPosition - const Duration(seconds: 10) > Duration.zero
                  ? currentPosition - const Duration(seconds: 10)
                  : Duration.zero,
            );
            _toggleControlsVisibility();
          },
        ),

        // Play/Pause
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

        // Forward 10s
        IconButton(
          icon: const Icon(Icons.forward_10, color: Colors.white, size: 48),
          onPressed: () {
            _betterPlayerController.seekTo(
              _betterPlayerController.videoPlayerController!.value.position +
                  const Duration(seconds: 10),
            );
            _toggleControlsVisibility();
          },
        ),
      ],
    );
  }

  Widget _buildProgressBar() {
    // Corrected: ValueListenableBuilder se generic type hata diya gaya hai,
    // aur hum simple 'videoValue' use karenge.
    return ValueListenableBuilder(
      // videoPlayerController! ab better_player_plus ke internal type ko refer karega
      valueListenable: _betterPlayerController.videoPlayerController!,
      builder: (context, videoValue, child) {
        // Builder ke andar, hum assume karenge ki 'videoValue' woh type hai jise hum sun rahe hain.
        // Hum iske members (.position, .duration) ko seedhe access karenge.
        final currentPosition = videoValue.position;
        final totalDuration = videoValue.duration;

        final double progress =
            totalDuration != null && totalDuration.inMilliseconds > 0
            ? currentPosition.inMilliseconds / totalDuration.inMilliseconds
            : 0.0;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _formatDuration(currentPosition),
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  Text(
                    _formatDuration(totalDuration ?? Duration.zero),
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  thumbShape: const RoundSliderThumbShape(
                    enabledThumbRadius: 6.0,
                  ),
                  overlayShape: SliderComponentShape.noOverlay,
                  activeTrackColor: Colors.white,
                  inactiveTrackColor: Colors.white38,
                  trackHeight: 3.0,
                ),
                child: Slider(
                  value: progress,
                  onChanged: (newValue) {
                    final newPosition = Duration(
                      milliseconds: (totalDuration!.inMilliseconds * newValue)
                          .round(),
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
    // 🔑 Step 2: Jab screen dispose ho, toh orientation aur UI mode ko reset karein

    // UI Mode reset: Status bar aur navigation bar wapas laayein
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );

    // Orientation reset: App ko wapas Portrait aur Landscape dono allow karein
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
