import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';
import '../app_bar/main_app_bar.dart';
import '../guestloginwidget.dart';
import '../popupmenuitem/popupmenu_widget.dart';

class TrendingshowWidget extends StatefulWidget {
  const TrendingshowWidget({super.key});

  @override
  State<TrendingshowWidget> createState() => _TrendingshowWidgetState();
}

class _TrendingshowWidgetState extends State<TrendingshowWidget> {
  @override
  Widget build(BuildContext context) {
    List<String> images = [
      Assets.images.trendingimage1.path,
      Assets.images.trendingimage2.path,
      Assets.images.trendingimage3.path,
      Assets.images.trendingimage4.path,
      Assets.images.trendingimage5.path,
      Assets.images.trendingimage6.path,
      Assets.images.trendingimage7.path,
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
              title: "Trending Shows",
              centerTitle: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: [
                GestureDetector(
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
                SizedBox(width: 20),
              ],
            ),
            SizedBox(height: 30),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GridView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.7,
                      ),
                      itemCount: images.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          behavior: HitTestBehavior.opaque,

                          onTap: () {
                            context.pushNamed(AppRoutes.contentDetail.name);
                          },
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  images[index],
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              ),
                              Positioned(
                                top: 8,
                                right: 8,
                                child: PopupmenuWidget(showSaveIcon: false),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    PoppinsText(
                      context,
                      "More like this",
                      fontSize: PoppinsFontSizeVariant.size16,
                      fontWeight: PoppinsFontWeightVariant.medium,
                    ),
                    SizedBox(height: 20),
                    GridView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.7,
                      ),
                      itemCount: images.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          behavior: HitTestBehavior.opaque,

                          onTap: () {
                            context.pushNamed(AppRoutes.contentDetail.name);
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.asset(images[index], fit: BoxFit.cover),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: PopupmenuWidget(showSaveIcon: false),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),

                    SizedBox(height: 10),
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
