// ignore_for_file: file_names, deprecated_member_use

import 'package:flutter/material.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../shared/widgets/app_bar/main_app_bar.dart';
import '../../../core/theme/app_scalar.dart';
import '../../../shared/widgets/documentries_header.dart';
import '../../../shared/widgets/podcast_header.dart';
import '../../../shared/widgets/reels_header.dart';
import '../../../shared/widgets/trendingshows_header.dart';

class LivepitchesScreen extends StatefulWidget {
  const LivepitchesScreen({super.key});

  @override
  State<LivepitchesScreen> createState() => _LivepitchesScreenState();
}

class _LivepitchesScreenState extends State<LivepitchesScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
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
            onTap: () => Navigator.of(context).pop(),
            child: Image.asset(
              "assets/images/backicon.png",
              width: AppScaler.scaleSize(context, 20),
              height: AppScaler.scaleHeight(context, 20),
            ),
          ),
          title: "Live Pitches",
          centerTitle: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppScaler.scaleSize(context, 20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: AppScaler.scaleHeight(context, 20)),

                TrendingshowsHeader(
                  showLiveTvBadge: false,
                  showMoreInfo: false,
                ),

                SizedBox(height: AppScaler.scaleHeight(context, 30)),
                PodcastHeader(),
                SizedBox(height: AppScaler.scaleHeight(context, 30)),
                ReelsHeader(),
                SizedBox(height: AppScaler.scaleHeight(context, 30)),
                DocumentriesHeader(),
                SizedBox(height: AppScaler.scaleHeight(context, 40)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
