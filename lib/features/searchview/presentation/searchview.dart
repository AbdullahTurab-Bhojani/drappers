// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/extensions/theme_extension.dart';
import '../../../core/theme/app_scalar.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';
import '../../../shared/widgets/recentsearch_widget_header.dart';
import '../../../shared/widgets/searchhistory.dart';

class Searchview extends StatefulWidget {
  const Searchview({super.key});

  @override
  State<Searchview> createState() => SearchviewState();
}

class HistoryData {
  final String title;
  final String thumbnailPath;

  HistoryData(this.title, this.thumbnailPath);
}

final List<HistoryData> dummyHistory = [
  HistoryData(
    'Semifinals 1 – Meet The Drapers Season...',
    Assets.images.trendingimage1.path,
  ),
  HistoryData(
    'Rio de Janeiro – Meet the Drapers Season...',
    Assets.images.trendingimage2.path,
  ),
  HistoryData(
    'Paris – Meet The Drapers Season 6 (2...',
    Assets.images.trendingimage3.path,
  ),
];

class SearchviewState extends State<Searchview> {
  TextEditingController searchCtrl = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 300), () {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;

    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        image: DecorationImage(
          image: AssetImage(Assets.images.screensbg.path),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        // resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,

          title: Row(
            children: [
              Expanded(
                child: Container(
                  height: AppScaler.scaleHeight(context, 40),
                  decoration: BoxDecoration(
                    color: AppColors.color202020.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: AppScaler.scaleSize(context, 15)),
                      Image.asset(
                        "assets/images/searchicon3x.png",
                        width: AppScaler.scaleSize(context, 20),
                        height: AppScaler.scaleHeight(context, 20),
                      ),
                      SizedBox(width: AppScaler.scaleSize(context, 10)),
                      Expanded(
                        child: TextField(
                          focusNode: _focusNode,
                          controller: searchCtrl,
                          decoration: InputDecoration(
                            hintText: "Search content",
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                          ),
                          style: TextStyle(color: Colors.white, fontSize: 16),
                          cursorColor: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(width: AppScaler.scaleSize(context, 12)),

              GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: PoppinsText(
                  context,
                  "Cancel",
                  fontSize: PoppinsFontSizeVariant.size14,
                  fontWeight: PoppinsFontWeightVariant.medium,
                  color: customColors.textColor,
                ),
              ),
            ],
          ),

          centerTitle: false,
          titleSpacing: 16,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppScaler.scaleSize(context, 20),
              vertical: AppScaler.scaleHeight(context, 10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: AppScaler.scaleHeight(context, 185),
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: dummyHistory.length,
                    itemBuilder: (context, index) {
                      final item = dummyHistory[index];
                      return Searchhistory(
                        title: item.title,
                        thumbnailPath: item.thumbnailPath,
                        onTapRemove: () {},
                        onTapTile: () {},
                      );
                    },
                  ),
                ),
                RecentsearchWidgetHeader(),

                SizedBox(height: AppScaler.scaleHeight(context, 30)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
