// ignore_for_file: camel_case_types, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/extensions/theme_extension.dart';
import '../../core/theme/app_scalar.dart';
import '../../drappers.dart';
import '../../gen/assets.gen.dart';
import 'app_bar/main_app_bar.dart';
import 'continue_watching_viewmore.dart';
import 'historywatchitemtile.dart';
import 'reelcard/reelcard_widget.dart';

class WatchHistoryViewmore extends StatefulWidget {
  const WatchHistoryViewmore({super.key});

  @override
  State<WatchHistoryViewmore> createState() => _WatchHistoryViewmoreState();
}

class _WatchHistoryViewmoreState extends State<WatchHistoryViewmore>
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
        'image':
            'https://source.boomplaymusic.com/buzzgroup2/M00/2E/F3/rBEe_GHV1vCACRvaAAJjfsEidFI769.png',
        'title': 'Finale – Meet The Drapers Season 07 (2025)',
        'subtitle': 'EP.5 - YAT SIU',
        'remaining': '-12:34',
        'showSave': true,
        'progress': 75.0,
      },
      {
        'image':
            'https://i0.wp.com/maactioncinema.com/wp-content/uploads/2024/01/MV5BOGU2NDNmY2UtZTJmZS00M2U4LTkyMGQtNjc5MmNiZTQ4YjA0XkEyXkFqcGdeQXVyNTk1ODQ5NDg%40._V1_-scaled.jpg?ssl=1',
        'title': 'Episode 2 – Startup Stories',
        'subtitle': 'Dive into inspiring stories of new entrepreneurs...',
        'remaining': '-12:34',
        'showSave': false,
        'progress': 40.0,
      },
      {
        'image':
            'https://resizing.flixster.com/kmvpUXbW_IqKOXauZ76IceSquTA=/fit-in/180x240/v2/https://resizing.flixster.com/2bkyVmLlw_8s0SzA8C1gaYNdoZY=/ems.cHJkLWVtcy1hc3NldHMvbW92aWVzLzJlNTkwNTIxLTM0YmYtNDgzNi1hZGFlLThjODM2ZTA5OTEzMi5qcGc=',
        'title': 'Episode 3 – Tech Innovation',
        'subtitle': 'Latest updates on tech, AI, and innovative startups.',
        'remaining': '-12:34',
        'showSave': true,
        'progress': 60.0,
      },
    ];
    final Map<String, dynamic> podcastData = {
      'podcast': Podcast(
        imagePath:  'https://resizing.flixster.com/kmvpUXbW_IqKOXauZ76IceSquTA=/fit-in/180x240/v2/https://resizing.flixster.com/2bkyVmLlw_8s0SzA8C1gaYNdoZY=/ems.cHJkLWVtcy1hc3NldHMvbW92aWVzLzJlNTkwNTIxLTM0YmYtNDgzNi1hZGFlLThjODM2ZTA5OTEzMi5qcGc=',
        title: 'Podcast Title Placeholder',
        description: 'This is a description placeholder for the podcast item.',
      ),
      'slider': 75.0,
    };

    void onSliderChange(double v, int index) {}

    void onContinue(int index) {}

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
                child: Image.asset(
                  "assets/images/backicon.png",
                  width: AppScaler.scaleSize(context, 20),
                  height: AppScaler.scaleHeight(context, 20),
                ),
              ),
              title: "Watch History",
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
            SizedBox(height: AppScaler.scaleHeight(context, 20)),

            Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppScaler.scaleSize(context, 10),
              ),
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
                  fontSize: AppScaler.scaleFont(context, 14),
                  fontWeight: FontWeight.w500,
                ),
                labelPadding: EdgeInsets.symmetric(
                  horizontal: AppScaler.scaleSize(context, 7),
                ),

                tabs: [
                  Container(
                    height: AppScaler.scaleHeight(context, 40),
                    padding: EdgeInsets.symmetric(
                      horizontal: AppScaler.scaleSize(context, 20),
                    ),
                    decoration: BoxDecoration(
                      border: _tabController.index == 0
                          ? null
                          : Border.all(
                              color: customColors.labelColor,
                              width: 0.5,
                            ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Tab(text: "All"),
                  ),
                  Container(
                    height: AppScaler.scaleHeight(context, 40),
                    padding: EdgeInsets.symmetric(
                      horizontal: AppScaler.scaleSize(context, 20),
                    ),
                    decoration: BoxDecoration(
                      border: _tabController.index == 1
                          ? null
                          : Border.all(
                              color: customColors.labelColor,
                              width: 0.5,
                            ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Tab(text: "Videos"),
                  ),
                  Container(
                    height: AppScaler.scaleHeight(context, 40),
                    padding: EdgeInsets.symmetric(
                      horizontal: AppScaler.scaleSize(context, 20),
                    ),
                    decoration: BoxDecoration(
                      border: _tabController.index == 2
                          ? null
                          : Border.all(
                              color: customColors.labelColor,
                              width: 0.5,
                            ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Tab(text: "Reels"),
                  ),
                ],
              ),
            ),

            SizedBox(height: AppScaler.scaleHeight(context, 10)),

            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                          AppScaler.scaleSize(context, 15),
                          AppScaler.scaleHeight(context, 15),
                          AppScaler.scaleSize(context, 15),
                          0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            PoppinsText(
                              context,
                              'Reels',
                              fontSize: PoppinsFontSizeVariant.size18,
                              fontWeight: PoppinsFontWeightVariant.semiBold,
                              color: customColors.textColor,
                            ),
                            AppButton(
                              buttonSize: Size(80, 25),
                              color: Colors.transparent,
                              borderColor: customColors.textColor.withOpacity(
                                0.5,
                              ),
                              borderWidth: 1,
                              fontSize: PoppinsFontSizeVariant.size12,
                              fontWeight: PoppinsFontWeightVariant.regular,
                              border: true,
                              onPressed: () {
                                context.pushNamed(AppRoutes.trendingshow.name);
                              },
                              title: "View More",
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: AppScaler.scaleHeight(context, 16)),

                      SizedBox(
                        height: AppScaler.scaleHeight(context, 250),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppScaler.scaleSize(context, 15),
                          ),
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: reelimages.length,
                            separatorBuilder: (context, index) => SizedBox(
                              width: AppScaler.scaleSize(context, 10),
                            ),
                            itemBuilder: (context, index) {
                              return ReelcardWidget(
                                assetImagePath: reelimages[index],
                                title: reelTitles[index],
                                reelCardHeight: AppScaler.scaleHeight(
                                  context,
                                  273,
                                ),
                                reelCardWidth: AppScaler.scaleSize(
                                  context,
                                  149,
                                ),
                                fontSizeVariant: PoppinsFontSizeVariant.size14,
                                showSaveIcon: true,
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: AppScaler.scaleHeight(context, 30)),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppScaler.scaleSize(context, 15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            PoppinsText(
                              context,
                              'Videos',
                              fontSize: PoppinsFontSizeVariant.size18,
                              fontWeight: PoppinsFontWeightVariant.semiBold,
                              color: customColors.textColor,
                            ),
                            AppButton(
                              buttonSize: Size(80, 25),
                              color: Colors.transparent,
                              borderColor: customColors.textColor.withOpacity(
                                0.5,
                              ),
                              borderWidth: 1,
                              fontSize: PoppinsFontSizeVariant.size12,
                              fontWeight: PoppinsFontWeightVariant.regular,
                              border: true,
                              onPressed: () {
                                context.pushNamed(AppRoutes.trendingshow.name);
                              },
                              title: "View More",
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: AppScaler.scaleHeight(context, 16)),

                      ...historyItems.asMap().entries.map((entry) {
                        final index = entry.key;
                        final item = entry.value;
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppScaler.scaleSize(context, 15),
                            vertical: AppScaler.scaleHeight(context, 8),
                          ),
                          child: VideosBoxWidget(
                            context: context,
                            podcast: Podcast(
                              imagePath:
                                  item['image'].toString().contains(
                                    'Assets.images',
                                  )
                                  ? Assets.images.podcastimage1.path
                                  : item['image'] as String,
                              title: item['title'] as String,
                              description: item['subtitle'] as String,
                            ),
                            sliderValue: item['progress'] as double,
                            index: index,
                            onSliderChanged: onSliderChange,
                            onContinuePressed: () => onContinue(index),
                          ),
                        );
                      }),
                    ],
                  ),

                  ListView.builder(
                    padding: EdgeInsets.all(16.0),
                    itemCount: historyItems.length,
                    itemBuilder: (context, index) {
                      return VideosBoxWidget(
                        context: context,
                        podcast: podcastData['podcast'],
                        sliderValue: podcastData['slider'],
                        index: index,
                        onSliderChanged: onSliderChange,
                        onContinuePressed: () => onContinue(index),
                      );
                    },
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppScaler.scaleSize(context, 15),
                      vertical: AppScaler.scaleHeight(context, 24),
                    ),
                    child: GridView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: reelimages.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: AppScaler.scaleHeight(context, 10),
                        crossAxisSpacing: AppScaler.scaleSize(context, 10),
                        childAspectRatio: 0.5,
                      ),
                      itemBuilder: (context, index) {
                        return ReelcardWidget(
                          assetImagePath: reelimages[index],
                          title: reelTitles[index],
                          reelCardHeight: AppScaler.scaleHeight(context, 358),
                          reelCardWidth: AppScaler.scaleSize(context, 195),
                          fontSizeVariant: PoppinsFontSizeVariant.size14,
                          showSaveIcon: true,
                        );
                      },
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
