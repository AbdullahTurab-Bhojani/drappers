import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../../../shared/widgets/app_bar/main_app_bar.dart';

class ApplyPitch extends StatefulWidget {
  const ApplyPitch({super.key});

  @override
  State<ApplyPitch> createState() => _ApplyPitchState();
}

class _ApplyPitchState extends State<ApplyPitch> {
  @override
  Widget build(BuildContext context) {
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
                onTap: () => Navigator.of(context).pop(),
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Image.asset(
                    "assets/images/backicon.png",
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
              title: "Apply to Pitch",
              centerTitle: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          ],
        ),
      ),
    );
  }
}