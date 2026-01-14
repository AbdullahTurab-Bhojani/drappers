// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/extensions/theme_extension.dart';
import '../../../core/theme/app_scalar.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';
import '../../../shared/widgets/cardwidget/card_widget.dart';
import '../../../shared/widgets/genreboxwidget.dart';
import '../../../shared/widgets/recentsearch_widget_header.dart';

class Searchscreen extends StatefulWidget {
  const Searchscreen({super.key});

  @override
  State<Searchscreen> createState() => _SearchscreenState();
}

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

    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        image: DecorationImage(
          image: AssetImage(Assets.images.screensbg.path),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
          leading: GestureDetector(
            behavior: HitTestBehavior.opaque,

            onTap: () {
              context.pop();
            },
            child: Padding(
              padding: EdgeInsets.only(left: AppScaler.scaleSize(context, 10)),
              child: Image.asset(
                Assets.images.backicon.path,
                width: AppScaler.scaleSize(context, 20),
                height: AppScaler.scaleHeight(context, 20),
              ),
            ),
          ),
          title: Padding(
            padding: EdgeInsets.only(right: AppScaler.scaleSize(context, 15)),
            child: Container(
              height: AppScaler.scaleHeight(context, 40),
              decoration: BoxDecoration(
                color: AppColors.color202020.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  SizedBox(width: AppScaler.scaleSize(context, 15)),
                  Image.asset(
                    "assets/images/searchicon3x.png",
                    width: AppScaler.scaleSize(context, 20),
                    height: AppScaler.scaleHeight(context, 20),
                  ),
                  SizedBox(width: AppScaler.scaleSize(context, 10)),
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
                      style: TextStyle(color: AppColors.white, fontSize: 16),
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
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppScaler.scaleSize(context, 20),
              vertical: AppScaler.scaleHeight(context, 24),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RecentsearchWidgetHeader(),

                SizedBox(height: AppScaler.scaleHeight(context, 10)),

                PoppinsText(
                  context,
                  'Genre',
                  fontSize: PoppinsFontSizeVariant.size16,
                  fontWeight: PoppinsFontWeightVariant.medium,
                  color: customColors.textColor,
                ),
                SizedBox(height: AppScaler.scaleHeight(context, 20)),

                SizedBox(
                  height: AppScaler.scaleHeight(context, 56),
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) =>
                        SizedBox(width: AppScaler.scaleSize(context, 15)),
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

                SizedBox(height: AppScaler.scaleHeight(context, 30)),

                PoppinsText(
                  context,
                  'Trending',
                  fontSize: PoppinsFontSizeVariant.size16,
                  fontWeight: PoppinsFontWeightVariant.medium,
                  color: customColors.textColor,
                ),

                SizedBox(height: AppScaler.scaleHeight(context, 20)),

                LayoutBuilder(
                  builder: (context, constraints) {
                    final double itemWidth =
                        (constraints.maxWidth - (15 * 2)) / 3;
                    final double itemHeight = itemWidth / 0.6;

                    return GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: trendingimages.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                        childAspectRatio: itemWidth / itemHeight,
                      ),
                      itemBuilder: (context, index) {
                        return CardWidget(
                          assetImage: trendingimages[index],
                          showSaveIcon: false,
                          fromEpisode: false,
                          allowGuestNavigation: false,
                          index: index,
                          showMenuOnly: true,
                          showLiveTvBadge: false,
                        );
                      },
                    );
                  },
                ),

                SizedBox(height: AppScaler.scaleHeight(context, 10)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
