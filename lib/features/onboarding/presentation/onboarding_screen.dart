import 'package:flutter/material.dart';
import 'dart:async';
import '../../../core/extensions/theme_extension.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({Key? key}) : super(key: key);

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
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );

      setState(() {
        currentPage = nextPage; // ✅ safe update
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
            controller: _pageController,
            itemCount: images.length,
            onPageChanged: (index) {
              setState(() => currentPage = index);
            },
            itemBuilder: (context, index) {
              return Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(images[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
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
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      )
                                    : null,
                                color: currentPage != index
                                    ? customColors.greyColor
                                    : null,
                                borderRadius: BorderRadius.circular(
                                  currentPage == index ? 4 : 4,
                                ), 
                                shape: BoxShape.rectangle, 
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 32),
                        Text(
                          titles[currentPage],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          subtitles[currentPage],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Colors.white70,
                            height: 1.5,
                          ),
                        ),
                        SizedBox(height: 60),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 52,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF1FCFFF), Color(0xFF0063FF)],
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,
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
                      child: Text(
                        'Next',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
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
