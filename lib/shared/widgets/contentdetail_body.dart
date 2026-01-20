import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/extensions/theme_extension.dart';
import '../../core/theme/app_scalar.dart';
import '../../drappers.dart';
import '../../gen/assets.gen.dart';
import 'cardwidget/card_widget.dart';
import 'reelcard/reelcard_widget.dart';
import 'trending_grid.dart';

class ContentDetailBody extends StatefulWidget {
  final TabController tabController;
  final bool isAdded;
  final Function(bool) onAddToWatchlist;
  final bool isLiked;
  final Function(bool) onLike;

  const ContentDetailBody({
    super.key,
    required this.tabController,
    required this.isAdded,
    required this.onAddToWatchlist,
    required this.isLiked,
    required this.onLike,
  });

  @override
  State<ContentDetailBody> createState() => _ContentDetailBodyState();
}

class _ContentDetailBodyState extends State<ContentDetailBody> {
  String selectedSeason = "Season 01";

  List<String> trendingimages = [
    Assets.images.trendingimage1.path,
    Assets.images.trendingimage2.path,
    Assets.images.trendingimage3.path,
    Assets.images.trendingimage4.path,
    Assets.images.trendingimage5.path,
    Assets.images.trendingimage6.path,
    Assets.images.trendingimage7.path,
  ];

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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: AppScaler.scaleSize(context, 12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PoppinsText(
            context,
            '"The Wolf of Wall Street" is a captivating film about Jordan Belfort\'s rise and fall.',
            fontSize: PoppinsFontSizeVariant.size16,
            fontWeight: PoppinsFontWeightVariant.regular,
            color: customColors.textColor,
          ),
          SizedBox(height: AppScaler.scaleHeight(context, 5)),
          PoppinsText(
            context,
            'Cast: Leonardo DiCaprio, Jonah Hill, Margot Robbie, Matthew.... more Director: Denis Villeneuve',
            fontSize: PoppinsFontSizeVariant.size12,
            fontWeight: PoppinsFontWeightVariant.regular,
            color: customColors.greyColor,
          ),
          SizedBox(height: AppScaler.scaleHeight(context, 15)),

          Padding(
            padding: EdgeInsets.only(left: AppScaler.scaleSize(context, 12)),
            child: Row(
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () => widget.onLike(!widget.isLiked),
                      child: Image.asset(
                        widget.isLiked
                            ? Assets.images.like.path
                            : Assets.images.likeicon.path,
                        width: AppScaler.scaleSize(context, 18),
                        height: AppScaler.scaleHeight(context, 18),
                        color: widget.isLiked
                            ? customColors.buttonColors[0]
                            : null,
                      ),
                    ),
                    SizedBox(height: AppScaler.scaleHeight(context, 10)),
                    PoppinsText(
                      context,
                      'Like',
                      fontSize: PoppinsFontSizeVariant.size12,
                      fontWeight: PoppinsFontWeightVariant.regular,
                      color: customColors.textColor,
                    ),
                  ],
                ),
                SizedBox(width: AppScaler.scaleSize(context, 30)),
                Column(
                  children: [
                    Image.asset(
                      Assets.images.shareiconnew.path,
                      width: AppScaler.scaleSize(context, 18),
                      height: AppScaler.scaleHeight(context, 18),
                    ),
                    SizedBox(height: AppScaler.scaleHeight(context, 10)),
                    PoppinsText(
                      context,
                      'Share',
                      fontSize: PoppinsFontSizeVariant.size12,
                      fontWeight: PoppinsFontWeightVariant.regular,
                      color: customColors.textColor,
                    ),
                  ],
                ),
                SizedBox(width: AppScaler.scaleSize(context, 30)),
                Column(
                  children: [
                    Image.asset(
                      Assets.images.flagicon.path,
                      width: AppScaler.scaleSize(context, 18),
                      height: AppScaler.scaleHeight(context, 18),
                    ),
                    SizedBox(height: 10),
                    PoppinsText(
                      context,
                      'Report',
                      fontSize: PoppinsFontSizeVariant.size12,
                      fontWeight: PoppinsFontWeightVariant.regular,
                      color: customColors.textColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: AppScaler.scaleHeight(context, 7)),

          TabBar(
            controller: widget.tabController,
            tabs: [
              Tab(text: "Episodes"),
              Tab(text: "More Like This"),
            ],
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                width: AppScaler.scaleSize(context, 4),
                color: customColors.textColor,
              ),
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: customColors.textColor,
            unselectedLabelColor: customColors.labelColor,
            labelStyle: GoogleFonts.poppins(
              fontSize: AppScaler.scaleFont(context, 16),
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: AppScaler.scaleHeight(context, 20)),

          Builder(
            builder: (context) {
              return widget.tabController.index == 0
                  ? _episodesGrid(customColors)
                  : _reelsGrid();
            },
          ),
          SizedBox(height: AppScaler.scaleHeight(context, 14)),
        ],
      ),
    );
  }

  Widget _episodesGrid(AppCustomColors customColors) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppScaler.scaleSize(context, 4),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppScaler.scaleSize(context, 10),
                ),
                height: AppScaler.scaleHeight(context, 30),
                decoration: BoxDecoration(
                  color: customColors.containergrey,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    itemHeight: 50,
                    menuMaxHeight: 150,
                    value: selectedSeason,
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      size: 20,
                      color: customColors.textColor,
                    ),
                    items:
                        [
                              "Season 01",
                              "Season 02",
                              "Season 03",
                              "Season 04",
                              "Season 05",
                            ]
                            .map(
                              (season) => DropdownMenuItem(
                                value: season,
                                child: PoppinsText(
                                  context,
                                  season,
                                  color: customColors.textColor,
                                  fontSize: PoppinsFontSizeVariant.size12,
                                ),
                              ),
                            )
                            .toList(),
                    onChanged: (value) =>
                        setState(() => selectedSeason = value!),
                  ),
                ),
              ),
              Image.asset(
                Assets.images.infoicon.path,
                height: AppScaler.scaleHeight(context, 18),
                width: AppScaler.scaleSize(context, 18),
              ),
            ],
          ),
        ),
        SizedBox(height: AppScaler.scaleHeight(context, 20)),
        TrendingGrid(title: "", images: trendingimages),
      ],
    );
  }

  Widget _reelsGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: reelimages.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio:
            ((MediaQuery.of(context).size.width / 3) - 20) /
            (((MediaQuery.of(context).size.width / 3) - 20) * (358 / 195)),
      ),
      itemBuilder: (context, index) {
        double cardWidth = (MediaQuery.of(context).size.width / 3) - 10;
        double cardHeight = cardWidth * 358 / 195;

        return ReelcardWidget(
          assetImagePath: reelimages[index],
          title: reelTitles[index],
          reelCardHeight: cardHeight,
          reelCardWidth: cardWidth,
          fontSizeVariant: PoppinsFontSizeVariant.size14,
          showSaveIcon: false,
        );
      },
    );
  }
}
