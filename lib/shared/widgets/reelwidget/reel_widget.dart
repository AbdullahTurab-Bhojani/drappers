import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_scalar.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';
import '../app_bar/main_app_bar.dart';
import '../guestloginwidget.dart';
import '../reelcard/reelcard_widget.dart';

class ReelWidget extends StatefulWidget {
  const ReelWidget({super.key});

  @override
  State<ReelWidget> createState() => _ReelWidgetState();
}

class _ReelWidgetState extends State<ReelWidget> {
  @override
  Widget build(BuildContext context) {
    List<String> reelimages = [
      Assets.images.reel1.path,
      Assets.images.reel2.path,
      Assets.images.reel3.path,
      Assets.images.reel4.path,
      Assets.images.reel5.path,
    ];
    List<String> reelTitles = [
      'Rio De Janeiro - Meet The Drappers',
      'Brand Acceleration - Meet The Drappers',
      'Season 5, India - Meet The Drappers',
      'The Frontier - Meet The Drappers',
      'Season 6, Saudi Arabia - Meet The Drappers',
    ];

    final screenWidth = MediaQuery.of(context).size.width;

    final crossAxisCount = 2;
    final crossAxisSpacing = AppScaler.scaleSize(context, 10);
    final mainAxisSpacing = AppScaler.scaleHeight(context, 10);
    final horizontalPadding = AppScaler.scaleSize(context, 20) * 2;
    final cardWidth =
        (screenWidth - horizontalPadding - crossAxisSpacing) / crossAxisCount;
    final cardHeight = AppScaler.scaleHeight(context, 350);
    final childAspectRatio = cardWidth / cardHeight;

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
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  context.pop();
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    left: AppScaler.scaleSize(context, 10),
                  ),
                  child: Image.asset(
                    Assets.images.backicon.path,
                    width: AppScaler.scaleSize(context, 20),
                    height: AppScaler.scaleHeight(context, 20),
                  ),
                ),
              ),
              title: "Reels",
              centerTitle: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: [
                Padding(
                  padding: EdgeInsets.only(
                    right: AppScaler.scaleSize(context, 16),
                  ),
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      if (GuestHelper.isGuest) {
                        GuestHelper.checkGuest(context);
                        return;
                      }
                      context.pushNamed(AppRoutes.searchscreen.name);
                    },
                    child: Image.asset(
                      Assets.images.searchstokeicon.path,
                      width: AppScaler.scaleSize(context, 20),
                      height: AppScaler.scaleHeight(context, 20),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppScaler.scaleSize(context, 20),
                  vertical: AppScaler.scaleHeight(context, 20),
                ),
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: reelimages.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    mainAxisSpacing: mainAxisSpacing,
                    crossAxisSpacing: crossAxisSpacing,
                    childAspectRatio: childAspectRatio,
                  ),
                  itemBuilder: (context, index) {
                    return ReelcardWidget(
                      assetImagePath: reelimages[index],
                      title: reelTitles[index],
                      reelCardHeight: cardHeight,
                      reelCardWidth: cardWidth,
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
