import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_scalar.dart';
import '../../../gen/assets.gen.dart';
import '../app_bar/main_app_bar.dart';
import '../guestloginwidget.dart';
import '../trending_grid.dart';

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

    AppScaler.scaleSize(context, 10);
    AppScaler.scaleHeight(context, 10);

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
              context.pop();
            },
            child: Padding(
              padding: EdgeInsets.only(left: AppScaler.scaleSize(context, 10)),
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
              padding: EdgeInsets.only(right: AppScaler.scaleSize(context, 16)),
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
        body: Column(
          children: [
            SizedBox(height: AppScaler.scaleHeight(context, 12)),

            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: AppScaler.scaleSize(context, 12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TrendingGrid(title: "", images: podcastimages),
                    SizedBox(height: AppScaler.scaleHeight(context, 20)),

                    TrendingGrid(
                      title: "More like this",
                      images: podcastimages,
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
