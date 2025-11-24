import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';
import '../../../core/extensions/theme_extension.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int currentPage = 0;
  late final Timer _timer;

  final List<dynamic> images = [
    Assets.images.onboarding1.path,
    Assets.images.onboarding2.path,
    Assets.images.onboarding3.path,
  ];

  final List<String> titles = [
    'A Front-Row Seat to Innovation',
    'World-Class Mentors, One Click Away',
    'The Stories Behind the Success',
  ];

  final List<String> subtitles = [
    'Catch live pitches and hear the unfiltered stories of entrepreneurs bringing their visions to life.',
    'Catch live pitches and hear the unfiltered stories of entrepreneurs bringing their visions to life.',
    "Dive deep into the success stories, the failures, and the hustle that shaped the world's most iconic companies.",
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      int nextPage = currentPage + 1;
      if (nextPage >= images.length) nextPage = 0;

      _pageController.animateToPage(
        nextPage,
        duration: Duration(milliseconds: 1000),
        curve: Curves.linearToEaseOut,
      );

      setState(() {
        currentPage = nextPage;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;

    return Scaffold(
      backgroundColor: customColors.dark,
      body: Stack(
        children: [
          PageView.builder(
            allowImplicitScrolling: false,
            controller: _pageController,
            itemCount: images.length,
            reverse: false,
            onPageChanged: (index) {
              setState(() => currentPage = index);
            },
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(images[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),

          Positioned(
            top: 60,
            right: 20,
            child: GestureDetector(
              onTap: () {
                context.pushNamed(AppRoutes.loginScreen.name);
              },
              child: PoppinsText(
                "Skip",
                fontSize: PoppinsFontSizeVariant.size14,
                fontWeight: PoppinsFontWeightVariant.medium,
                color: customColors.textColor,
              ),
            ),
          ),

          SafeArea(
            top: true,
            bottom: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(40, 16, 40, 20),
                    color: Colors.black38,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            images.length,
                            (index) => AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              margin: EdgeInsets.symmetric(horizontal: 4),
                              width: currentPage == index ? 26 : 8,
                              height: 8,
                              decoration: BoxDecoration(
                                gradient: currentPage == index
                                    ? LinearGradient(
                                        colors: [
                                          Color(0xFF1FCFFF),
                                          Color(0xFF0063FF),
                                        ],
                                      )
                                    : null,
                                color: currentPage != index
                                    ? AppColors.wDark
                                    : null,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 32),

                        PoppinsText(
                          titles[currentPage],
                          textAlign: TextAlign.center,
                          fontSize: PoppinsFontSizeVariant.size26,
                          fontWeight: PoppinsFontWeightVariant.extraBold,
                          color: Colors.white,
                        ),

                        SizedBox(height: 32),

                        PoppinsText(
                          subtitles[currentPage],
                          textAlign: TextAlign.center,
                          fontSize: PoppinsFontSizeVariant.size16,
                          fontWeight: PoppinsFontWeightVariant.light,
                          color: customColors.subtextColor,
                          height: 1.5,
                        ),

                        SizedBox(height: 60),
                      ],
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      context.pushNamed(AppRoutes.loginScreen.name);
                    },
                    child: Container(
                      width: double.infinity,
                      height: 52,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF1FCFFF), Color(0xFF0063FF)],
                        ),
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Center(
                        child: PoppinsText(
                          'Next',
                          fontSize: PoppinsFontSizeVariant.size16,
                          fontWeight: PoppinsFontWeightVariant.medium,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
