// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/extensions/theme_extension.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';
import '../../../shared/widgets/cardwidget/card_widget.dart';
import '../../../shared/widgets/genreboxwidget.dart';
import '../../../shared/widgets/historyitemTile.dart';

class Searchscreen extends StatefulWidget {
  const Searchscreen({super.key});

  @override
  State<Searchscreen> createState() => _SearchscreenState();
}

class HistoryData {
  final String title;
  final String thumbnailPath;

  HistoryData(this.title, this.thumbnailPath);
}

final List<HistoryData> dummyHistory = [
  HistoryData(
    'Semifinals 1 – Meet The Drapers Season...',
    Assets.images.trendingimage1.path,
  ),
  HistoryData(
    'Rio de Janeiro – Meet the Drapers Season...',
    Assets.images.trendingimage2.path,
  ),
  HistoryData(
    'Paris – Meet The Drapers Season 6 (2...',
    Assets.images.trendingimage3.path,
  ),
];

class _SearchscreenState extends State<Searchscreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;

    List<String> genretitle = [
      'All',
      'Live pitches',
      'Success Store',
      'Podcasts',
      'Shows',
      'Reels',
    ];
    final Map<String, String> genreRoutes = {
      'All': '/LivepitchesScreen',
      'Live pitches': '/LivepitchesScreen',
      'Success Store': '/LivepitchesScreen',
      'Podcasts': '/LivepitchesScreen',
      'Shows': '/LivepitchesScreen',
      'Reels': '/LivepitchesScreen',
    };

    List trendingimages = [
      Assets.images.trendingimage1.path,
      Assets.images.trendingimage2.path,
      Assets.images.trendingimage3.path,
      Assets.images.trendingimage4.path,
      Assets.images.trendingimage5.path,
      Assets.images.trendingimage6.path,
      Assets.images.trendingimage7.path,
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
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              automaticallyImplyLeading: false,
              leading: GestureDetector(
                behavior: HitTestBehavior.opaque,

                onTap: () {
                  context.pop();
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Image.asset(
                    Assets.images.backicon.path,
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
              title: Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.color202020.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 15),
                      Image.asset(
                        "assets/images/searchicon3x.png",
                        width: 20,
                        height: 20,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          onTap: () {
                            context.pushNamed(AppRoutes.searchView.name);
                          },
                          readOnly: true,
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
                          style: TextStyle(color: Colors.white, fontSize: 16),
                          cursorColor: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              centerTitle: false,
              titleSpacing: 0,
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      const SizedBox(height: 20),

                      SizedBox(
                        height: 185,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: dummyHistory.length,
                          itemBuilder: (context, index) {
                            final item = dummyHistory[index];
                            return HistoryItemTile(
                              title: item.title,
                              thumbnailPath: item.thumbnailPath,
                              onTapRemove: () {},
                              onTapTile: () {},
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 30),

                      PoppinsText(
                        'Genre',
                        fontSize: PoppinsFontSizeVariant.size16,
                        fontWeight: PoppinsFontWeightVariant.medium,
                        color: customColors.textColor,
                      ),
                      const SizedBox(height: 20),

                      SizedBox(
                        height: 56,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 15),
                          itemCount: genretitle.length,
                          itemBuilder: (context, index) {
                            final title = genretitle[index];

                            return GenreBoxWidget(
                              title: title,
                              showBorder: index == 0,
                              onTap: () {
                                final route = genreRoutes[title];
                                if (route != null) {
                                  context.push(route);
                                }
                              },
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 30),

                      PoppinsText(
                        'Trending',
                        fontSize: PoppinsFontSizeVariant.size16,
                        fontWeight: PoppinsFontWeightVariant.medium,
                        color: customColors.textColor,
                      ),

                      const SizedBox(height: 20),

                      GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
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
                          return CardWidget(
                            assetImage: trendingimages[index],
                            showSaveIcon: false,
                          );
                        },
                      ),

                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
