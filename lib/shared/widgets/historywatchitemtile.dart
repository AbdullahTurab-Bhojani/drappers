import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../drappers.dart';
import '../../gen/assets.gen.dart';

class VideosBoxWidget extends StatelessWidget {
  final dynamic podcast;
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
            GestureDetector(
              onTap: () {
                context.pushNamed(AppRoutes.contentDetail.name);
              },
              child: Container(
                width: 122,
                height: 173,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(podcast.imagePath),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PoppinsText(
                    context,
                    podcast.title,
                    fontSize: PoppinsFontSizeVariant.size16,
                    fontWeight: PoppinsFontWeightVariant.medium,
                    textOverflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 20),
                  PoppinsText(
                    context,
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
                        context,
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
                      Image.asset(
                        Assets.images.crossnewicon.path,
                        //  scale: 1,
                        width: 24,
                        height: 24,
                      ),
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
