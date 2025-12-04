// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../../drappers.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Lottie.asset(
            'assets/data.json',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            animate: true,
            repeat: false,
            onLoaded: (composition) {
              Future.delayed(composition.duration, () {
                context.pushNamed(AppRoutes.onboardingScreen.name);
              });
            },
          ),
        ],
      ),
    );
  }
}
