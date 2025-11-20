import 'package:flutter/material.dart';

import '../../../../../core/extensions/theme_extension.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../shared/widgets/app_bar/main_app_bar.dart';

class FaqsScreen extends StatefulWidget {
  FaqsScreen({super.key});

  @override
  State<FaqsScreen> createState() => _FaqsScreenState();
}

class _FaqsScreenState extends State<FaqsScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;
    final Color contentBackgroundColor =
        customColors.regular ?? Color(0xFF2C2F4D);
    final double paddingValue = 20.0;

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppMainBar(
              leadingIcon: Icons.arrow_back_ios,
              title: "Privacy Policy",
              centerTitle: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),

            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: customColors.regular,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: Column(children: [
                    
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
