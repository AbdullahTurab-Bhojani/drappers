import 'package:flutter/material.dart';
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

  final List<dynamic> images = [
    Assets.icons.visible,
    Assets.icons.visible,
    Assets.icons.visible,
  ];

  final List<String> titles = [
    'Create Your Trading Identity',
    'Showcase Your Portfolios',
    'Build Your Trading Network',
  ];

  final List<String> subtitles = [
    'Reserve your handle, build your trading profile, and showcase your experience.',
    'Analyze and share your portfolio performance with others to gain recognition and insights.',
    'Build your own traders network or follow others that match your interests.',
  ];

  // Common Text Styles
  final TextStyle titleText = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  final TextStyle subtitleText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.white70,
    height: 1.5,
  );

  final TextStyle normalText = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.images.onboardingBg.path),
            fit: BoxFit.cover,
          ),
        ),

        child: SafeArea(
          top: true,
          bottom: false,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 16, bottom: 8),
                child: Image.asset(
                  Assets.images.onboardingBg.path,
                  height: 44,
                  width: 200,
                ),
              ),

              // PageView
              Expanded(
                flex: 6,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: images.length,
                  onPageChanged: (index) {
                    setState(() => currentPage = index);
                  },
                  itemBuilder: (context, index) {
                    return Image.asset(images[index], fit: BoxFit.contain);
                  },
                ),
              ),

              Container(
                height: MediaQuery.sizeOf(context).height * 0.44,
                width: double.infinity,
                color: AppColors.color3B82F6,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      titles[currentPage],
                      textAlign: TextAlign.center,
                      style: titleText,
                    ),

                    SizedBox(height: 10),

                    Text(
                      subtitles[currentPage],
                      textAlign: TextAlign.center,
                      style: subtitleText,
                    ),

                    SizedBox(height: 25),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        images.length,
                        (index) => AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          width: 26,
                          height: 4,
                          decoration: BoxDecoration(
                            color: currentPage == index
                                ? customColors.textColor
                                : customColors.light,
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 25),

                    Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFFFF9800),
                            Color(0xFFE91E63),
                            Color(0xFF673AB7),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.topRight,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Center(child: Text('Sign in', style: normalText)),
                    ),

                    SizedBox(height: 15),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _socialButton(
                          icon: Assets.images.logo.image(width: 20, height: 20),
                          text: "Sign in",
                          textColor: customColors.textColor,
                        ),
                        SizedBox(width: 15),
                        _socialButton(
                          icon: Assets.images.logo.image(width: 20, height: 20),
                          text: "Sign in",
                          textColor: customColors.textColor,
                        ),
                      ],
                    ),

                    SizedBox(height: 24),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "don't have an account?",
                          style: normalText.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: customColors.greyColor,
                          ),
                        ),
                        SizedBox(width: 6),
                        Text(
                          "sign up",
                          style: normalText.copyWith(
                            fontSize: 14,
                            decoration: TextDecoration.underline,
                            color: Color(0xFFFF6EA3),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _socialButton({
    required Widget icon,
    required String text,
    required Color textColor,
  }) {
    return Container(
      width: 172,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          SizedBox(width: 6),
          Text(text, style: normalText.copyWith(color: textColor)),
        ],
      ),
    );
  }
}
