import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/extensions/theme_extension.dart';
import '../../../core/theme/app_scalar.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';
import '../app_bar/main_app_bar.dart';
import '../guestloginwidget.dart';
import '../popupmenuitem/popupmenu_widget.dart';

class PodcastWidget extends StatefulWidget {
  const PodcastWidget({super.key});

  @override
  State<PodcastWidget> createState() => _PodcastWidgetState();
}

class _PodcastWidgetState extends State<PodcastWidget> {
  @override
  Widget build(BuildContext context) {
    List<String> podcastimages = [
      Assets.images.podcastimage1.path,
      Assets.images.podcastimage2.path,
      Assets.images.podcastimage3.path,
      Assets.images.podcastimage4.path,
      Assets.images.podcastimage5.path,
    ];

    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;
    final screenWidth = MediaQuery.of(context).size.width;

    final crossAxisCount = 3;
    final horizontalPadding = AppScaler.scaleSize(context, 12) * 2;
    final crossAxisSpacing = AppScaler.scaleSize(context, 10);
    final mainAxisSpacing = AppScaler.scaleHeight(context, 10);
    final cardWidth =
        (screenWidth -
            horizontalPadding -
            crossAxisSpacing * (crossAxisCount - 1)) /
        crossAxisCount;
    final cardHeight = AppScaler.scaleHeight(context, 200);
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
              title: "Podcasts",
              centerTitle: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: [
                Padding(
                  padding: EdgeInsets.only(
                    right: AppScaler.scaleSize(context, 16),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      if (GuestHelper.isGuest) {
                        GuestHelper.checkGuest(context);
                        return;
                      }
                      context.pushNamed('searchscreen');
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
            SizedBox(height: AppScaler.scaleHeight(context, 12)),

            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: AppScaler.scaleSize(context, 12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GridView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: podcastimages.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: crossAxisSpacing,
                        mainAxisSpacing: mainAxisSpacing,
                        childAspectRatio: childAspectRatio,
                      ),
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                context.pushNamed(AppRoutes.contentDetail.name);
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  AppScaler.scaleSize(context, 12),
                                ),
                                child: Image.asset(
                                  podcastimages[index],
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              ),
                            ),
                            Positioned(
                              top: AppScaler.scaleHeight(context, 4),
                              right: AppScaler.scaleSize(context, 4),
                              child: PopupmenuWidget(showSaveIcon: false),
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(height: AppScaler.scaleHeight(context, 20)),

                    PoppinsText(
                      context,
                      "More like this",
                      fontSize: PoppinsFontSizeVariant.size15,
                      fontWeight: PoppinsFontWeightVariant.medium,
                      color: customColors.textColor,
                    ),
                    SizedBox(height: AppScaler.scaleHeight(context, 20)),

                    GridView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: podcastimages.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: crossAxisSpacing,
                        mainAxisSpacing: mainAxisSpacing,
                        childAspectRatio: childAspectRatio,
                      ),
                      itemBuilder: (context, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(
                            AppScaler.scaleSize(context, 12),
                          ),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.asset(
                                podcastimages[index],
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                top: AppScaler.scaleHeight(context, 4),
                                right: AppScaler.scaleSize(context, 4),
                                child: PopupmenuWidget(showSaveIcon: false),
                              ),
                            ],
                          ),
                        );
                      },
                    ),

                    SizedBox(height: AppScaler.scaleHeight(context, 20)),
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
