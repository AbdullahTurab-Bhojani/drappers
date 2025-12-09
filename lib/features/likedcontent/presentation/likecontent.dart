import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/extensions/theme_extension.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';
import '../../../shared/widgets/app_bar/main_app_bar.dart';
import '../../../shared/widgets/continue_watching_viewmore.dart';
import '../../../shared/widgets/historywatchitemtile.dart';
import '../../../shared/widgets/reelcard/reelcard_widget.dart';

class Likecontent extends StatefulWidget {
  const Likecontent({super.key});

  @override
  State<Likecontent> createState() => _LikecontentState();
}

class _LikecontentState extends State<Likecontent>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_onTabChange);
  }

  void _onTabChange() {
    if (_tabController.indexIsChanging && mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _tabController.removeListener(_onTabChange);
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
    final List<Map<String, dynamic>> historyItems = const [
      {
        'image': 'Assets.images.podcastimage1.path',
        'title': 'Finale – Meet The Drapers Season 07 (2025)',
        'subtitle': 'EP.5 - YAT SIU',
        'remaining': '-12:34',
        'showSave': true,
        'progress': 75.0,
      },
      {
        'image': 'Assets.images.podcastimage2.path',
        'title': 'Episode 2 – Startup Stories',
        'subtitle': 'Dive into inspiring stories of new entrepreneurs...',
        'remaining': '-12:34',
        'showSave': false,
        'progress': 40.0,
      },
      {
        'image': 'Assets.images.podcastimage3.path',
        'title': 'Episode 3 – Tech Innovation',
        'subtitle': 'Latest updates on tech, AI, and innovative startups.',
        'remaining': '-12:34',
        'showSave': true,
        'progress': 60.0,
      },
    ];
    final Map<String, dynamic> podcastData = {
      'podcast': Podcast(
        imagePath: Assets.images.podcastimage3.path,
        title: 'Podcast Title Placeholder',
        description: 'This is a description placeholder for the podcast item.',
      ),
      'slider': 75.0,
    };

    void _onSliderChange(double v, int index) {}

    void _onContinue(int index) {}

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
                  padding: EdgeInsets.only(left: 5),
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
              // actions: [
              //   Image.asset(
              //     Assets.images.searchicon.path,
              //     color: customColors.textColor,
              //   ),
              //   SizedBox(width: 20),
              // ],
            ),
            SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TabBar(
                tabAlignment: TabAlignment.start,
                controller: _tabController,
                isScrollable: true,
                dividerHeight: 0,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  color: customColors.textColor,

                  borderRadius: BorderRadius.circular(50),
                ),
                labelColor: customColors.blackshade,
                unselectedLabelColor: customColors.labelColor,
                labelStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                labelPadding: EdgeInsets.symmetric(horizontal: 7),

                tabs: [
                  Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 17),
                    decoration: BoxDecoration(
                      border: _tabController.index == 0
                          ? null
                          : Border.all(
                              color: customColors.labelColor,
                              width: 0.5,
                            ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Tab(text: "All"),
                  ),
                  Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      border: _tabController.index == 1
                          ? null
                          : Border.all(
                              color: customColors.labelColor,
                              width: 0.5,
                            ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Tab(text: "Videos"),
                  ),
                  Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      border: _tabController.index == 2
                          ? null
                          : Border.all(
                              color: customColors.labelColor,
                              width: 0.5,
                            ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Tab(text: "Reels"),
                  ),
                ],
              ),
            ),

            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  /// ------------------------------------------------------------------
                  /// TAB 1 — ALL (Combined Reels + Videos)
                  /// ------------------------------------------------------------------
                  ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Reels',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: customColors.textColor,
                              ),
                            ),
                            AppButton(
                              buttonSize: Size(80, 25),
                              color: Colors.transparent,
                              border: true,
                              onPressed: () {
                                context.goNamed(AppRoutes.trendingshow.name);
                              },
                              title: "View More",
                              borderColor: customColors.textColor,
                              borderWidth: 1,
                              fontSize: PoppinsFontSizeVariant.size12,
                              fontWeight: PoppinsFontWeightVariant.regular,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      SizedBox(
                        height: 250,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: reelimages.length,
                            separatorBuilder: (context, index) =>
                                const SizedBox(width: 10),
                            itemBuilder: (context, index) {
                              return ReelcardWidget(
                                assetImagePath: reelimages[index],
                                title: reelTitles[index],
                                reelCardHeight: 273,
                                reelCardWidth: 149,
                                fontSizeVariant: PoppinsFontSizeVariant.size14,
                                showSaveIcon: true,
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Videos',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: customColors.textColor,
                              ),
                            ),
                            AppButton(
                              buttonSize: Size(80, 25),
                              color: Colors.transparent,
                              border: true,
                              onPressed: () {
                                context.goNamed(AppRoutes.trendingshow.name);
                              },
                              title: "View More",
                              borderColor: customColors.textColor,
                              borderWidth: 1,
                              fontSize: PoppinsFontSizeVariant.size12,
                              fontWeight: PoppinsFontWeightVariant.regular,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      ...historyItems.asMap().entries.map((entry) {
                        final index = entry.key;
                        final item = entry.value;
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 8,
                          ),
                          child: VideosBoxWidget(
                            context: context,
                            podcast: Podcast(
                              imagePath:
                                  item['image'].toString().contains(
                                    'Assets.images',
                                  )
                                  ? Assets
                                        .images
                                        .podcastimage1
                                        .path // Placeholder for asset lookup logic
                                  : item['image'] as String,
                              title: item['title'] as String,
                              description: item['subtitle'] as String,
                            ),
                            sliderValue: item['progress'] as double,
                            index: index,
                            onSliderChanged: _onSliderChange,
                            onContinuePressed: () => _onContinue(index),
                          ),
                        );
                      }).toList(),
                    ],
                  ),

                  /// ------------------------------------------------------------------
                  /// TAB 2 — VIDEOS (Original Vertical List)
                  /// ------------------------------------------------------------------
                  ListView.builder(
                    padding: const EdgeInsets.all(16.0),
                    itemCount: historyItems.length,
                    itemBuilder: (context, index) {
                      final item = historyItems[index];
                      return VideosBoxWidget(
                        context: context,
                        podcast: podcastData['podcast'],
                        sliderValue: podcastData['slider'],
                        index: index,
                        onSliderChanged: _onSliderChange,
                        onContinuePressed: () => _onContinue(index),
                      );
                    },
                  ),

                  /// ------------------------------------------------------------------
                  /// TAB 3 — REELS (Original Grid View)
                  /// ------------------------------------------------------------------
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 24,
                      ),
                      child: GridView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: reelimages.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 0.5,
                        ),
                        itemBuilder: (context, index) {
                          return ReelcardWidget(
                            assetImagePath: reelimages[index],
                            title: reelTitles[index],
                            reelCardHeight: 358,
                            reelCardWidth: 195,
                            fontSizeVariant: PoppinsFontSizeVariant.size14,
                            showSaveIcon: true,
                          );
                        },
                      ),
                    ),
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
