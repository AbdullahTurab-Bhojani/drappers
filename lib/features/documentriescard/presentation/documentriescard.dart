import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_scalar.dart';
import '../../../gen/assets.gen.dart';
import '../../../shared/widgets/app_bar/main_app_bar.dart';
import '../../../shared/widgets/guestloginwidget.dart';
import '../../../shared/widgets/trending_grid.dart';

class Documentriescard extends StatefulWidget {
  const Documentriescard({super.key});

  @override
  State<Documentriescard> createState() => _DocumentriescardState();
}

class _DocumentriescardState extends State<Documentriescard> {
  @override
  Widget build(BuildContext context) {
    List<String> documentries = [
      Assets.images.documentriesimage1.path,
      Assets.images.documentriesimage2.path,
      Assets.images.documentriesimage3.path,
      Assets.images.documentriesimage4.path,
      Assets.images.documentriesimage5.path,
      Assets.images.documentriesimage6.path,
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
          title: "Documentries",
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
        body: SizedBox(
          height: double.infinity,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: AppScaler.scaleSize(context, 12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: AppScaler.scaleHeight(context, 20)),

                TrendingGrid(title: "", images: documentries),

                SizedBox(height: AppScaler.scaleHeight(context, 20)),

                TrendingGrid(title: "More like this", images: documentries),

                SizedBox(height: AppScaler.scaleHeight(context, 30)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
