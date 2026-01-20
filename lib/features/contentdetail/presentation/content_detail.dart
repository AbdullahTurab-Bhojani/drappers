import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/extensions/theme_extension.dart';
import '../../../core/theme/app_scalar.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';
import '../../../shared/widgets/contentdetail_body.dart';
import '../../../shared/widgets/guestloginwidget.dart';

class ContentDetail extends StatefulWidget {
  const ContentDetail({super.key});

  @override
  State<ContentDetail> createState() => _ContentDetailState();
}

class _ContentDetailState extends State<ContentDetail>
    with SingleTickerProviderStateMixin {
  bool _isLiked = false;

  late TabController _tabController;
  bool isAdded = false;
  String selectedSeason = "Season 01";

  List trendingimages = [
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
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;

<<<<<<< HEAD
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(Assets.images.screensbg.path, fit: BoxFit.cover),
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: AppScaler.scaleHeight(context, 54),
                  left: AppScaler.scaleSize(context, 12),
                  right: AppScaler.scaleSize(context, 12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: AppScaler.scaleHeight(context, 258),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: AssetImage(Assets.images.preview.path),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,

                            onTap: () {
                              context.pushNamed(AppRoutes.videoScreen.name);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                          Center(
                            child: GestureDetector(
                              behavior: HitTestBehavior.opaque,

                              onTap: () {
                                if (GuestHelper.isGuest) {
                                  GuestHelper.checkGuest(context);
                                  return;
                                }
                                context.pushNamed(AppRoutes.videoScreen.name);
                              },
                              child: Image.asset(
                                Assets.images.playwithbgicon.path,
                                width: AppScaler.scaleSize(context, 60),
                                height: AppScaler.scaleHeight(context, 60),
                              ),
                            ),
                          ),
                          Positioned(
                            top: AppScaler.scaleHeight(context, 12),
                            right: AppScaler.scaleSize(context, 19),
                            child: GestureDetector(
                              behavior: HitTestBehavior.opaque,

                              onTap: () => Navigator.of(context).pop(),
                              child: Image.asset(
                                Assets.images.crossnewicon.path,
                                width: AppScaler.scaleSize(context, 24),
                                height: AppScaler.scaleHeight(context, 24),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: AppScaler.scaleHeight(context, 12),
                            right: AppScaler.scaleSize(context, 19),
                            child: Image.asset(Assets.images.muteicon.path),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: AppScaler.scaleHeight(context, 15)),
                    PoppinsText(
                      context,
                      'Finale – Meet The Drapers Season 07 (2025)',
                      fontSize: PoppinsFontSizeVariant.size22,
                      fontWeight: PoppinsFontWeightVariant.medium,
                      color: customColors.textColor,
                    ),
                    SizedBox(height: AppScaler.scaleHeight(context, 10)),
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.poppins(),
                        children: [
                          TextSpan(
                            text: '91% match',
                            style: GoogleFonts.poppins(
                              fontSize: AppScaler.scaleFont(context, 16),
                              fontWeight: FontWeight.w400,
                              color: customColors.greyColor,
                            ),
                          ),
                          WidgetSpan(
                            child: SizedBox(
                              width: AppScaler.scaleSize(context, 8),
                            ),
                          ),
                          TextSpan(
                            text: '2017',
                            style: GoogleFonts.poppins(
                              fontSize: AppScaler.scaleFont(context, 16),
                              fontWeight: FontWeight.w400,
                              color: customColors.textColor,
                            ),
                          ),
                          WidgetSpan(
                            child: SizedBox(
                              width: AppScaler.scaleSize(context, 8),
                            ),
                          ),
                          WidgetSpan(
                            child: Container(
                              width: AppScaler.scaleSize(context, 22),
                              height: AppScaler.scaleHeight(context, 15),
                              decoration: BoxDecoration(
                                color: AppColors.shadegreycolor6B6B6B,
                                borderRadius: BorderRadius.circular(2),
                              ),
                              alignment: Alignment.center,
                              child: PoppinsText(
                                context,
                                '16+',
                                fontSize: PoppinsFontSizeVariant.size8,
                                fontWeight: PoppinsFontWeightVariant.semiBold,
                                color: customColors.textColor,
                              ),
                            ),
                          ),
                          WidgetSpan(
                            child: SizedBox(
                              width: AppScaler.scaleSize(context, 8),
                            ),
                          ),
                          TextSpan(
                            text: '2h 43m',
                            style: GoogleFonts.poppins(
                              fontSize: AppScaler.scaleFont(context, 16),
                              fontWeight: FontWeight.w400,
                              color: customColors.textColor,
                            ),
                          ),
                          WidgetSpan(
                            child: SizedBox(
                              width: AppScaler.scaleSize(context, 8),
                            ),
                          ),
                          WidgetSpan(
                            child: Container(
                              width: AppScaler.scaleSize(context, 22),
                              height: AppScaler.scaleHeight(context, 15),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.shadegreycolor6B6B6B,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              alignment: Alignment.center,
                              child: PoppinsText(
                                context,
                                'HQ',
                                fontSize: PoppinsFontSizeVariant.size8,
                                fontWeight: PoppinsFontWeightVariant.semiBold,
                                color: customColors.textColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: AppScaler.scaleHeight(context, 10)),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: AppScaler.scaleHeight(context, 45),
                            child: AppButton(
                              onPressed: () {
                                context.pushNamed(AppRoutes.videoScreen.name);
                              },
                              title: 'Play',
                              prefixIcon: Image.asset(
                                Assets.images.playstrokeicon.path,
                                width: AppScaler.scaleSize(context, 15),
                                height: AppScaler.scaleHeight(context, 15),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: AppScaler.scaleSize(context, 10)),
                        Expanded(
                          child: SizedBox(
                            height: AppScaler.scaleHeight(context, 45),
                            child: AppButton(
                              onPressed: () {
                                if (GuestHelper.isGuest) {
                                  GuestHelper.checkGuest(context);
                                  return;
                                }
                                setState(() {
                                  isAdded = !isAdded;
                                });
                              },
                              title: isAdded ? 'Added' : 'Add To Watch List',
                              color: Colors.transparent,
                              borderColor: customColors.greyColor,
                              borderWidth: 1,
                              border: true,
                              prefixIcon: isAdded
                                  ? Icon(
                                      Icons.check,
                                      size: 17,
                                      color: customColors.textColor,
                                    )
                                  : Image.asset(
                                      Assets.images.addicon.path,
                                      width: AppScaler.scaleSize(context, 15),
                                      height: AppScaler.scaleHeight(
                                        context,
                                        15,
                                      ),
                                    ),
                              fontSize: PoppinsFontSizeVariant.size14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppScaler.scaleHeight(context, 15)),
                  ],
                ),
=======
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
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                top: AppScaler.scaleHeight(context, 54),
                left: AppScaler.scaleSize(context, 12),
                right: AppScaler.scaleSize(context, 12),
>>>>>>> development
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: .end,
                    children: [
                      Container(
                        height: AppScaler.scaleHeight(context, 258),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                            image: AssetImage(Assets.images.preview.path),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Stack(
                          children: [
                            // Dark overlay + GestureDetector for tapping anywhere
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                context.pushNamed(AppRoutes.videoScreen.name);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                            ),

                            // Cross (close) button top-right
                            Positioned(
                              top: AppScaler.scaleHeight(context, 12),
                              right: AppScaler.scaleSize(context, 19),
                              child: GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () => Navigator.of(context).pop(),
                                child: Image.asset(
                                  Assets.images.crossnewicon.path,
                                  width: AppScaler.scaleSize(context, 24),
                                  height: AppScaler.scaleHeight(context, 24),
                                ),
<<<<<<< HEAD
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
                            GestureDetector(
                              onTap: () {
                                if (GuestHelper.isGuest) {
                                  GuestHelper.checkGuest(context);
                                  return;
                                }
                              },
                              child: Column(
                                children: [
                                  Image.asset(
                                    Assets.images.shareiconnew.path,
                                    width: AppScaler.scaleSize(context, 18),
                                    height: AppScaler.scaleHeight(context, 18),
                                  ),
                                  SizedBox(
                                    height: AppScaler.scaleHeight(context, 10),
                                  ),
                                  PoppinsText(
                                    context,
                                    'Share',
                                    fontSize: PoppinsFontSizeVariant.size12,
                                    fontWeight:
                                        PoppinsFontWeightVariant.regular,
                                    color: customColors.textColor,
                                  ),
                                ],
=======
>>>>>>> development
                              ),
                            ),

                            Center(
                              child: GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () {
                                  if (GuestHelper.isGuest) {
                                    GuestHelper.checkGuest(context);
                                    return;
                                  }
                                  context.pushNamed(AppRoutes.videoScreen.name);
                                },
                                child: Image.asset(
                                  Assets.images.playwithbgicon.path,
                                  width: AppScaler.scaleSize(context, 60),
                                  height: AppScaler.scaleHeight(context, 60),
                                ),
                              ),
                            ),

                            Positioned(
                              bottom: AppScaler.scaleHeight(context, 12),
                              right: AppScaler.scaleSize(context, 19),
                              child: Image.asset(Assets.images.muteicon.path),
                            ),
                          ],
                        ),
                      ),
<<<<<<< HEAD
                      SizedBox(height: AppScaler.scaleHeight(context, 7)),
                      TabBar(
                        controller: _tabController,
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
                          return Column(
                            children: [
                              if (_tabController.index == 0)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: AppScaler.scaleSize(
                                          context,
                                          4,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: AppScaler.scaleSize(
                                                context,
                                                10,
                                              ),
                                            ),
                                            height: AppScaler.scaleHeight(
                                              context,
                                              30,
                                            ),
                                            decoration: BoxDecoration(
                                              color: customColors.containergrey,
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButton<String>(
                                                itemHeight: 50,
                                                menuMaxHeight: 150,
                                                padding: EdgeInsets.all(0),

                                                value: selectedSeason,
                                                isDense: false,

                                                icon: Icon(
                                                  Icons.keyboard_arrow_down,
                                                  color: customColors.textColor,
                                                  size: 20,
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
                                                          (
                                                            season,
                                                          ) => DropdownMenuItem(
                                                            value: season,
                                                            child: PoppinsText(
                                                              context,
                                                              season,
                                                              color: customColors
                                                                  .textColor,
                                                              fontSize:
                                                                  PoppinsFontSizeVariant
                                                                      .size12,
                                                              fontWeight:
                                                                  PoppinsFontWeightVariant
                                                                      .regular,
                                                            ),
                                                          ),
                                                        )
                                                        .toList(),
                                                onChanged: (value) {
                                                  setState(() {
                                                    selectedSeason = value!;
                                                  });
                                                },
                                              ),
                                            ),
                                          ),
                                          Image.asset(
                                            Assets.images.infoicon.path,
                                            height: AppScaler.scaleHeight(
                                              context,
                                              18,
                                            ),
                                            width: AppScaler.scaleSize(
                                              context,
                                              18,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: AppScaler.scaleHeight(
                                        context,
                                        20,
                                      ),
                                    ),

                                    GridView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      padding: EdgeInsets.zero,
                                      itemCount: trendingimages.length,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            mainAxisSpacing: 10,
                                            crossAxisSpacing: 10,
                                            childAspectRatio:
                                                ((MediaQuery.of(
                                                          context,
                                                        ).size.width /
                                                        3) -
                                                    20) /
                                                200,
                                          ),
                                      itemBuilder: (context, index) {
                                        return CardWidget(
                                          assetImage: trendingimages[index],
                                          showSaveIcon: false,
                                          fromEpisode: true,
                                          allowGuestNavigation: true,
                                          index: index,
                                          showMenuOnly: true,
                                          showLiveTvBadge: false,
                                        );
                                      },
                                    ),
                                  ],
                                )
                              else
                                GridView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.zero,
                                  itemCount: reelimages.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        mainAxisSpacing: 10,
                                        crossAxisSpacing: 10,
                                        childAspectRatio:
                                            ((MediaQuery.of(
                                                      context,
                                                    ).size.width /
                                                    3) -
                                                20) /
                                            (((MediaQuery.of(
                                                          context,
                                                        ).size.width /
                                                        3) -
                                                    20) *
                                                (358 / 195)),
                                      ),
                                  itemBuilder: (context, index) {
                                    double cardWidth =
                                        (MediaQuery.of(context).size.width /
                                            3) -
                                        10;
                                    double cardHeight = cardWidth * 358 / 195;

                                    return ReelcardWidget(
                                      assetImagePath: reelimages[index],
                                      title: reelTitles[index],
                                      reelCardHeight: cardHeight,
                                      reelCardWidth: cardWidth,
                                      fontSizeVariant:
                                          PoppinsFontSizeVariant.size14,
                                      showSaveIcon: false,
                                    );
                                  },
                                ),
                            ],
                          );
                        },
                      ),

                      SizedBox(height: AppScaler.scaleHeight(context, 14)),
=======
>>>>>>> development
                    ],
                  ),
                  SizedBox(height: AppScaler.scaleHeight(context, 15)),
                  PoppinsText(
                    context,
                    'Finale – Meet The Drapers Season 07 (2025)',
                    fontSize: PoppinsFontSizeVariant.size22,
                    fontWeight: PoppinsFontWeightVariant.medium,
                    color: customColors.textColor,
                  ),
                  SizedBox(height: AppScaler.scaleHeight(context, 10)),
                  Row(
                    children: [
                      Text(
                        '91% match',
                        style: GoogleFonts.poppins(
                          fontSize: AppScaler.scaleFont(context, 16),
                          fontWeight: FontWeight.w400,
                          color: customColors.greyColor,
                        ),
                      ),
                      SizedBox(width: AppScaler.scaleSize(context, 8)),

                      Text(
                        '2017',
                        style: GoogleFonts.poppins(
                          fontSize: AppScaler.scaleFont(context, 16),
                          fontWeight: FontWeight.w400,
                          color: customColors.textColor,
                        ),
                      ),
                      SizedBox(width: AppScaler.scaleSize(context, 8)),

                      Container(
                        width: AppScaler.scaleSize(context, 22),
                        height: AppScaler.scaleHeight(context, 15),
                        decoration: BoxDecoration(
                          color: AppColors.shadegreycolor6B6B6B,
                          borderRadius: BorderRadius.circular(2),
                        ),
                        alignment: Alignment.center,
                        child: PoppinsText(
                          context,
                          '16+',
                          fontSize: PoppinsFontSizeVariant.size8,
                          fontWeight: PoppinsFontWeightVariant.semiBold,
                          color: customColors.textColor,
                        ),
                      ),
                      SizedBox(width: AppScaler.scaleSize(context, 8)),

                      Text(
                        '2h 43m',
                        style: GoogleFonts.poppins(
                          fontSize: AppScaler.scaleFont(context, 16),
                          fontWeight: FontWeight.w400,
                          color: customColors.textColor,
                        ),
                      ),
                      SizedBox(width: AppScaler.scaleSize(context, 8)),

                      Container(
                        width: AppScaler.scaleSize(context, 22),
                        height: AppScaler.scaleHeight(context, 15),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.shadegreycolor6B6B6B,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        alignment: Alignment.center,
                        child: PoppinsText(
                          context,
                          'HQ',
                          fontSize: PoppinsFontSizeVariant.size8,
                          fontWeight: PoppinsFontWeightVariant.semiBold,
                          color: customColors.textColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppScaler.scaleHeight(context, 10)),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: AppScaler.scaleHeight(context, 45),
                          child: AppButton(
                            onPressed: () {
                              context.pushNamed(AppRoutes.videoScreen.name);
                            },
                            title: 'Play',
                            prefixIcon: Image.asset(
                              Assets.images.playstrokeicon.path,
                              width: AppScaler.scaleSize(context, 15),
                              height: AppScaler.scaleHeight(context, 15),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: AppScaler.scaleSize(context, 10)),
                      Expanded(
                        child: SizedBox(
                          height: AppScaler.scaleHeight(context, 45),
                          child: AppButton(
                            onPressed: () {
                              if (GuestHelper.isGuest) {
                                GuestHelper.checkGuest(context);
                                return;
                              }
                              setState(() {
                                isAdded = !isAdded;
                              });
                            },
                            title: isAdded ? 'Added' : 'Add To Watch List',
                            color: Colors.transparent,
                            borderColor: customColors.greyColor,
                            borderWidth: 1,
                            border: true,
                            prefixIcon: isAdded
                                ? Icon(
                                    Icons.check,
                                    size: 17,
                                    color: customColors.textColor,
                                  )
                                : Image.asset(
                                    Assets.images.addicon.path,
                                    width: AppScaler.scaleSize(context, 15),
                                    height: AppScaler.scaleHeight(context, 15),
                                  ),
                            fontSize: PoppinsFontSizeVariant.size14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppScaler.scaleHeight(context, 15)),
                ],
              ),
            ),
            Expanded(
              child: ContentDetailBody(
                tabController: _tabController,
                isAdded: isAdded,
                onAddToWatchlist: (added) => setState(() => isAdded = added),
                isLiked: _isLiked,
                onLike: (liked) => setState(() => _isLiked = liked),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _VideoHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _VideoHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return child;
  }

  @override
  bool shouldRebuild(covariant _VideoHeaderDelegate oldDelegate) {
    return oldDelegate.minHeight != minHeight ||
        oldDelegate.maxHeight != maxHeight ||
        oldDelegate.child != child;
  }
}
