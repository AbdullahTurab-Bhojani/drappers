import 'package:flutter/material.dart';
import 'dart:async';

import 'package:go_router/go_router.dart';

import '../../../../drappers.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Splash Screen",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            GestureDetector(
              onTap: () {
                context.pushNamed(AppRoutes.onboardingScreen.name);
              },
              child: Text(
                        "onboarding Screen",
                        style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
                        ),
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
