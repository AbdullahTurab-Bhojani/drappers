// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../shared/widgets/app_bar/main_app_bar.dart';
import '../../../core/extensions/theme_extension.dart';
import '../../../core/theme/app_scalar.dart';
import '../../../drappers.dart';
import '../../../shared/widgets/watchlistitemtile.dart';
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

class WatchlistScreen extends StatefulWidget {
  const WatchlistScreen({super.key});

  @override
  State<WatchlistScreen> createState() => _WatchlistScreenState();
}

class _WatchlistScreenState extends State<WatchlistScreen> {
  bool isEditMode = false;

  List<WatchlistData> menuList = [
    WatchlistData(
      'https://assets.myco.io/public/20250418/myplay-Thumbnail-Abu-Dhabi-2-1744984205453.jpg',
      'Finale – Meet The Drapers Season 07',
      '2025',
    ),
    WatchlistData(
      'https://assets.myco.io/public/compressed/thumbnails/20250221/myplay-Thumbnail-Abu-Dhabi-Ep7-1740138441423.webp',
      'Semifinals 2 – Meet The Drapers Season 6',
      '2024',
    ),
    WatchlistData(
      'https://assets.myco.io/public/compressed/thumbnails/20250307/myplay-Thumbnail-Abu-Dhabi-1741342634493.webp',
      'Semifinals 1 – Meet The Drapers Season 6',
      '2023',
    ),
    WatchlistData(
      'https://i.ytimg.com/vi/XXbrwwT0xwI/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLDBUef9cu2Ng3NcDJNxMKvs82z16w',
      'Sri Sri University – Meet The Drapers Season 6',
      '2023',
    ),
  ];

  int get selectedCount => menuList.where((item) => item.isSelected).length;

  void _toggleEditMode() {
    setState(() {
      isEditMode = !isEditMode;

      if (!isEditMode) {
        for (var item in menuList) {
          item.isSelected = false;
        }
      }
    });
  }

  void _toggleItem(int index, bool value) {
    setState(() {
      menuList[index].isSelected = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;

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
          leadingText: isEditMode ? "Edit Watchlist" : "Watchlist",
          width: MediaQuery.of(context).size.width * (isEditMode ? 0.4 : 0.3),
          title: "",
          centerTitle: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            GestureDetector(
              onTap: _toggleEditMode,
              child: PoppinsText(
                context,
                isEditMode ? "Cancel" : "Edit",
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
                itemCount: menuList.length,
                separatorBuilder: (_, _) => SizedBox(height: 15),
                itemBuilder: (context, index) {
                  final item = menuList[index];

                  return WatchlistItemTile(
                    thumbnailPath: item.thumbnailPath,
                    title: item.title,
                    year: item.year,
                    onTapPlay: () {
                      GoRouter.of(
                        context,
                      ).pushNamed(AppRoutes.contentDetail.name);
                    },
                    onToggle: (val) => _toggleItem(index, val),
                    isChecked: item.isSelected,
                    isEdit: isEditMode,
                  );
                },
              ),
            ),

            if (isEditMode && selectedCount > 0)
              Padding(
                padding: EdgeInsets.all(AppScaler.scaleSize(context, 20)),
                child: AppButton(
                  buttonSize: Size(double.infinity, 40),
                  color: customColors.redshade,
                  buttonGradient: [
                    customColors.redshade,
                    customColors.redshade,
                  ],
                  title: "Remove",
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => Dialog(
                        backgroundColor: Colors.transparent,
                        child: RemovePopup(),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
