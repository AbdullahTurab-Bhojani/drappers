import 'package:flutter/material.dart';
import '../../../core/theme/app_scalar.dart';
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

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.images.screensbg.path),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppMainBar(
          leading: GestureDetector(
            behavior: HitTestBehavior.opaque,

            onTap: () {
              Navigator.of(context).pop();
            },
            child: Padding(
              padding: EdgeInsets.only(left: AppScaler.scaleSize(context, 20)),
              child: Image.asset(
                "assets/images/backicon.png",
                width: AppScaler.scaleSize(context, 20),
                height: AppScaler.scaleHeight(context, 20),
              ),
            ),
          ),
          title: "Saved Reels",
          centerTitle: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [],
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppScaler.scaleSize(context, 20),
                  vertical: AppScaler.scaleHeight(context, 10),
                ),
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: reelimages.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: AppScaler.scaleHeight(context, 10),
                    crossAxisSpacing: AppScaler.scaleSize(context, 10),
                    childAspectRatio: 0.5,
                  ),
                  itemBuilder: (context, index) {
                    return ReelcardWidget(
                      assetImagePath: reelimages[index],
                      title: reelTitles[index],
                      reelCardHeight: AppScaler.scaleHeight(context, 358),
                      reelCardWidth: AppScaler.scaleSize(context, 195),
                      fontSizeVariant: PoppinsFontSizeVariant.size14,
                      showSaveIcon: true,
                    );
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
