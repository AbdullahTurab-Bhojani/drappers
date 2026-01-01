import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../drappers.dart';
import '../../gen/assets.gen.dart';
import '../../core/theme/app_scalar.dart'; // make sure this import is correct

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
      padding: EdgeInsets.only(bottom: AppScaler.scaleHeight(context, 20)),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: () {
                context.pushNamed(AppRoutes.contentDetail.name);
              },
              child: Container(
                width: AppScaler.scaleSize(context, 122),
                height: AppScaler.scaleHeight(context, 173),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(podcast.imagePath),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(width: AppScaler.scaleSize(context, 12)),
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
                  SizedBox(height: AppScaler.scaleHeight(context, 12)),
                  PoppinsText(
                    context,
                    podcast.description,
                    fontSize: PoppinsFontSizeVariant.size14,
                    fontWeight: PoppinsFontWeightVariant.regular,
                    color: Colors.grey,
                    maxLines: 2,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: AppScaler.scaleHeight(context, 12)),
                  Row(
                    children: [
                      Expanded(
                        child: SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            trackHeight: 3,
                            thumbShape: RoundSliderThumbShape(
                              enabledThumbRadius: 0,
                            ),
                            overlayShape: RoundSliderOverlayShape(
                              overlayRadius: 0,
                            ),
                          ),
                          child: Slider(
                            activeColor: Color(0xFF0072FF),
                            inactiveColor: Color(0xFF00002A),
                            value: sliderValue,
                            min: 0,
                            max: 100,
                            onChanged: (v) {
                              onSliderChanged(v, index);
                            },
                          ),
                        ),
                      ),
                      SizedBox(width: AppScaler.scaleSize(context, 8)),
                      PoppinsText(
                        context,
                        '-12:34',
                        fontSize: PoppinsFontSizeVariant.size10,
                        fontWeight: PoppinsFontWeightVariant.regular,
                        color: AppColors.wDark,
                      ),
                    ],
                  ),
                  SizedBox(height: AppScaler.scaleHeight(context, 12)),
                  Row(
                    children: [
                      Expanded(
                        child: AppButton(
                          onPressed: () {
                            context.pushNamed(AppRoutes.videoScreen.name);
                          },
                          title: 'Continue',
                          buttonSize: Size(
                            double.infinity,
                            AppScaler.scaleHeight(context, 40),
                          ),
                          prefixIcon: Image.asset(
                            Assets.images.playstrokeicon.path,
                            width: AppScaler.scaleSize(context, 14),
                            height: AppScaler.scaleHeight(context, 14),
                          ),
                        ),
                      ),
                      SizedBox(width: AppScaler.scaleSize(context, 20)),
                      Image.asset(
                        Assets.images.crossnewicon.path,
                        width: AppScaler.scaleSize(context, 24),
                        height: AppScaler.scaleHeight(context, 24),
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
