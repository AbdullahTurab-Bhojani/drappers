import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/extensions/theme_extension.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';
import '../../../shared/widgets/app_bar/main_app_bar.dart';
import '../../../shared/widgets/cardwidget/card_widget.dart';
import '../../../shared/widgets/reelcard/reelcard_widget.dart';
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

class Likecontent extends StatefulWidget {
  const Likecontent({super.key});

  @override
  State<Likecontent> createState() => _LikecontentState();
}

List trendingimages = [
  Assets.images.trendingshowimage1.path,
  Assets.images.trendingshowimage2.path,
  Assets.images.trendingshowimage3.path,
  Assets.images.trendingshowimage4.path,
  Assets.images.trendingshowimage5.path,
  Assets.images.trendingshowimage6.path,
  Assets.images.trendingshowimage7.path,
  Assets.images.trendingshowimage3.path,
  Assets.images.trendingshowimage4.path,
  Assets.images.trendingshowimage5.path,
];

class _LikecontentState extends State<Likecontent>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
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
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;
    List<String> reelimages = [
      Assets.images.reelimage1.path,
      Assets.images.reelimage2.path,
      Assets.images.reelimage3.path,
      Assets.images.reelimage4.path,
      Assets.images.reelimage5.path,
    ];
    List<String> reelTitles = [
      'Rio De Janeiro - Meet The Drappers',
      'Brand Acceleration - Meet The Drappers',
      'Season 5, India - Meet The Drappers',
      'The Frontier - Meet The Drappers',
      'Season 6, Saudi Arabia - Meet The Drappers',
    ];

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
              title: "Liked Content",
              centerTitle: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: [
                InkWell(
                  onTap: () {
                    context.pushNamed(AppRoutes.searchscreen.name);
                  },
                  child: Image.asset(
                    Assets.images.searchicon.path,
                    color: customColors.textColor,
                  ),
                ),
                SizedBox(width: 20),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.transparent)),
                ),
                child: TabBar(
                  indicator: BoxDecoration(
                    color: customColors.textColor,
                    borderRadius: BorderRadius.circular(30)
                  ),
                  dividerHeight: 0,
                  indicatorSize: TabBarIndicatorSize.tab,
                  controller: _tabController,
                
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  indicatorColor: customColors.textColor,
                  labelColor: customColors.blackshade,
                  unselectedLabelColor: customColors.labelColor,
                  labelStyle: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  tabs: const [
                    Tab(text: 'All'),
                    Tab(text: "Videos"),
                    Tab(text: "Reels"),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                         Expanded(child: Column(
                          children: [
                            Row(
                          children: [
                            Text("data"),  Text("data"),
                          ],
                         ),

                          ],
                         )),
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
                              width: 120, height: 173,
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
                                    color: customColors.textColor,
                                    fontSize: PoppinsFontSizeVariant.size16,
                                    fontWeight: PoppinsFontWeightVariant.medium,
                                    textOverflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 20),
                                  PoppinsText(
                                    podcast.description,
                                    fontSize: PoppinsFontSizeVariant.size14,
                                    fontWeight: PoppinsFontWeightVariant.regular,
                                    color: customColors.greyColor,
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
                                        fontWeight: PoppinsFontWeightVariant.regular,
                                        color: customColors.textColor,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          height: 40, width: 267.86,
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
              
                  GridView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: reelimages.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 15,
                        childAspectRatio: 0.5,
                      ),
                      itemBuilder: (context, index) {
                        return ReelcardWidget(
                        
                          assetImagePath: reelimages[index],
                          title: reelTitles[index],
                          reelCardHeight: 100,
                          reelCardWidth: 100,
                          fontSizeVariant: PoppinsFontSizeVariant.size14,
                          showSaveIcon: false,
                        );
                      },
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
}
