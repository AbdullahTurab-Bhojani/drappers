import 'package:flutter/material.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../shared/widgets/app_bar/main_app_bar.dart';
import '../../../shared/widgets/watchlistitemtile.dart';

class WatchlistData {
  final String thumbnailPath;
  final String title;
  final String year;

  WatchlistData(this.thumbnailPath, this.title, this.year);
}

final List<WatchlistData> dummyWatchlist = [
  WatchlistData(
    Assets.images.horizontalThumbnail.path,
    'Finale – Meet The Drapers Season 07',
    '2025',
  ),
  WatchlistData(
    Assets.images.horizontalThumbnail2.path,
    'Semifinals 2 – Meet The Drapers Season 6',
    '2024',
  ),
  WatchlistData(
    Assets.images.horizontalThumbnail3.path,
    'Semifinals 1 – Meet The Drapers Season 6',
    '2023',
  ),
  WatchlistData(
    Assets.images.horizontalThumbnail4.path,
    'Sri Sri University – Meet The Drapers Season 6',
    '2023',
  ),
];

class WatchlistScreen extends StatelessWidget {
  const WatchlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(Assets.images.screensbg.path, fit: BoxFit.cover),
          ),

          Column(
            children: [
              AppMainBar(
                leadingText: "Watchlist",
                width: 150,
                title: "",
                centerTitle: false,
                backgroundColor: Colors.transparent,
                elevation: 0,
                // actions: [
                //   PoppinsText(
                //     "Edit",
                //     fontSize: PoppinsFontSizeVariant.size14,
                //     fontWeight: PoppinsFontWeightVariant.medium,
                //     color: customColors.textColor,
                //   ),
                //   SizedBox(width: 10),
                // ],
              ),

              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: dummyWatchlist.length,
                  itemBuilder: (context, index) {
                    final item = dummyWatchlist[index];
                    return WatchlistItemTile(
                      thumbnailPath: item.thumbnailPath,
                      title: item.title,
                      year: item.year,
                      onTapPlay: () {},
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
