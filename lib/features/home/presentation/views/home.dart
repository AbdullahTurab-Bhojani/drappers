import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../../../../drappers.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../shared/widgets/app_bar/main_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  VideoPlayerController? _controller;
  bool _showControls = true;
  final posterPath = '/mnt/data/Live Tv.png'; // <-- uploaded file path

  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.network(
            'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
          )
          ..initialize().then((_) {
            setState(() {});
            _controller!.play();
          });

    // Keep controls visible when user interacts
    _controller!.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _controller!.removeListener(() {});
    _controller!.dispose();
    super.dispose();
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
    final playerWidth = 400.0;
    final playerHeight = 500.0;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(Assets.images.screensbg.path, fit: BoxFit.cover),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppMainBar(
                width: 285,
                leadingText: "Welcome Back John!",
                title: "",
                centerTitle: false,
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: [
                  Image.asset(
                    Assets.images.searchicon.path,
                    color: Colors.white,
                  ),
                  SizedBox(width: 16),
                  Image.asset(
                    Assets.images.notificationsicon.path,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                ],
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 45,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 10),
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Colors.white, width: 1),
                            ),
                            child: Center(child: PoppinsText('data')),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Stack(
                    children: [
                      SizedBox(
                        width: playerWidth,
                        height: playerHeight,
                        child: _controller!.value.isInitialized
                            ? VideoPlayer(_controller!)
                            : (File(posterPath).existsSync()
                                  ? Image.file(
                                      File(posterPath),
                                      fit: BoxFit.cover,
                                    )
                                  : Container(color: Colors.grey[900])),
                      ),
                      SizedBox(
                        width: playerWidth,
                        height: playerHeight,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.18),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 12,
                        left: 14,
                        right: 14,
                        child: Row(
                          children: [
                            Expanded(
                              child: PoppinsText(
                                'Meet The Drapers - Live',
                                color: Colors.white,
                                fontWeight: PoppinsFontWeightVariant.medium,
                                fontSize: PoppinsFontSizeVariant.size14,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1,
                                ),
                                // color: Colors.redAccent,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.circle,
                                    size: 8,
                                    color: Colors.red,
                                  ),
                                  SizedBox(width: 6),
                                  PoppinsText(
                                    'Live TV',
                                    color: Colors.white,
                                    fontWeight:
                                        PoppinsFontWeightVariant.regular,
                                    fontSize: PoppinsFontSizeVariant.size12,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Icon(Icons.more_vert, color: Colors.white),
                          ],
                        ),
                      ),
                      Positioned.fill(
                        child: GestureDetector(
                          onTap: () =>
                              setState(() => _showControls = !_showControls),
                          child: Center(
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 200),
                              opacity: _showControls ? 1.0 : 0.0,
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.45),
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  iconSize: 36,
                                  color: Colors.white,
                                  icon: Icon(
                                    _controller!.value.isPlaying
                                        ? Icons.pause
                                        : Icons.play_arrow,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _controller!.value.isPlaying
                                          ? _controller!.pause()
                                          : _controller!.play();
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 12,
                        right: 12,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 6,
                              ),
                              height: 36,
                              width: 129,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.35),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.info_outline,
                                    size: 18,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'More Info',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            if (_controller!.value.isInitialized)
                              Row(
                                children: [
                                  SliderTheme(
                                    data: SliderTheme.of(context).copyWith(
                                      thumbShape: const RoundSliderThumbShape(
                                        enabledThumbRadius: 10,
                                      ),
                                      overlayShape:
                                          SliderComponentShape.noOverlay,
                                    ),
                                    child: Slider(
                                      activeColor: Colors.white,
                                      value: _controller!
                                          .value
                                          .position
                                          .inMilliseconds
                                          .toDouble()
                                          .clamp(
                                            0,
                                            _controller!
                                                .value
                                                .duration
                                                .inMilliseconds
                                                .toDouble(),
                                          ),
                                      max: _controller!
                                          .value
                                          .duration
                                          .inMilliseconds
                                          .toDouble(),
                                      onChanged: (v) {
                                        final pos = Duration(
                                          milliseconds: v.round(),
                                        );
                                        _controller!.seekTo(pos);
                                      },
                                      onChangeEnd: (_) {},
                                    ),
                                  ),
                                  Text(
                                    _controller!.value.isInitialized
                                        ? _format(_controller!.value.position)
                                        : '00:00',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ],
                              )
                            else
                              const SizedBox(height: 4),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
