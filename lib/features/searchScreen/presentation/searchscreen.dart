import 'package:flutter/material.dart';
import '../../../core/extensions/theme_extension.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';
import '../../../shared/widgets/app_bar/main_app_bar.dart';
import '../../../shared/widgets/cardwidget/card_widget.dart';
import '../../../shared/widgets/genreboxwidget.dart';
import '../../../shared/widgets/historyitemTile.dart';
import '../../../shared/widgets/reelcard/reelcard_widget.dart';

class Searchscreen extends StatefulWidget {
  const Searchscreen({super.key});

  @override
  State<Searchscreen> createState() => _SearchscreenlState();
}

class HistoryData {
  final String title;
  final String thumbnailPath;

  HistoryData(this.title, this.thumbnailPath);
}

final List<HistoryData> dummyHistory = [
  HistoryData(
    'Semifinals 1 – Meet The Drapers Season...',
    Assets.images.trendingshowimage1.path,
  ),
  HistoryData(
    'Rio de Janeiro – Meet the Drapers Season...',
    Assets.images.trendingshowimage2.path,
  ),
  HistoryData(
    'Paris – Meet The Drapers Season 6 (2...',
    Assets.images.trendingshowimage3.path,
  ),
];

class _SearchscreenlState extends State<Searchscreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;

    List<String> Genretitle = [
      'Shows',
      'Documentaries',
      'Podcasts',
      'Shows',
      'Reels',
    ];
    List trendingimages = [
      Assets.images.trendingshowimage1.path,
      Assets.images.trendingshowimage2.path,
      Assets.images.trendingshowimage3.path,
      Assets.images.trendingshowimage4.path,
      Assets.images.trendingshowimage5.path,
      Assets.images.trendingshowimage6.path,
      Assets.images.trendingshowimage7.path,
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
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  automaticallyImplyLeading: false,
                  leading: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Image.asset(
                        "assets/images/backicon.png",
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ),

                  title: Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.color202020.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 15),
                          Image.asset(
                            "assets/images/searchicon3x.png",
                            width: 20,
                            height: 20,
                          ),
                          const SizedBox(width: 10),
                          const Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Search content",
                                hintStyle: TextStyle(
                                  color: AppColors.shadegreycolor6B6B6B,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                              ),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                              cursorColor: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  titleSpacing: 0,
                  centerTitle: false,
                  actions: const [],
                  scrolledUnderElevation: 0,
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 24),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PoppinsText(
                            'Recent Searches ',
                            fontSize: PoppinsFontSizeVariant.size16,
                            fontWeight: PoppinsFontWeightVariant.medium,
                            color: customColors.textColor,
                          ),
                          PoppinsText(
                            'Clear All ',
                            fontSize: PoppinsFontSizeVariant.size12,
                            fontWeight: PoppinsFontWeightVariant.regular,
                            color: customColors.textColor,
                            decoration: TextDecoration.underline,
                          ),
                        ],
                      ),

                      SizedBox(height: 20),
                      SizedBox(
                        height: 185,
                        child: Expanded(
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: dummyHistory.length,
                            itemBuilder: (context, index) {
                              final item = dummyHistory[index];
                              return HistoryItemTile(
                                title: item.title,
                                thumbnailPath: item.thumbnailPath,
                                onTapRemove: () {
                                  print('Removed: ${item.title}');
                                },
                                onTapTile: () {
                                  print('Tapped: ${item.title}');
                                },
                              );
                            },
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PoppinsText(
                            'Genre',
                            fontSize: PoppinsFontSizeVariant.size16,
                            fontWeight: PoppinsFontWeightVariant.medium,
                            color: customColors.textColor,
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        height: 56,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 15),
                          itemCount: Genretitle.length,
                          itemBuilder: (context, index) {
                            return genreBoxWidget(title: Genretitle[index]);
                          },
                        ),
                      ),

                      SizedBox(height: 30),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PoppinsText(
                            'Trending ',
                            fontSize: PoppinsFontSizeVariant.size16,
                            fontWeight: PoppinsFontWeightVariant.medium,
                            color: customColors.textColor,
                          ),
                        ],
                      ),

                      SizedBox(height: 20),

                      GridView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: trendingimages.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 15,
                              crossAxisSpacing: 15,
                              childAspectRatio: 0.6,
                            ),
                        itemBuilder: (context, index) {
                          return CardWidget(assetImage: trendingimages[index]);
                        },
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
