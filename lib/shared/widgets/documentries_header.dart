// ignore_for_file: deprecated_member_use

import 'package:better_player_plus/better_player_plus.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/extensions/theme_extension.dart';
import '../../core/theme/app_scalar.dart';
import '../../drappers.dart';
import '../../gen/assets.gen.dart';
import 'documentries_card/documentries_card_widget.dart';

class DocumentriesHeader extends StatefulWidget {
  const DocumentriesHeader({super.key});

  @override
  State<DocumentriesHeader> createState() => _DocumentriesHeaderState();
}

List<String> documentriescard = [
  Assets.images.documentriesimage1.path,
  Assets.images.documentriesimage2.path,
  Assets.images.documentriesimage3.path,
  Assets.images.documentriesimage4.path,
  Assets.images.documentriesimage5.path,
  Assets.images.documentriesimage6.path,
];

class _DocumentriesHeaderState extends State<DocumentriesHeader> {
  BetterPlayerController? _betterPlayerController;
  BetterPlayerController? get controller => _betterPlayerController;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PoppinsText(
              context,
              'Documentaries',
              fontSize: PoppinsFontSizeVariant.size16,
              fontWeight: PoppinsFontWeightVariant.medium,
              color: customColors.textColor,
            ),
            AppButton(
              buttonSize: Size(80, 25),
              color: Colors.transparent,
              borderColor: customColors.textColor.withOpacity(0.5),
              borderWidth: 1,
              fontSize: PoppinsFontSizeVariant.size12,
              fontWeight: PoppinsFontWeightVariant.regular,
              border: true,
              onPressed: () {
                if (_betterPlayerController != null) {
                  _betterPlayerController!.pause();
                }
                context.pushNamed('documentries');
              },
              title: "View More",
            ),
          ],
        ),
        SizedBox(height: AppScaler.scaleHeight(context, 20)),
        SizedBox(
          height: AppScaler.scaleHeight(context, 180),
          child: ListView.separated(
            padding: EdgeInsets.zero,
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) =>
                SizedBox(width: AppScaler.scaleSize(context, 15)),
            itemCount: documentriescard.length,
            itemBuilder: (context, index) {
              return DocumentriesCardWidget(
                assetImage: documentriescard[index],
                showSaveIcon: false,
              );
            },
          ),
        ),
      ],
    );
  }
}
