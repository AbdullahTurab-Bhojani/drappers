// ignore_for_file: deprecated_member_use, unused_local_variable, unnecessary_underscores

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../shared/widgets/app_bar/main_app_bar.dart';
import '../../../core/extensions/theme_extension.dart';
import '../../../core/theme/app_scalar.dart';
import '../../../drappers.dart';
import '../../../shared/widgets/watchlistitemtile.dart';

class WatchlistData {
  final String thumbnailPath;
  final String title;
  final String year;

  WatchlistData(this.thumbnailPath, this.title, this.year);
}

class WatchlistScreen extends StatelessWidget {
  const WatchlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List menuList = [
      {
        'image': Assets.images.watchlistcard1.path,
        'title': 'Finale – Meet The Drapers Season 07',
        'year': '2025',
      },
      {
        'image': Assets.images.watchlistcard2.path,
        'title': 'Semifinals 2 – Meet The Drapers Season 6',
        'year': '2024',
      },
      {
        'image': Assets.images.watchlistcard3.path,
        'title': 'Semifinals 1 – Meet The Drapers Season 6',
        'year': '2023',
      },
      {
        'image': Assets.images.watchlistcard4.path,
        'title': 'Sri Sri University – Meet The Drapers Season 6',
        'year': '2023',
      },
    ];
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;
    bool canExit = false;
    return WillPopScope(
      onWillPop: () async {
        if (!canExit) {
          canExit = true;
          return false;
        }

        return true;
      },
      child: Container(
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
            leadingText: "Watchlist",
            width: AppScaler.scaleSize(context, 150),
            title: "",
            centerTitle: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,

                onTap: () {
                  context.pushNamed(AppRoutes.editWatchlistScreen.name);
                },
                child: PoppinsText(
                  context,
                  "Edit",
                  fontSize: PoppinsFontSizeVariant.size14,
                  fontWeight: PoppinsFontWeightVariant.medium,
                  color: customColors.textColor,
                ),
              ),
              SizedBox(width: AppScaler.scaleSize(context, 20)),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (_, __) => SizedBox(height: 15),
                  padding: EdgeInsets.zero,
                  itemCount: menuList.length,
                  itemBuilder: (context, index) {
                    final item = menuList[index];

                    return WatchlistItemTile(
                      thumbnailPath: item['image'],
                      title: item['title'],
                      year: item['year'],
                      onTapPlay: () {
                        context.pushNamed(AppRoutes.contentDetail.name);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
