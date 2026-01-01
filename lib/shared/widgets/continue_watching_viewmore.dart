import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/extensions/theme_extension.dart';
import '../../core/theme/app_scalar.dart';
import '../../drappers.dart';
import '../../gen/assets.gen.dart';
import 'app_bar/main_app_bar.dart';

class Podcast {
  final String title;
  final String description;
  final String imagePath;

  Podcast({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}

class ContinueWatchingViewmore extends StatefulWidget {
  const ContinueWatchingViewmore({super.key});

  @override
  State<ContinueWatchingViewmore> createState() =>
      _ContinueWatchingViewmoreState();
}

class _ContinueWatchingViewmoreState extends State<ContinueWatchingViewmore> {
  final List<Map<String, dynamic>> _podcasts = [
    {
      'data': Podcast(
        title: 'Finale – Meet The Drapers \nSeason 07 (2025)',
        description:
            'Meet the Drapers returns to SHACK15 for an electrifying TikTok Global episode,',
        imagePath: Assets.images.podcastimage1.path,
      ),
      'slider': 60.0,
    },
    {
      'data': Podcast(
        title: 'Episode 2 – Startup Stories',
        description:
            'Dive into inspiring stories of new entrepreneurs and their journey.',
        imagePath: Assets.images.podcastimage2.path,
      ),
      'slider': 20.0,
    },
    {
      'data': Podcast(
        title: 'Episode 3 – Tech Innovations',
        description: 'Latest updates on tech, AI, and innovative startups.',
        imagePath: Assets.images.podcastimage3.path,
      ),
      'slider': 40.0,
    },
    {
      'data': Podcast(
        title: 'Episode 2 – Startup Stories',
        description:
            'Dive into inspiring stories of new entrepreneurs and their journey.',
        imagePath: Assets.images.podcastimage2.path,
      ),
      'slider': 20.0,
    },
    {
      'data': Podcast(
        title: 'Episode 3 – Tech Innovations',
        description: 'Latest updates on tech, AI, and innovative startups.',
        imagePath: Assets.images.podcastimage3.path,
      ),
      'slider': 40.0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.images.screensbg.path),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppMainBar(
              leading: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => Navigator.of(context).pop(),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: AppScaler.scaleSize(context, 20),
                  ),
                  child: Image.asset(
                    "assets/images/backicon.png",
                    width: AppScaler.scaleSize(context, 20),
                    height: AppScaler.scaleHeight(context, 20),
                  ),
                ),
              ),
              title: "Continue Watching",
              centerTitle: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            SizedBox(height: AppScaler.scaleHeight(context, 20)),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppScaler.scaleSize(context, 20),
                ),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: _podcasts.length,
                  itemBuilder: (context, index) {
                    final podcast = _podcasts[index]['data'] as Podcast;
                    double sliderValue = _podcasts[index]['slider'];

                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: AppScaler.scaleHeight(context, 12),
                      ),
                      child: IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              width: AppScaler.scaleSize(context, 120),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(podcast.imagePath),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(8),
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
                                    color: customColors.textColor,
                                    textOverflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(
                                    height: AppScaler.scaleHeight(context, 12),
                                  ),
                                  PoppinsText(
                                    context,
                                    podcast.description,
                                    fontSize: PoppinsFontSizeVariant.size14,
                                    fontWeight:
                                        PoppinsFontWeightVariant.regular,
                                    color: customColors.greyColor,
                                    maxLines: 2,
                                    textOverflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(
                                    height: AppScaler.scaleHeight(context, 12),
                                  ),
                                  // SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: SliderTheme(
                                          data: SliderTheme.of(context)
                                              .copyWith(
                                                trackHeight: 3,
                                                thumbShape:
                                                    RoundSliderThumbShape(
                                                      enabledThumbRadius: 0,
                                                    ),
                                                overlayShape:
                                                    RoundSliderOverlayShape(
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
                                              setState(() {
                                                _podcasts[index]['slider'] = v;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: AppScaler.scaleSize(context, 8),
                                      ),
                                      // SizedBox(width: 8),
                                      PoppinsText(
                                        context,
                                        '-12:34',
                                        fontSize: PoppinsFontSizeVariant.size10,
                                        fontWeight:
                                            PoppinsFontWeightVariant.regular,
                                        color: customColors.textColor,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: AppScaler.scaleHeight(context, 16),
                                  ),
                                  // SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: AppButton(
                                          onPressed: () {
                                            context.pushNamed(
                                              AppRoutes.videoScreen.name,
                                            );
                                          },
                                          title: 'Continue',
                                          buttonSize: Size(double.infinity, 0),
                                          prefixIcon: Image.asset(
                                            Assets.images.playstrokeicon.path,
                                            width: AppScaler.scaleSize(
                                              context,
                                              14,
                                            ),
                                            height: AppScaler.scaleHeight(
                                              context,
                                              14,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: AppScaler.scaleSize(
                                          context,
                                          20,
                                        ),
                                      ),
                                      // SizedBox(width: 20),
                                      Image.asset(
                                        Assets.images.cancelicon.path,
                                        width: AppScaler.scaleSize(context, 24),
                                        height: AppScaler.scaleHeight(
                                          context,
                                          24,
                                        ),
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
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
