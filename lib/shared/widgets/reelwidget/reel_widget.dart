import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
                  padding: EdgeInsets.only(left: 10),
                  child: Image.asset(
                    Assets.images.backicon.path,
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
              title: "Reels",
              centerTitle: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 16),
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
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: reelimages.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 195 / 380,
                  ),
                  itemBuilder: (context, index) {
                    return ReelcardWidget(
                      assetImagePath: reelimages[index],
                      title: reelTitles[index],
                      reelCardHeight: 350,
                      reelCardWidth: 195,
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
