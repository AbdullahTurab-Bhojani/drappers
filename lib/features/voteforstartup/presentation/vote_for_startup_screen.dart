// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/extensions/theme_extension.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';
import '../../../shared/widgets/app_bar/main_app_bar.dart';

class VoteForStartupScreen extends StatefulWidget {
  const VoteForStartupScreen({super.key});

  @override
  State<VoteForStartupScreen> createState() => _VoteForStartupScreenState();
}

class _VoteForStartupScreenState extends State<VoteForStartupScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;

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
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Image.asset(
                    "assets/images/backicon.png",
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
              title: "Vote for Startup",
              centerTitle: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Image.asset(
                    "assets/images/Searchicon.png",
                    width: 20,
                    height: 20,
                  ),
                ),
              ],
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      SizedBox(height: 30),

                      Container(
                        width: double.infinity,
                        height: 85,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF00C6FF), Color(0xFF0072FF)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    width: 84,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          Assets.images.trendingshowimage1.path,
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  Container(
                                    width: 75,
                                    height: 55,
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  Positioned.fill(
                                    child: Center(
                                      child: Image.asset(
                                        Assets.images.play.path,
                                        width: 22,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    PoppinsText(
                                      "Meet the Drapers Competition",
                                      fontSize: PoppinsFontSizeVariant.size16,
                                      fontWeight:
                                          PoppinsFontWeightVariant.medium,
                                    ),
                                    SizedBox(height: 6),
                                    PoppinsText(
                                      "Vote for your favourites startup from \nseason 5, Episode 12.",
                                      fontSize: PoppinsFontSizeVariant.size12,
                                      fontWeight:
                                          PoppinsFontWeightVariant.regular,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 30),

                      Container(
                        width: double.infinity,
                        height: 85,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.dGrey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    width: 84,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          Assets.images.trendingshowimage1.path,
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  Container(
                                    width: 75,
                                    height: 55,
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  Positioned.fill(
                                    child: Center(
                                      child: Image.asset(
                                        Assets.images.play.path,
                                        width: 22,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    PoppinsText(
                                      "Voting Instructions",
                                      fontSize: PoppinsFontSizeVariant.size16,
                                      fontWeight:
                                          PoppinsFontWeightVariant.medium,
                                    ),
                                    SizedBox(height: 6),
                                    PoppinsText(
                                      "Lorem ipsum dolor sit amet consectetur. Lorem at elit eu facilisis. Sed cursus volutpat.",
                                      fontSize: PoppinsFontSizeVariant.size11,
                                      fontWeight:
                                          PoppinsFontWeightVariant.regular,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 30),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: customColors.dark,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                              onTap: () {
                                context.pushNamed(
                                  AppRoutes.Startupdetails.name,
                                );
                              },
                              child: Container(
                                width: double.infinity,
                                height: 215,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      Assets.images.podcastimage1.path,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Center(
                                      child: Image.asset(
                                        Assets.images.playwithbgicon.path,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 10,
                                      right: 10,
                                      child: Image.asset(
                                        Assets.images.muteicon.path,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(15),
                              child: Container(
                                width: double.infinity,
                                color: customColors.dark,
                                child: Column(
                                  crossAxisAlignment: .start,
                                  children: [
                                    PoppinsText(
                                      'Echo Tech Solutions',
                                      fontSize: PoppinsFontSizeVariant.size22,
                                      fontWeight:
                                          PoppinsFontWeightVariant.medium,
                                    ),
                                    SizedBox(height: 2),

                                    PoppinsText(
                                      'Sustainable energy Revolution',
                                      fontSize: PoppinsFontSizeVariant.size16,
                                      fontWeight:
                                          PoppinsFontWeightVariant.regular,
                                      color: customColors.subtextColor,
                                    ),
                                    SizedBox(height: 10),
                                    PoppinsText(
                                      'simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting.',
                                      fontSize: PoppinsFontSizeVariant.size12,
                                      fontWeight:
                                          PoppinsFontWeightVariant.regular,
                                      color: customColors.subtextColor,
                                    ),
                                    SizedBox(height: 20),
                                    PoppinsText(
                                      'Meet the Drapers S512',
                                      fontSize: PoppinsFontSizeVariant.size16,
                                      fontWeight:
                                          PoppinsFontWeightVariant.regular,
                                      color: customColors.textColor,
                                    ),
                                    SizedBox(height: 30),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        AppButton(
                                          prefixIcon: Image.asset(
                                            Assets.images.playstrokeicon.path,
                                            width: 14,
                                            height: 14,
                                          ),
                                          onPressed: () {},
                                          title: 'Watch Episode',
                                          buttonSize: Size(175, 52),
                                          suffixIcon: SizedBox(),
                                        ),
                                        Container(
                                          width: 148,
                                          height: 52,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: customColors.greyColor,
                                              width: 2,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              50,
                                            ),
                                          ),
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment: .center,
                                              children: [
                                                Image.asset(
                                                  Assets.images.hearticon.path,
                                                  width: 20,
                                                  height: 20,
                                                ),
                                                SizedBox(width: 8),
                                                PoppinsText(
                                                  'Vote',
                                                  fontSize:
                                                      PoppinsFontSizeVariant
                                                          .size16,
                                                  fontWeight:
                                                      PoppinsFontWeightVariant
                                                          .medium,
                                                  color:
                                                      customColors.subtextColor,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        //  AppButton(
                                        //   onPressed: () {},
                                        //   icon: Image.asset(
                                        //     Assets.images.playstrokeicon.path,
                                        //     width: 14,
                                        //     height: 14,
                                        //   ),
                                        //   title: 'Vote',
                                        //   buttonSize: Size(158, 52),
                                        // ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 30),
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
