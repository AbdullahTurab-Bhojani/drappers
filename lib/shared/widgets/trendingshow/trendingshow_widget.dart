import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_scalar.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';
import '../app_bar/main_app_bar.dart';
import '../guestloginwidget.dart';
import '../trending_grid.dart';

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
            onTap: () => context.pop(),
            child: Padding(
              padding: EdgeInsets.only(left: AppScaler.scaleSize(context, 10)),
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
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: AppScaler.scaleSize(context, 12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppScaler.scaleHeight(context, 20)),

              TrendingGrid(title: "", images: images),

              SizedBox(height: AppScaler.scaleHeight(context, 20)),

              TrendingGrid(title: "More like this", images: images),

              SizedBox(height: AppScaler.scaleHeight(context, 10)),
            ],
          ),
        ),
      ),
    );
  }
}
