import 'package:flutter/material.dart';

import '../../../core/extensions/theme_extension.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';
import '../../../shared/widgets/app_bar/main_app_bar.dart';
import '../../../shared/widgets/reelcard/reelcard_widget.dart';

class Savedreel extends StatefulWidget {
  
  const Savedreel({super.key});

  @override
  State<Savedreel> createState() => _SavedreelState();
}

class _SavedreelState extends State<Savedreel> {
  @override
  Widget build(BuildContext context) {
  List<String> reelimages = [
  Assets.images.reelimage1.path,
  Assets.images.reelimage2.path,
  Assets.images.reelimage3.path,
  Assets.images.reelimage4.path,
  Assets.images.reelimage5.path,
];
List<String> reelTitles = [
  'Rio De Janeiro - Meet The Drappers',
  'Brand Acceleration - Meet The Drappers',
  'Season 5, India - Meet The Drappers',
  'The Frontier - Meet The Drappers',
  'Season 6, Saudi Arabia - Meet The Drappers',
];

    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;
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
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Image.asset(
                    "assets/images/backicon.png",
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
              title: "Saved Reels",
              centerTitle: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Image.asset(
                    "assets/images/Searchicon.png",
                    width: 20,
                    height: 20,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 24),
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: reelimages.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.5,
                  ),
                  itemBuilder: (context, index) {
                    return ReelcardWidget(backgroundImage: reelimages[index], title: reelTitles[index],);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
