// ignore_for_file: deprecated_member_use

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
        'subtitle':
            'Meet the Drapers returns to SHACK15 for an electrifying TikTok Global episode, spotlighting visionary startups from across the world. Judges Nikki Farb, TikTok executive Tim Natividad, and legendary investor Bill Draper evaluate groundbreaking innovations in connectivity, accessibility, and education. From CleverFi’s seamless WiFi to Zeality’s immersive AR/VR tech, WeWALK’s smart cane, and Taleemabad’s educational revolution, this episode is a thrilling showcase of entrepreneurial brilliance',
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
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 5, bottom: 20),
              child: TabBar(
                labelPadding: EdgeInsets.only(left: 15),
                indicatorPadding: EdgeInsetsGeometry.all(0),
                padding: EdgeInsets.all(0),
                controller: _tabController,
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                dividerHeight: 0,
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
                tabs: List.generate(3, (index) {
                  String text = index == 0
                      ? "All"
                      : index == 1
                      ? "Videos"
                      : "Reels";

                  // Change width if selected
                  double width = _tabController.index == index
                      ? index == 0
                            ? 80
                            : 100
                      : index == 0
                      ? 80
                      : 100;

                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    height: 40,
                    width: width,
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    margin: EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      border: _tabController.index == index
                          ? Border.all(color: Colors.transparent, width: 0.5)
                          : Border.all(
                              color: customColors.labelColor,
                              width: 0.5,
                            ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    alignment: Alignment.center,
                    child: Tab(text: text),
                  );
                }),
              ),
            ),

            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
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
                                context.pushNamed(AppRoutes.reelWidget.name);
                              },
                              title: "View More",
                              borderColor: customColors.textColor,
                              borderWidth: 0.3,
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
                          padding: const EdgeInsets.symmetric(horizontal: 20),
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
                        padding: const EdgeInsets.symmetric(horizontal: 20),
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
                              borderColor: customColors.textColor.withOpacity(
                                0.5,
                              ),
                              borderWidth: 1,
                              fontSize: PoppinsFontSizeVariant.size12,
                              fontWeight: PoppinsFontWeightVariant.regular,
                              border: true,
                              onPressed: () {
                                context.pushNamed(AppRoutes.reelWidget.name);
                              },
                              title: "View More",
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
                            horizontal: 20,
                            vertical: 8,
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
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
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: GridView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: reelimages.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 195 / 350, 
                      ),
                      itemBuilder: (context, index) {
                        return ReelcardWidget(
                          assetImagePath: reelimages[index],
                          title: reelTitles[index],
                          reelCardHeight: 350, 
                          reelCardWidth: 195,
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
