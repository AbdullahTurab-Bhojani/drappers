import 'package:flutter/material.dart';
import 'package:better_player_plus/better_player_plus.dart';
import '../../../gen/assets.gen.dart';
import '../../../shared/widgets/player_action_button.dart';
import '../../drappers.dart';

class BottomControlsWidget extends StatelessWidget {
  final BetterPlayerController betterController;
  final bool isLocked;
  final bool showEpisodes;
  final String selectedSpeed;
  final String selectedQuality;
  final VoidCallback changeSpeed;
  final VoidCallback toggleLock;
  final VoidCallback openAudioSubtitlePopup;
  final VoidCallback openVideoQualityPopup;
  final Function(bool) onEpisodesToggle;

  const BottomControlsWidget({
    super.key,
    required this.betterController,
    required this.isLocked,
    required this.showEpisodes,
    required this.selectedSpeed,
    required this.selectedQuality,
    required this.changeSpeed,
    required this.toggleLock,
    required this.openAudioSubtitlePopup,
    required this.openVideoQualityPopup,
    required this.onEpisodesToggle,
  });

  String _formatDuration(Duration d) {
    final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    final controller = betterController.videoPlayerController!;
    final pos = controller.value.position;
    final dur = controller.value.duration ?? Duration.zero;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
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
              SizedBox(width: 8),
              PoppinsText(
                context,
                _formatDuration(pos),
                fontSize: PoppinsFontSizeVariant.size28,
                fontWeight: PoppinsFontWeightVariant.regular,
                color: AppColors.wDark,
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PlayerActionButton(
                      imagePath: Assets.images.speed.path,
                      label: "Speed ($selectedSpeed)",
                      onTap: changeSpeed,
                    ),
                    SizedBox(width: 16),
                    PlayerActionButton(
                      imagePath: Assets.images.videolock.path,
                      label: isLocked ? "Locked" : "Lock",
                      onTap: toggleLock,
                      color: AppColors.white,
                    ),
                    SizedBox(width: 16),
                    PlayerActionButton(
                      imagePath: Assets.images.episode.path,
                      label: "Episodes",
                      onTap: () => onEpisodesToggle(!showEpisodes),
                    ),
                    SizedBox(width: 16),
                    PlayerActionButton(
                      imagePath: Assets.images.audioSubtitles.path,
                      label: "Audio & Subtitles",
                      onTap: openAudioSubtitlePopup,
                    ),
                    SizedBox(width: 16),
                    PlayerActionButton(
                      imagePath: Assets.images.quality.path,
                      label: "Quality ($selectedQuality)",
                      onTap: openVideoQualityPopup,
                    ),
                    SizedBox(width: 16),
                    PlayerActionButton(
                      imagePath: Assets.images.nextepisode.path,
                      label: "Next Ep.",
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
    );
  }
}
