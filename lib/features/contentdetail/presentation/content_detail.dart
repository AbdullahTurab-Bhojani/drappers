// ignore_for_file: unused_element, deprecated_member_use

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
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                if (GuestHelper.isGuest) {
                                  GuestHelper.checkGuest(context);
                                  return;
                                }
                                context.pushNamed(AppRoutes.videoScreen.name);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(16),
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
                              if (GuestHelper.isGuest) {
                                GuestHelper.checkGuest(context);
                                return;
                              }
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
