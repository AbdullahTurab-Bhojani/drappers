import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/extensions/theme_extension.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';
import '../../../shared/widgets/app_bar/main_app_bar.dart';
import '../../../shared/widgets/cardwidget/card_widget.dart';
import '../../../shared/widgets/reelcard/reelcard_widget.dart';

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

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
                    context.pushNamed(AppRoutes.Searchscreen.name);
                  },
                  child: Image.asset(
                    Assets.images.searchicon.path,
                    color: customColors.textColor,
                  ),
                ),
                SizedBox(width: 20,),
              ],
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.transparent)),
                ),
                child: TabBar(
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(
                      width: 4,
                      color: customColors.textColor,
                    ),
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  controller: _tabController,
                  indicatorColor: customColors.textColor,
                  labelColor: customColors.textColor,
                  unselectedLabelColor: customColors.labelColor,
                  labelStyle: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  tabs: const [
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
                    SizedBox(
                      height: 182,
                      child: GridView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: trendingimages.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              childAspectRatio: 0.6,
                            ),
                        itemBuilder: (context, index) {
                          return CardWidget(
                            assetImage: trendingimages[index],
                            showSaveIcon: false,
                          );
                        },
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
