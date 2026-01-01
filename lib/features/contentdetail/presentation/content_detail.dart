// ignore_for_file: deprecated_member_use, unused_element, prefer_final_fields, unused_field

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import '../../../core/extensions/theme_extension.dart';
import '../../../core/theme/app_scalar.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';
import '../../../shared/widgets/cardwidget/card_widget.dart';
import '../../../shared/widgets/guestloginwidget.dart';
import '../../../shared/widgets/reelcard/reelcard_widget.dart';

class ContentDetail extends StatefulWidget {
  const ContentDetail({super.key});

  @override
  State<ContentDetail> createState() => _ContentDetailState();
}

class _ContentDetailState extends State<ContentDetail>
    with SingleTickerProviderStateMixin {
  bool _isLiked = false;
  bool isAdded = false;

  late TabController _tabController;
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
    _tabController = TabController(length: 2, vsync: this)
      ..addListener(() => setState(() {}));

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;

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
                    /// 🔹 Preview
                    Container(
                      height: AppScaler.scaleHeight(context, 258),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          AppScaler.scaleSize(context, 16),
                        ),
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
                                borderRadius: BorderRadius.circular(
                                  AppScaler.scaleSize(context, 16),
                                ),
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
                                height: AppScaler.scaleSize(context, 60),
                              ),
                            ),
                          ),
                          Positioned(
                            top: AppScaler.scaleHeight(context, 12),
                            right: AppScaler.scaleSize(context, 19),
                            child: GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () => Navigator.pop(context),
                              child: Image.asset(
                                Assets.images.crossnewicon.path,
                                width: AppScaler.scaleSize(context, 24),
                                height: AppScaler.scaleSize(context, 24),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: AppScaler.scaleHeight(context, 12),
                            right: AppScaler.scaleSize(context, 19),
                            child: Image.asset(
                              Assets.images.muteicon.path,
                              width: AppScaler.scaleSize(context, 20),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: AppScaler.scaleHeight(context, 15)),

                    /// 🔹 Title
                    PoppinsText(
                      context,
                      'Finale – Meet The Drapers Season 07 (2025)',
                      fontSize: PoppinsFontSizeVariant.size22,
                      fontWeight: PoppinsFontWeightVariant.medium,
                      color: customColors.textColor,
                    ),

                    SizedBox(height: AppScaler.scaleHeight(context, 10)),

                    /// 🔹 Buttons
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: AppScaler.scaleHeight(context, 45),
                            child: AppButton(
                              title: 'Play',
                              onPressed: () {
                                context.pushNamed(AppRoutes.videoScreen.name);
                              },
                              prefixIcon: Image.asset(
                                Assets.images.playstrokeicon.path,
                                width: AppScaler.scaleSize(context, 15),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: AppScaler.scaleSize(context, 10)),
                        Expanded(
                          child: SizedBox(
                            height: AppScaler.scaleHeight(context, 45),
                            child: AppButton(
                              title: isAdded ? 'Added' : 'Add To Watch List',
                              border: true,
                              borderColor: customColors.greyColor,
                              color: Colors.transparent,
                              onPressed: () {
                                if (GuestHelper.isGuest) {
                                  GuestHelper.checkGuest(context);
                                  return;
                                }
                                setState(() {
                                  isAdded = !isAdded;
                                });
                              },
                              prefixIcon: isAdded
                                  ? Icon(
                                      Icons.check,
                                      size: AppScaler.scaleSize(context, 17),
                                      color: customColors.textColor,
                                    )
                                  : Image.asset(
                                      Assets.images.addicon.path,
                                      width: AppScaler.scaleSize(context, 15),
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppScaler.scaleSize(context, 12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: AppScaler.scaleHeight(context, 15)),

                      TabBar(
                        controller: _tabController,
                        tabs: [
                          Tab(text: "Episodes"),
                          Tab(text: "More Like This"),
                        ],
                        labelColor: customColors.textColor,
                        unselectedLabelColor: customColors.labelColor,
                      ),

                      SizedBox(height: AppScaler.scaleHeight(context, 10)),

                      _tabController.index == 0
                          ? GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: trendingimages.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount:
                                        MediaQuery.of(context).size.width > 800
                                        ? 5
                                        : MediaQuery.of(context).size.width >
                                              600
                                        ? 4
                                        : MediaQuery.of(context).size.width >
                                              400
                                        ? 3
                                        : 2,
                                    mainAxisSpacing: AppScaler.scaleHeight(
                                      context,
                                      10,
                                    ),
                                    crossAxisSpacing: AppScaler.scaleSize(
                                      context,
                                      10,
                                    ),
                                    childAspectRatio:
                                        (MediaQuery.of(context).size.width /
                                            2) /
                                        (MediaQuery.of(context).size.height /
                                            3),
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
                            )
                          : GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: reelimages.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount:
                                        MediaQuery.of(context).size.width > 600
                                        ? 4
                                        : MediaQuery.of(context).size.width >
                                              400
                                        ? 3
                                        : 2,
                                    mainAxisSpacing: AppScaler.scaleHeight(
                                      context,
                                      10,
                                    ),
                                    crossAxisSpacing: AppScaler.scaleSize(
                                      context,
                                      10,
                                    ),
                                    childAspectRatio:
                                        MediaQuery.of(context).size.width /
                                        (MediaQuery.of(context).size.height /
                                            2),
                                  ),
                              itemBuilder: (context, index) {
                                return ReelcardWidget(
                                  assetImagePath: reelimages[index],
                                  title: reelTitles[index],
                                  reelCardHeight: AppScaler.scaleHeight(
                                    context,
                                    180,
                                  ),
                                  reelCardWidth: AppScaler.scaleSize(
                                    context,
                                    120,
                                  ),
                                  fontSizeVariant:
                                      PoppinsFontSizeVariant.size14,
                                  showSaveIcon: false,
                                );
                              },
                            ),

                      SizedBox(height: AppScaler.scaleHeight(context, 20)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
