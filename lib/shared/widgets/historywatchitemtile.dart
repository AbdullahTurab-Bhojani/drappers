import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../drappers.dart';
import '../../gen/assets.gen.dart';
// Assuming PoppinsText, AppButton, AppColors, and Assets are defined elsewhere.
// You'll need to replace these with your actual definitions or substitute them.

// Placeholder for external dependencies for the code to compile
// You should ensure these classes/variables exist in your project.
// Example placeholders:
// class PoppinsText extends StatelessWidget {
//   final String data;
//   final dynamic fontSize;
//   final dynamic fontWeight;
//   final TextOverflow? textOverflow;
//   final Color? color;
//   final int? maxLines;
//   const PoppinsText(this.data, {super.key, required this.fontSize, required this.fontWeight, this.textOverflow, this.color, this.maxLines});
//   @override Widget build(BuildContext context) => Text(data, overflow: textOverflow, maxLines: maxLines, style: TextStyle(fontSize: 16));
// }
// class AppButton extends StatelessWidget {
//   final VoidCallback onPressed;
//   final String title;
//   final Size buttonSize;
//   final Image prefixIcon;
//   const AppButton({super.key, required this.onPressed, required this.title, required this.buttonSize, required this.prefixIcon});
//   @override Widget build(BuildContext context) => ElevatedButton(onPressed: onPressed, child: Text(title));
// }
// class AppColors { static const wDark = Colors.black; }
// class Assets { static final images = _AssetsImages(); }
// class _AssetsImages { final playstrokeicon = _AssetPath('assets/images/play_stroke_icon.png'); final cancelicon = _AssetPath('assets/images/cancel_icon.png'); }
// class _AssetPath { final String path; _AssetPath(this.path); }

// You need a data model for 'podcast'
// class Podcast {
//   final String imagePath;
//   final String title;
//   final String description;
//   Podcast(this.imagePath, this.title, this.description);
// }

class VideosBoxWidget extends StatelessWidget {
  final dynamic
  podcast; // Replace 'dynamic' with your actual Podcast model class
  final double sliderValue;
  final int index;
  final Function(double v, int index) onSliderChanged;
  final VoidCallback onContinuePressed;
  final BuildContext context;

  const VideosBoxWidget({
    super.key,
    required this.podcast,
    required this.sliderValue,
    required this.index,
    required this.onSliderChanged,
    required this.onContinuePressed,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 120,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(podcast.imagePath),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PoppinsText(
                    podcast.title,
                    fontSize: PoppinsFontSizeVariant.size16,
                    fontWeight: PoppinsFontWeightVariant.medium,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 20),
                  PoppinsText(
                    podcast.description,
                    fontSize: PoppinsFontSizeVariant.size14,
                    fontWeight: PoppinsFontWeightVariant.regular,
                    color: Colors.grey,
                    maxLines: 2,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            trackHeight: 3,
                            thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 0,
                            ),
                            overlayShape: const RoundSliderOverlayShape(
                              overlayRadius: 0,
                            ),
                          ),
                          child: Slider(
                            activeColor: const Color(0xFF0072FF),
                            inactiveColor: const Color(0xFF00002A),
                            value: sliderValue,
                            min: 0,
                            max: 100,
                            onChanged: (v) {
                              onSliderChanged(v, index);
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      PoppinsText(
                        '-12:34',
                        fontSize: PoppinsFontSizeVariant.size10,
                        fontWeight: PoppinsFontWeightVariant.regular,
                        color: AppColors.wDark,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: AppButton(
                          onPressed: () {
                            context.pushNamed(AppRoutes.videoScreen.name);
                          },
                          title: 'Continue',
                          buttonSize: const Size(double.infinity, 40),
                          prefixIcon: Image.asset(
                            Assets.images.playstrokeicon.path,
                            width: 14,
                            height: 14,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Image.asset(Assets.images.cancelicon.path, height: 40),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
