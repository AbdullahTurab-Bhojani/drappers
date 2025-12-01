import 'package:better_player_plus/better_player_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../gen/assets.gen.dart';

class CustomVideoPlayerScreen extends StatefulWidget {
  const CustomVideoPlayerScreen({super.key});

  @override
  State<CustomVideoPlayerScreen> createState() =>
      _CustomVideoPlayerScreenState();
}

class _CustomVideoPlayerScreenState extends State<CustomVideoPlayerScreen> {
  late BetterPlayerController _betterPlayerController;

  bool _controlsVisible = true;
  bool _isLocked = false;
  bool _showEpisodes = false;

  final String videoUrl =
      "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4";

  final List<String> episodes = List.generate(
    10,
    (index) =>
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
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

  void _hideControlsAfterDelay() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted && _betterPlayerController.isPlaying() == true) {
        setState(() => _controlsVisible = false);
      }
    });
  }

  void _toggleLock() => setState(() => _isLocked = !_isLocked);

  void _changeQuality() {
    showModalBottomSheet(
      context: context,
      builder: (_) => Column(
        mainAxisSize: MainAxisSize.min,
        children: ["360p", "480p", "720p"].map((q) {
          return ListTile(
            title: Text(q),
            onTap: () {
              _betterPlayerController.setResolution(
                _betterPlayerController
                    .betterPlayerDataSource!
                    .resolutions![q]!,
              );
              Navigator.pop(context);
            },
          );
        }).toList(),
      ),
    );
  }

  void _toggleSubtitles() async {
    final list = _betterPlayerController.betterPlayerSubtitlesSourceList;

    if (list.isEmpty) return;

    final active = _betterPlayerController.betterPlayerSubtitlesSource;

    if (active != null) {
      await _betterPlayerController.setupSubtitleSource(
        BetterPlayerSubtitlesSource(type: BetterPlayerSubtitlesSourceType.none),
      );
    } else {
      await _betterPlayerController.setupSubtitleSource(list.first);
    }
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

          if (!_isLocked)
            Positioned.fill(
              child: GestureDetector(
                onTap: () {
                  setState(() => _controlsVisible = !_controlsVisible);
                  if (_controlsVisible) _hideControlsAfterDelay();
                },
              ),
            ),

          if (_controlsVisible) _buildControls(),

          // ✅ HORIZONTAL EPISODES BAR
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
                      onTap: () {
                        _playEpisode(index);
                        setState(() => _showEpisodes = false);
                      },
                      child: Container(
                        margin: const EdgeInsets.all(6),
                        padding: const EdgeInsets.all(12),
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
        ],
      ),
    );
  }

  Widget _buildControls() {
    return Container(
      color: Colors.black.withOpacity(0.3),
      child: Stack(
        children: [
          // LOCK
          Positioned(
            left: 15,
            top: 80,
            child: IconButton(
              icon: Icon(
                _isLocked ? Icons.lock : Icons.lock_open,
                color: Colors.white,
                size: 35,
              ),
              onPressed: _toggleLock,
            ),
          ),

          if (!_isLocked)
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.replay_10,
                      color: Colors.white,
                      size: 44,
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
                      color: Colors.white,
                      size: 90,
                    ),
                    onPressed: () {
                      _betterPlayerController.isPlaying()!
                          ? _betterPlayerController.pause()
                          : _betterPlayerController.play();
                    },
                  ),
                  const SizedBox(width: 40),
                  IconButton(
                    icon: const Icon(
                      Icons.forward_10,
                      color: Colors.white,
                      size: 44,
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
              left: 15,
              child: Row(
                children: [
                  _btn(Icons.hd, "Quality", _changeQuality),
                  const SizedBox(width: 20),
                  _btn(Icons.subtitles, "Subtitles", _toggleSubtitles),
                  const SizedBox(width: 20),
                  _btn(Icons.list, "Episodes", () {
                    setState(() => _showEpisodes = !_showEpisodes);
                  }),
                ],
              ),
            ),

          Positioned(
            top: 10,
            right: 10,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Image.asset(
                Assets.images.cancelicon.path,
                width: 30,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _btn(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 26),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 14),
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
