import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../shared/widgets/app_bar/main_app_bar.dart';
import '../../../core/extensions/theme_extension.dart';
import '../../../drappers.dart';
import '../../../shared/widgets/editwatchlisttitle.dart';
import '../../../shared/widgets/popupmenuitem/remove_popup.dart';

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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;
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
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,

                    onTap: () => context.pop(),
                    child: PoppinsText(
                      context,
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
            child: selectedCount > 0
                ? Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,

                      child: AppButton(
                        buttonSize: Size(400, 40),
                        color: customColors.redshade,
                        buttonGradient: [
                          customColors.redshade,
                          customColors.redshade,
                        ],
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => Dialog(
                              backgroundColor: Colors.transparent,
                              child: RemovePopup(),
                            ),
                          );
                        },
                        title: "Remove",
                      ),
                    ),
                  )
                : SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
