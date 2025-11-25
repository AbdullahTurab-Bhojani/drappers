import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';
import '../../../core/extensions/theme_extension.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';

// Assuming you have defined AppRoutes, AppButton, PoppinsText, AppColors,
// and AppCustomColors in your project.

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
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      int nextPage = currentPage + 1;
      if (nextPage >= images.length) nextPage = 0;

      _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.linearToEaseOut,
      );
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
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    images.length,
                    (index) => AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      margin: EdgeInsets.symmetric(horizontal: 2),
                      width: currentPage == index ? 26 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        gradient: currentPage == index
                            ?  LinearGradient(
                                colors: [Color(0xFF1FCFFF), Color(0xFF0063FF)],
                              )
                            : null,
                        color: currentPage != index ? AppColors.wDark : null,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28),
                  child: Column(
                    children: [
                     SizedBox(height: 32),
                      PoppinsText(
                        titles[currentPage],
                        textAlign: TextAlign.center,
                        fontSize: PoppinsFontSizeVariant.size32,
                        fontWeight: PoppinsFontWeightVariant.medium,
                        color: customColors.textColor,
                        height: 1.3,
                      ),
                       SizedBox(height: 32),
                      PoppinsText(
                        subtitles[currentPage],
                        textAlign: TextAlign.center,
                        fontSize: PoppinsFontSizeVariant.size16,
                        fontWeight: PoppinsFontWeightVariant.light,
                        color: customColors.textColor,
                        height: 1.7,
                      ),
                      const SizedBox(height: 120),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: AppButton(
                    onPressed: () {
                      if (currentPage < images.length - 1) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        );
                      } else {
                        context.pushNamed(AppRoutes.loginScreen.name);
                      }
                    },
                    title: currentPage == images.length - 1
                        ? 'Get Started'
                        : 'Next',
                  ),
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
