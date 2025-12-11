import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../shared/widgets/app_bar/main_app_bar.dart';
import '../../../core/extensions/theme_extension.dart';
import '../../../drappers.dart';
import '../../../shared/widgets/editwatchlisttitle.dart';

class WatchlistData {
  final String thumbnailPath;
  final String title;
  final String year;
  bool isSelected; 

  WatchlistData(
    this.thumbnailPath,
    this.title,
    this.year, {
    this.isSelected = false,
  });
}

final List<WatchlistData> _dummyWatchlist = [
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

class EditWatchlistScreen extends StatefulWidget {
  const EditWatchlistScreen({super.key});

  @override
  State<EditWatchlistScreen> createState() => _EditWatchlistScreenState();
}

class _EditWatchlistScreenState extends State<EditWatchlistScreen> {
  final List<WatchlistData> watchlistItems = _dummyWatchlist;

  int get selectedCount =>
      watchlistItems.where((item) => item.isSelected).length;

  void _onItemToggle(int index, bool newValue) {
    setState(() {
      watchlistItems[index].isSelected = newValue;
    });
  }

  void _onDeleteSelected() {
    if (selectedCount == 0) return; 

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${selectedCount} items removed from watchlist.')),
    );

    setState(() {
      watchlistItems.removeWhere((item) => item.isSelected);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;

    final isRemoveEnabled = selectedCount > 0;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(Assets.images.screensbg.path, fit: BoxFit.cover),
          ),

          Column(
            children: [
              AppMainBar(
                leadingText: "Edit Watchlist",
                width: 200,
                title: "",
                centerTitle: false,
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: [
                  InkWell(
                    onTap: () => context.pop(), 
                    child: PoppinsText(
                      "Cancel",
                      fontSize: PoppinsFontSizeVariant.size14,
                      fontWeight: PoppinsFontWeightVariant.medium,
                      color: customColors.textColor,
                    ),
                  ),
                 SizedBox(width: 20),
                ],
              ),

              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.only(bottom: 100),
                  itemCount: watchlistItems.length,
                  itemBuilder: (context, index) {
                    final item = watchlistItems[index];

                    return EditWatchlistItemTile(
                      thumbnailPath: item.thumbnailPath,
                      title: item.title,
                      year: item.year,
                      isChecked: item.isSelected,
                      onToggle: (newValue) => _onItemToggle(index, newValue),
                    );
                  },
                ),
              ),
            ],
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: InkWell(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: customColors.redshade,
                  ),
                  child: Center(
                    child: PoppinsText(
                      'Remove',
                      fontSize: PoppinsFontSizeVariant.size14,
                      fontWeight: PoppinsFontWeightVariant.medium,
                      color: customColors.textColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
