import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_scalar.dart';
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

    final screenWidth = MediaQuery.of(context).size.width;

    const crossAxisCount = 3;

    final horizontalPadding = AppScaler.scaleSize(context, 12) * 2;
    final crossAxisSpacing = AppScaler.scaleSize(context, 10);
    final mainAxisSpacing = AppScaler.scaleHeight(context, 10);

    final itemWidth =
        (screenWidth -
            horizontalPadding -
            (crossAxisSpacing * (crossAxisCount - 1))) /
        crossAxisCount;

    final itemHeight = AppScaler.scaleHeight(context, 200);

    final childAspectRatio = itemWidth / itemHeight;

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
                onTap: () => context.pop(),
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
                    width: AppScaler.scaleSize(context, 20),
                    height: AppScaler.scaleHeight(context, 20),
                  ),
                ),
                SizedBox(width: AppScaler.scaleSize(context, 20)),
              ],
            ),

            SizedBox(height: AppScaler.scaleHeight(context, 20)),

            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: AppScaler.scaleSize(context, 12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: images.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: crossAxisSpacing,
                        mainAxisSpacing: mainAxisSpacing,
                        childAspectRatio: childAspectRatio,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            context.pushNamed(AppRoutes.contentDetail.name);
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              AppScaler.scaleSize(context, 12),
                            ),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.asset(images[index], fit: BoxFit.cover),
                                Positioned(
                                  top: AppScaler.scaleHeight(context, 6),
                                  right: AppScaler.scaleSize(context, 6),
                                  child: PopupmenuWidget(showSaveIcon: false),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),

                    SizedBox(height: AppScaler.scaleHeight(context, 20)),

                    PoppinsText(
                      context,
                      "More like this",
                      fontSize: PoppinsFontSizeVariant.size16,
                      fontWeight: PoppinsFontWeightVariant.medium,
                    ),

                    SizedBox(height: AppScaler.scaleHeight(context, 20)),

                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: images.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: crossAxisSpacing,
                        mainAxisSpacing: mainAxisSpacing,
                        childAspectRatio: childAspectRatio,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            context.pushNamed(AppRoutes.contentDetail.name);
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              AppScaler.scaleSize(context, 12),
                            ),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.asset(images[index], fit: BoxFit.cover),
                                Positioned(
                                  top: AppScaler.scaleHeight(context, 6),
                                  right: AppScaler.scaleSize(context, 6),
                                  child: PopupmenuWidget(showSaveIcon: false),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),

                    SizedBox(height: AppScaler.scaleHeight(context, 10)),
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
