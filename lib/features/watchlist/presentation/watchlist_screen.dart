// ignore_for_file: deprecated_member_use

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

final List<WatchlistData> dummyWatchlist = [
  WatchlistData(
    Assets.images.watchlistcard1.path,
    'Finale – Meet The Drapers Season 07',
    '2025',
  ),
  WatchlistData(
    Assets.images.watchlistcard2.path,
    'Semifinals 2 – Meet The Drapers Season 6',
    '2024',
  ),
  WatchlistData(
    Assets.images.watchlistcard3.path,
    'Semifinals 1 – Meet The Drapers Season 6',
    '2023',
  ),
  WatchlistData(
    Assets.images.watchlistcard4.path,
    'Sri Sri University – Meet The Drapers Season 6',
    '2023',
  ),
];

class WatchlistScreen extends StatelessWidget {
  const WatchlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.images.screensbg.path),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              AppMainBar(
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

              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 15);
                  },
                  padding: EdgeInsets.zero,
                  itemCount: dummyWatchlist.length,
                  itemBuilder: (context, index) {
                    final item = dummyWatchlist[index];
                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,

                      onTap: () {
                        context.pushNamed(AppRoutes.contentDetail.name);
                      },
                      child: WatchlistItemTile(
                        thumbnailPath: item.thumbnailPath,
                        title: item.title,
                        year: item.year,
                        onTapPlay: () {},
                      ),
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
