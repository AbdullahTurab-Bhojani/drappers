import 'package:flutter/material.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../shared/widgets/app_bar/main_app_bar.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(Assets.images.screensbg.path, fit: BoxFit.cover),
          ),
          Column(
            children: [
              AppMainBar(
                leadingText: "Discover",
                width: 140,
                title: "",
                centerTitle: false,
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: [
                  Image.asset(
                    Assets.images.searchicon.path,
                    color: Colors.white,
                  ),

                  SizedBox(width: 10),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
