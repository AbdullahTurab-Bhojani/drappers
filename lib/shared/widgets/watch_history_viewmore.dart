
// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

import '../../drappers.dart';
import '../../gen/assets.gen.dart';
import 'app_bar/main_app_bar.dart';

class watch_History {
  final String title;
  final String description;
  final String imagePath;

  watch_History({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}

class WatchHistoryViewmore extends StatefulWidget {
  const WatchHistoryViewmore({super.key});

  @override
  State<WatchHistoryViewmore> createState() => _WatchHistoryViewmoreState();
}

class _WatchHistoryViewmoreState extends State<WatchHistoryViewmore> {
  final List<Map<String, dynamic>> _podcasts = [
    {
      'data': watch_History(
        title: 'Finale – Meet The Drapers \nSeason 07 (2025)',
        description:
            'Meet the Drapers returns to SHACK15 for an electrifying TikTok Global episode,',
        imagePath: Assets.images.podcastimage1.path,
      ),
      'slider': 60.0,
    },
    {
      'data': watch_History(
        title: 'Episode 2 – Startup Stories',
        description:
            'Dive into inspiring stories of new entrepreneurs and their journey.',
        imagePath: Assets.images.podcastimage2.path,
      ),
      'slider': 20.0,
    },
    {
      'data': watch_History(
        title: 'Episode 3 – Tech Innovations',
        description: 'Latest updates on tech, AI, and innovative startups.',
        imagePath: Assets.images.podcastimage3.path,
      ),
      'slider': 40.0,
    },
    {
      'data': watch_History(
        title: 'Episode 2 – Startup Stories',
        description:
            'Dive into inspiring stories of new entrepreneurs and their journey.',
        imagePath: Assets.images.podcastimage2.path,
      ),
      'slider': 20.0,
    },
     {
      'data': watch_History(
        title: 'Episode 3 – Tech Innovations',
        description: 'Latest updates on tech, AI, and innovative startups.',
        imagePath: Assets.images.podcastimage3.path,
      ),
      'slider': 40.0,
    },
  ];

  @override
  Widget build(BuildContext context) {
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
                onTap: () => Navigator.of(context).pop(),
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Image.asset(
                    "assets/images/backicon.png",
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
              title: "Watch History",
              centerTitle: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            SizedBox(height: 30),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: _podcasts.length,
                  itemBuilder: (context, index) {
                    final podcast = _podcasts[index]['data'] as watch_History;
                    double sliderValue = _podcasts[index]['slider'];

                    return Padding(
                      padding: EdgeInsets.only(bottom: 20),
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
                            SizedBox(width: 12),
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
                                  SizedBox(height: 20),
                                  PoppinsText(
                                    podcast.description,
                                    fontSize: PoppinsFontSizeVariant.size14,
                                    fontWeight:
                                        PoppinsFontWeightVariant.regular,
                                    color: Colors.grey,
                                    maxLines: 2,
                                    textOverflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 20),
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
                                      SizedBox(width: 8),
                                      PoppinsText(
                                        '-12:34',
                                        fontSize: PoppinsFontSizeVariant.size10,
                                        fontWeight:
                                            PoppinsFontWeightVariant.regular,
                                        color: AppColors.wDark,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: AppButton(
                                          onPressed: () {},
                                          title: 'Continue',
                                          buttonSize: Size(double.infinity, 40),
                                          prefixIcon: Image.asset(
                                            Assets.images.playstrokeicon.path,
                                            width: 14,
                                            height: 14,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 20),
                                      Image.asset(
                                        Assets.images.cancelicon.path,
                                        height: 40,
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