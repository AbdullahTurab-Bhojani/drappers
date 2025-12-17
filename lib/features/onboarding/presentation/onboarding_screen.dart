import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/extensions/theme_extension.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';
import '../../../shared/widgets/guestloginwidget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int currentPage = 0;
  late final Timer _timer;

  final List<String> images = [
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
    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      final nextPage = (currentPage + 1) % images.length;
      _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeOut,
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
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          /// 🔹 Background PageView
          PageView.builder(
            controller: _pageController,
            itemCount: images.length,
            onPageChanged: (index) => setState(() => currentPage = index),
            itemBuilder: (_, index) {
              return Image.asset(
                images[index],
                fit: BoxFit.cover,
              );
            },
          ),

          /// 🔹 Skip button (SafeArea handled)
          SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 20, top: 8),
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    GuestHelper.isGuest = true;
                    context.pushNamed(AppRoutes.home.name);
                  },
                  child: PoppinsText(
                    'Skip',
                    fontSize: PoppinsFontSizeVariant.size14,
                    fontWeight: PoppinsFontWeightVariant.medium,
                    color: customColors.textColor,
                  ),
                ),
              ),
            ),
          ),

          /// 🔹 Bottom Content
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 100),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /// Dots
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        images.length,
                        (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          width: currentPage == index ? 26 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            gradient: currentPage == index
                                ? const LinearGradient(
                                    colors: [
                                      Color(0xFF1FCFFF),
                                      Color(0xFF0063FF),
                                    ],
                                  )
                                : null,
                            color:
                                currentPage != index ? AppColors.wDark : null,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    /// Title
                    PoppinsText(
                      titles[currentPage],
                      textAlign: TextAlign.center,
                      fontSize: PoppinsFontSizeVariant.size32,
                      fontWeight: PoppinsFontWeightVariant.medium,
                      color: customColors.textColor,
                      height: 1.3,
                    ),

                    const SizedBox(height: 16),

                    /// Subtitle
                    PoppinsText(
                      subtitles[currentPage],
                      textAlign: TextAlign.center,
                      fontSize: PoppinsFontSizeVariant.size16,
                      fontWeight: PoppinsFontWeightVariant.light,
                      color: customColors.textColor,
                      height: 1.7,
                    ),

                    const SizedBox(height: 24),

                    /// Button
                    AppButton(
                      onPressed: () {
                        GuestHelper.isGuest = true;
                        context.pushNamed(AppRoutes.home.name);
                      },
                      title: 'Next',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
