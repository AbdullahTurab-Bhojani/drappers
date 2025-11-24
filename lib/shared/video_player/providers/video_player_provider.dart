import 'package:chewie/chewie.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

import '../../../drappers.dart';

part 'video_player_provider.g.dart';

@riverpod
Future<ChewieController> customVideoPlayer(Ref ref, String videoSource) async {
  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;
  ref.onDispose(() {
    videoPlayerController?.pause();
    videoPlayerController?.dispose();
    chewieController?.dispose();
  });
  final isNetwork = videoSource.contains("http");

  videoPlayerController = isNetwork
      ? VideoPlayerController.networkUrl(Uri.parse(videoSource))
      : VideoPlayerController.asset(videoSource);

  await videoPlayerController.initialize();

  chewieController = ChewieController(
    videoPlayerController: videoPlayerController,
    autoPlay: true,
    looping: false,
    allowPlaybackSpeedChanging: true,
    allowFullScreen: true,
    allowMuting: false,
    fullScreenByDefault: false,
    deviceOrientationsAfterFullScreen: [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
    systemOverlaysOnEnterFullScreen: [
      SystemUiOverlay.top,
      SystemUiOverlay.bottom,
    ],
    systemOverlaysAfterFullScreen: [
      SystemUiOverlay.top,
      SystemUiOverlay.bottom,
    ],
    deviceOrientationsOnEnterFullScreen: [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],

    showOptions: true,
    aspectRatio: videoPlayerController.value.aspectRatio,
    cupertinoProgressColors: ChewieProgressColors(
      playedColor: AppColors.white,
      backgroundColor: AppColors.white.withValues(alpha: 0.2),
      bufferedColor: AppColors.white.withValues(alpha: 0.5),
      handleColor: AppColors.white,
    ),
    materialProgressColors: ChewieProgressColors(
      playedColor: AppColors.white,
      backgroundColor: AppColors.white.withValues(alpha: 0.2),
      bufferedColor: AppColors.white.withValues(alpha: 0.5),
      handleColor: AppColors.white,
    ),
    materialSeekButtonSize: 20,
    customControls: CustomChewieControls(videoSource: videoSource),
  );

  return chewieController;
}
