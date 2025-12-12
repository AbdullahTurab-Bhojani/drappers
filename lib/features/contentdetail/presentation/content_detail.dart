import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/extensions/theme_extension.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';
import '../../../shared/widgets/cardwidget/card_widget.dart';
import '../../../shared/widgets/reelcard/reelcard_widget.dart';

class ContentDetail extends StatefulWidget {
  ContentDetail({super.key});

  @override
  State<ContentDetail> createState() => _ContentDetailState();
}

class _ContentDetailState extends State<ContentDetail>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool isAdded = false;
  String selectedSeason = "Season 01";

  List trendingimages = [
    Assets.images.trendingshowimage1.path,
    Assets.images.trendingshowimage2.path,
    Assets.images.trendingshowimage3.path,
    Assets.images.trendingshowimage4.path,
    Assets.images.trendingshowimage5.path,
    Assets.images.trendingshowimage6.path,
    Assets.images.trendingshowimage7.path,
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

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              Assets.images.screensbg.path,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 54, left: 12, right: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 258,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: AssetImage(Assets.images.preview.path),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          InkWell(
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
                            child: InkWell(
                              onTap: () {
                                context.pushNamed(AppRoutes.videoScreen.name);
                              },
                              child: Image.asset(
                                Assets.images.playwithbgicon.path,
                                width: 60,
                                height: 60,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 12,
                            right: 19,
                            child: GestureDetector(
                              onTap: () => Navigator.of(context).pop(),
                              child: Image.asset(
                                Assets.images.cancelicon.path,
                                width: 24,
                                height: 24,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 12,
                            right: 19,
                            child: Image.asset(Assets.images.muteicon.path),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    PoppinsText(
                      'Finale – Meet The Drapers Season 07 (2025)',
                      fontSize: PoppinsFontSizeVariant.size22,
                      fontWeight: PoppinsFontWeightVariant.medium,
                      color: customColors.textColor,
                    ),
                    SizedBox(height: 10),
                    RichText(
                      text: TextSpan(style: GoogleFonts.poppins(),
                      children: [ TextSpan(
                        text: '91% match',
                         style: GoogleFonts.poppins( fontSize: 16, 
                         fontWeight: FontWeight.w400, 
                         color: customColors.greyColor, ), ),
                          WidgetSpan(child: SizedBox(width: 8)),
                           TextSpan( text: '2017', 
                           style: GoogleFonts.poppins( fontSize: 16,
                            fontWeight: FontWeight.w400, color: customColors.textColor, ), ),
                             WidgetSpan(child: SizedBox(width: 8)), 
                             WidgetSpan( child: Container(
                               width: 22, height: 15, 
                               decoration: BoxDecoration(
                                 color: AppColors.shadegreycolor6B6B6B,
                                  borderRadius: BorderRadius.circular(2), ),
                                   alignment: Alignment.center,
                                    child: PoppinsText( '16+', 
                                    fontSize: PoppinsFontSizeVariant.size8, 
                                    fontWeight: PoppinsFontWeightVariant.semiBold,
                                     color: customColors.textColor, ), ), ), 
                                     WidgetSpan(child: SizedBox(width: 8)), 
                                     TextSpan( text: '2h 43m', style: GoogleFonts.poppins( 
                                      fontSize: 16, fontWeight: FontWeight.w400, 
                                      color: customColors.textColor, ), ),
                                       WidgetSpan(child: SizedBox(width: 8)),
                                        WidgetSpan( child: Container( 
                                          width: 22, height: 15,
                                           decoration: BoxDecoration( 
                                            border: Border.all( color: AppColors.shadegreycolor6B6B6B, width: 2, ),
                                             borderRadius: BorderRadius.circular(4), ),
                                              alignment: Alignment.center,
                                               child: PoppinsText( 
                                                'HQ', fontSize: PoppinsFontSizeVariant.size8,
                                                 fontWeight: PoppinsFontWeightVariant.semiBold,
                                                  color: customColors.textColor, ), ), ), ], ), ),
                      SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 188,
                          height: 45,
                          child: AppButton(
                            onPressed: () {
                              context.pushNamed(AppRoutes.videoScreen.name);
                            },
                            title: 'Play',
                            prefixIcon: Image.asset(
                              Assets.images.playstrokeicon.path,
                              width: 15,
                              height: 15,
                            ),
                            fontSize: PoppinsFontSizeVariant.size14,
                          ),
                        ),
                        SizedBox(width: 10),
                        SizedBox(
                          width: 188,
                          height: 45,
                          child: AppButton(
                            onPressed: () {
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
                                    width: 15,
                                    height: 15,
                                  ),
                            fontSize: PoppinsFontSizeVariant.size14,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PoppinsText(
                        '"The Wolf of Wall Street" is a captivating film about Jordan Belfort\'s rise and fall.',
                        fontSize: PoppinsFontSizeVariant.size16,
                        fontWeight: PoppinsFontWeightVariant.regular,
                        color: customColors.textColor,
                      ),
                      SizedBox(height: 5),
                      PoppinsText(
                        'Cast: Leonardo DiCaprio, Jonah Hill, Margot Robbie, Matthew.... more Director: Denis Villeneuve',
                        fontSize: PoppinsFontSizeVariant.size12,
                        fontWeight: PoppinsFontWeightVariant.regular,
                        color: customColors.greyColor,
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding:  EdgeInsets.only(left: 12),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  Assets.images.likeicon.path,
                                  width: 18,
                                  height: 18,
                                ),
                                SizedBox(height: 10),
                                PoppinsText(
                                  'Like',
                                  fontSize: PoppinsFontSizeVariant.size12,
                                  fontWeight: PoppinsFontWeightVariant.regular,
                                  color: customColors.textColor,
                                ),
                              ],
                            ),
                            SizedBox(width: 30),
                            Column(
                              children: [
                                Image.asset(
                                  Assets.images.shareiconnew.path,
                                  width: 18,
                                  height: 18,
                                ),
                                SizedBox(height: 10),
                                PoppinsText(
                                  'Share',
                                  fontSize: PoppinsFontSizeVariant.size12,
                                  fontWeight: PoppinsFontWeightVariant.regular,
                                  color: customColors.textColor,
                                ),
                              ],
                            ),
                            SizedBox(width: 30),
                            Column(
                              children: [
                                Image.asset(
                                  Assets.images.flagicon.path,
                                  width: 18,
                                  height: 18,
                                ),
                                SizedBox(height: 10),
                                PoppinsText(
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
                      SizedBox(height: 7),
                      TabBar(
                        controller: _tabController,
                        tabs: [
                          Tab(text: "Episodes"),
                          Tab(text: "More Like This"),
                        ],
                        indicator: UnderlineTabIndicator(
                          borderSide: BorderSide(
                            width: 4,
                            color: customColors.textColor,
                          ),
                        ),
                        indicatorSize: TabBarIndicatorSize.tab,
                        labelColor: customColors.textColor,
                        unselectedLabelColor: customColors.labelColor,
                        labelStyle: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10),
                      Builder(
                        builder: (context) {
                          return Column(
                            children: [
                              if (_tabController.index == 0)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    /// Season Dropdown
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 4),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            height: 30,
                                            decoration: BoxDecoration(
                                              color: customColors.containergrey,
                                              borderRadius: BorderRadius.circular(4),
                                            ),
                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButton<String>(
                                                value: selectedSeason,
                                                icon: Icon(
                                                  Icons.keyboard_arrow_down,
                                                  color: customColors.textColor,
                                                  size: 20,
                                                ),
                                                items: [
                                                  "Season 01",
                                                  "Season 02",
                                                  "Season 03",
                                                  "Season 04",
                                                  "Season 05",
                                                ]
                                                    .map((season) => DropdownMenuItem(
                                                          value: season,
                                                          child: PoppinsText(
                                                            season,
                                                            color: customColors.textColor,
                                                            fontSize:
                                                                PoppinsFontSizeVariant
                                                                    .size12,
                                                            fontWeight:
                                                                PoppinsFontWeightVariant
                                                                    .regular,
                                                          ),
                                                        ))
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
                                            height: 18,
                                            width: 18,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 12),
      
                                    /// Episodes Grid
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
                                        childAspectRatio: 0.6,
                                      ),
                                      itemBuilder: (context, index) {
                                        return CardWidget(
                                          assetImage: trendingimages[index],
                                          showSaveIcon: false,
                                        );
                                      },
                                    ),
                                  ],
                                )
                              else
                                /// More Like This Grid
                                GridView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.zero,
                                  itemCount: reelimages.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
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
      
                      SizedBox(height: 50),
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

List trendingimages = [
  Assets.images.trendingshowimage1.path,
  Assets.images.trendingshowimage2.path,
  Assets.images.trendingshowimage3.path,
  Assets.images.trendingshowimage4.path,
  Assets.images.trendingshowimage5.path,
  Assets.images.trendingshowimage6.path,
  Assets.images.trendingshowimage7.path,
];

// class _ContentDetailState extends State<ContentDetail>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   bool isAdded = false;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);
//     _tabController.addListener(() {
//       setState(() {});
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final customColors = theme.extension<AppCustomColors>()!;
//     String selectedSeason = "Season 01";

//     List<String> reelimages = [
//       Assets.images.reelimage1.path,
//       Assets.images.reelimage2.path,
//       Assets.images.reelimage3.path,
//       Assets.images.reelimage4.path,
//       Assets.images.reelimage5.path,
//     ];
//     List<String> reelTitles = [
//       'Rio De Janeiro - Meet The Drappers',
//       'Brand Acceleration - Meet The Drappers',
//       'Season 5, India - Meet The Drappers',
//       'The Frontier - Meet The Drappers',
//       'Season 6, Saudi Arabia - Meet The Drappers',
//     ];

//     return
//      Scaffold(
//       body: Stack(
//         children: [
//           Positioned.fill(
//             child: Image.asset(Assets.images.screensbg.path, fit: BoxFit.cover),
//           ),
//           Padding(
//             padding: EdgeInsets.only(top: 54),
//             child: CustomScrollView(
//               slivers: [
//                 SliverPersistentHeader(
//                   pinned: true,
//                   delegate: _VideoHeaderDelegate(
//                     minHeight: 258,
//                     maxHeight: 258,
//                     child: Container(
//                       width: double.infinity,
//                       height: 258,
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                           image: AssetImage(Assets.images.preview.path),
//                           fit: BoxFit.cover,
//                         ),
//                         borderRadius: BorderRadius.circular(16),
//                       ),
//                       child: Stack(
//                         children: [
//                           InkWell(
//                             onTap: () {
//                               context.pushNamed(AppRoutes.videoScreen.name);
//                             },
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 color: Colors.black.withOpacity(0.2),
//                                 borderRadius: BorderRadius.circular(16),
//                               ),
//                             ),
//                           ),
//                           InkWell(
//                             onTap: () {
//                               context.pushNamed(AppRoutes.videoScreen.name);
//                             },
//                             child: Center(
//                               child: Image.asset(
//                                 Assets.images.playwithbgicon.path,
//                                 width: 60,
//                                 height: 60,
//                               ),
//                             ),
//                           ),
//                           Positioned(
//                             top: 12,
//                             right: 19,
//                             child: GestureDetector(
//                               onTap: () => Navigator.of(context).pop(),
//                               child: Image.asset(
//                                 Assets.images.cancelicon.path,
//                                 width: 24,
//                                 height: 24,
//                               ),
//                             ),
//                           ),
//                           Positioned(
//                             bottom: 12,
//                             right: 19,
//                             child: Image.asset(Assets.images.muteicon.path),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),

//                 SliverToBoxAdapter(
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 9, vertical: 20),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         PoppinsText(
//                           'Finale – Meet The Drapers Season 07 (2025)',
//                           fontSize: PoppinsFontSizeVariant.size22,
//                           fontWeight: PoppinsFontWeightVariant.medium,
//                           color: customColors.textColor,
//                         ),

//                         SizedBox(height: 15),
//                         RichText(
//                           text: TextSpan(
//                             style: GoogleFonts.poppins(),
//                             children: [
//                               TextSpan(
//                                 text: '91% match',
//                                 style: GoogleFonts.poppins(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w400,
//                                   color: customColors.greyColor,
//                                 ),
//                               ),
//                               WidgetSpan(child: SizedBox(width: 8)),
//                               TextSpan(
//                                 text: '2017',
//                                 style: GoogleFonts.poppins(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w400,
//                                   color: customColors.textColor,
//                                 ),
//                               ),
//                               WidgetSpan(child: SizedBox(width: 8)),
//                               WidgetSpan(
//                                 child: Container(
//                                   width: 22,
//                                   height: 15,
//                                   decoration: BoxDecoration(
//                                     color: AppColors.shadegreycolor6B6B6B,
//                                     borderRadius: BorderRadius.circular(2),
//                                   ),
//                                   alignment: Alignment.center,
//                                   child: PoppinsText(
//                                     '16+',
//                                     fontSize: PoppinsFontSizeVariant.size8,
//                                     fontWeight:
//                                         PoppinsFontWeightVariant.semiBold,
//                                     color: customColors.textColor,
//                                   ),
//                                 ),
//                               ),
//                               WidgetSpan(child: SizedBox(width: 8)),
//                               TextSpan(
//                                 text: '2h 43m',
//                                 style: GoogleFonts.poppins(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w400,
//                                   color: customColors.textColor,
//                                 ),
//                               ),
//                               WidgetSpan(child: SizedBox(width: 8)),
//                               WidgetSpan(
//                                 child: Container(
//                                   width: 22,
//                                   height: 15,
//                                   decoration: BoxDecoration(
//                                     border: Border.all(
//                                       color: AppColors.shadegreycolor6B6B6B,
//                                       width: 2,
//                                     ),
//                                     borderRadius: BorderRadius.circular(4),
//                                   ),
//                                   alignment: Alignment.center,
//                                   child: PoppinsText(
//                                     'HQ',
//                                     fontSize: PoppinsFontSizeVariant.size8,
//                                     fontWeight:
//                                         PoppinsFontWeightVariant.semiBold,
//                                     color: customColors.textColor,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(height: 15),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             SizedBox(
//                               width: 188,
//                               height: 45,
//                               child: AppButton(
//                                 onPressed: () {
//                                   context.pushNamed(AppRoutes.videoScreen.name);
//                                 },
//                                 title: 'Play',
//                                 prefixIcon: Image.asset(
//                                   Assets.images.playstrokeicon.path,
//                                   width: 15,
//                                   height: 15,
//                                 ),
//                                 // buttonSize: Size(175, 45),
//                                 fontSize: PoppinsFontSizeVariant.size14,
//                               ),
//                             ),
//                             SizedBox(width: 10),
//                             SizedBox(
//                               width: 188,
//                               height: 45,
//                               child: AppButton(
//                                 onPressed: () {
//                                   setState(() {
//                                     isAdded = !isAdded;
//                                   });
//                                 },
//                                 title: isAdded ? 'Added' : 'Add To Watch List',
//                                 color: Colors.transparent,
//                                 borderColor: customColors.greyColor,
//                                 borderWidth: 1,
//                                 border: true,
//                                 prefixIcon: isAdded
//                                     ? Icon(
//                                         Icons.check,
//                                         size: 17,
//                                         color: customColors.textColor,
//                                       )
//                                     : Image.asset(
//                                         Assets.images.addicon.path,
//                                         width: 15,
//                                         height: 15,
//                                       ),
//                                 // buttonSize: Size(155, 45),
//                                 fontSize: PoppinsFontSizeVariant.size14,
//                  ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
                
//                 SliverToBoxAdapter(
//   child: Padding(
//     padding: EdgeInsets.symmetric(horizontal: 9),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//                         SizedBox(height: 10),
//                         PoppinsText(
//                           '"The Wolf of Wall Street" is a captivating film about Jordan Belforts rise and fall."',
//                           fontSize: PoppinsFontSizeVariant.size16,
//                           fontWeight: PoppinsFontWeightVariant.regular,
//                           color: customColors.textColor,
//                         ),
//                         SizedBox(height: 5),
//                         PoppinsText(
//                           'Cast: Leonardo DiCaprio, Jonah Hill, Margot Robbie, Matthew.... more Director: Denis Villeneuve',
//                           fontSize: PoppinsFontSizeVariant.size12,
//                           fontWeight: PoppinsFontWeightVariant.regular,
//                           color: customColors.greyColor,
//                         ),
//                         SizedBox(height: 20),
//                         Padding(
//                           padding: EdgeInsets.only(left: 20),
//                           child: Row(
//                             children: [
//                               Column(
//                                 children: [
//                                   Image.asset(
//                                     Assets.images.likeicon.path,
//                                     width: 18,
//                                     height: 18,
//                                   ),
//                                   SizedBox(height: 10),
//                                   PoppinsText(
//                                     'Like',
//                                     fontSize: PoppinsFontSizeVariant.size12,
//                                     fontWeight: PoppinsFontWeightVariant.regular,
//                                     color: customColors.textColor,
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(width: 30),
//                               Column(
//                                 children: [
//                                   Image.asset(
//                                     Assets.images.shareiconnew.path,
//                                     width: 18,
//                                     height: 18,
//                                   ),
//                                   SizedBox(height: 10),
//                                   PoppinsText(
//                                     'Share',
//                                     fontSize: PoppinsFontSizeVariant.size12,
//                                     fontWeight: PoppinsFontWeightVariant.regular,
//                                     color: customColors.textColor,
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(width: 30),
//                               Column(
//                                 children: [
//                                   Image.asset(
//                                     Assets.images.flagicon.path,
//                                     width: 18,
//                                     height: 18,
//                                   ),
//                                   SizedBox(height: 10),
//                                   PoppinsText(
//                                     'Report',
//                                     fontSize: PoppinsFontSizeVariant.size12,
//                                     fontWeight: PoppinsFontWeightVariant.regular,
//                                     color: customColors.textColor,
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(height: 5),

//                         TabBar(
//                           onTap: (value) {
//                             setState(() {});
//                           },
//                           controller: _tabController,
//                           tabs: [
//                             Tab(text: "Episodes"),
//                             Tab(text: "More Like This"),
//                           ],
//                           indicator: UnderlineTabIndicator(
//                             borderSide: BorderSide(
//                               width: 4,
//                               color: customColors.textColor,
//                             ),
//                           ),
//                           indicatorSize: TabBarIndicatorSize.tab,
//                           labelColor: customColors.textColor,
//                           unselectedLabelColor: customColors.labelColor,
//                           labelStyle: GoogleFonts.poppins(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),

//                         SizedBox(height: 10),
//                         Builder(
//                           builder: (context) {
//                             return Column(
//                               children: [
//                                 if (_tabController.index == 0)
//                                   Padding(
//                                     padding: EdgeInsets.only(
//                                       left: 10,
//                                       right: 10,
//                                       top: 10,
//                                     ),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Container(
//                                           padding: EdgeInsets.only(left: 10, right: 6),
//                                           height: 20, width: 100,
//                                           decoration: BoxDecoration(
//                                         color: customColors.containergrey,
//                                         borderRadius: BorderRadius.circular(4)
//                                           ),
//                                           child: DropdownButtonHideUnderline(
//                                             child: DropdownButton<String>(
//                                               value: selectedSeason,
//                                               icon: Icon(
//                                                 Icons.keyboard_arrow_down,
//                                                 color: customColors.textColor,
//                                                 size: 20,
//                                               ),
//                                               items:
//                                                   [
//                                                     "Season 01",
//                                                     "Season 02",
//                                                     "Season 03",
//                                                     "Season 04",
//                                                     "Season 05",
//                                                   ].map((season) {
//                                                     return DropdownMenuItem(
//                                                       value: season,
//                                                       child: PoppinsText(
//                                                         season,
//                                                         color: customColors.textColor,
//                                                         fontSize: PoppinsFontSizeVariant.size12,
//                                                         fontWeight: PoppinsFontWeightVariant.regular,
//                                                       ),
//                                                     );
//                                                   }).toList(),
//                                               onChanged: (value) {
//                                                 setState(() {
//                                                   selectedSeason = value!;
//                                                 });
//                                               },
//                                             ),
//                                           ),
//                                         ),
//                                         Image.asset(
//                                           Assets.images.infoicon.path,
//                                           height: 18,
//                                           width: 18,
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 SizedBox(height: 12),
//                                 if (_tabController.index == 0)
//                                   GridView.builder(
//                                     shrinkWrap: true,
//                                     physics: NeverScrollableScrollPhysics(),
//                                     padding: EdgeInsets.zero,
//                                     itemCount: trendingimages.length,
//                                     gridDelegate:
//                                         SliverGridDelegateWithFixedCrossAxisCount(
//                                           crossAxisCount: 3,
//                                           mainAxisSpacing: 10,
//                                           crossAxisSpacing: 10,
//                                           childAspectRatio: 0.6,
//                                         ),
//                                     itemBuilder: (context, index) {
//                                       return CardWidget(
//                                         assetImage: trendingimages[index],
//                                         showSaveIcon: false,
//                                       );
//                                     },
//                                   )
//                                 else
//                                   GridView.builder(
//                                     shrinkWrap: true,
//                                     physics: NeverScrollableScrollPhysics(),
//                                     padding: EdgeInsets.zero,
//                                     itemCount: reelimages.length,
//                                     gridDelegate:
//                                         SliverGridDelegateWithFixedCrossAxisCount(
//                                           crossAxisCount: 2,
//                                           mainAxisSpacing: 10,
//                                           crossAxisSpacing: 15,
//                                           childAspectRatio: 0.5,
//                                         ),
//                                     itemBuilder: (context, index) {
//                                       return ReelcardWidget(
//                                         assetImagePath: reelimages[index],
//                                         title: reelTitles[index],
//                                         reelCardHeight: 100,
//                                         reelCardWidth: 100,
//                                         fontSizeVariant:
//                                             PoppinsFontSizeVariant.size14,
//                                         showSaveIcon: false,
//                                       );
//                                     },
//                                   ),
//                               ],
//                             );
//                           },
//                         ),
//                         SizedBox(height: 50),
//                        ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


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
