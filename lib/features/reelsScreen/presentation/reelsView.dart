import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/extensions/theme_extension.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';
import '../../../shared/widgets/popupmenuitem/popupmenu_widget.dart';

class ReelsviewScreen extends StatefulWidget {
  final bool showSaveIcon;

  const ReelsviewScreen({super.key, this.showSaveIcon = false});
  @override
  State<ReelsviewScreen> createState() => _ReelsviewScreenState();
}

class _ReelsviewScreenState extends State<ReelsviewScreen> {
  final String _reelTitle = 'Rio de Janeiro – Meet the Drapers Season 6 (2023)';
  final String _reelDescription =
      'Welcome to ‘Meet the Drapers’ at Websummit Rio de Janeiro! Tim Draper, with judges Luis Justo and Cris Arcangeli, assess startups Renova, Voxcell Bio, Instor Robotics, and Aprix. Which Rio startup advances to the semi-finals? find out in this exciting episode!';
  final String _viewsCount = '2.2k views';
  final String _date = '12 July 2025';

  bool _isPlaying = true;

  // Removed the _buildActionButton helper method as requested

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // 1. Video Player Area (Placeholder, Full Screen)
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isPlaying = !_isPlaying;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                    image: AssetImage(Assets.images.reelimage2.path),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  // AnimatedOpacity(
                  //   opacity: _isPlaying ? 0.0 : 1.0,
                  //   duration: const Duration(milliseconds: 300),
                  //   child: const Icon(
                  //     Icons.play_arrow,
                  //     color: Colors.white,
                  //     size: 80,
                  //   ),
                  // ),
                ),
              ),
            ),
          ),

          // 2. Gradient Overlay
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 300,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.black87, Colors.black],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.0, 0.7, 1.0],
                  ),
                ),
              ),
            ),
          ),

          // 3. Metadata and Social Actions
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- Title and Metadata ---
                  PoppinsText(
                    _reelTitle,
                    fontSize: PoppinsFontSizeVariant.size18,
                    fontWeight: PoppinsFontWeightVariant.medium,
                    color: customColors.textColor,
                  ),
                  const SizedBox(height: 4),
                  PoppinsText(
                    '$_date • $_viewsCount',
                    fontSize: PoppinsFontSizeVariant.size14,
                    fontWeight: PoppinsFontWeightVariant.regular,
                    color: Colors.white70,
                  ),
                  const SizedBox(height: 8),
                  PoppinsText(
                    _reelDescription,
                    fontSize: PoppinsFontSizeVariant.size14,
                    fontWeight: PoppinsFontWeightVariant.regular,
                    color: customColors.textColor,
                    maxLines: 4,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/images/like.png",
                                    width: 24,
                                    height: 24,
                                    color: customColors.textColor,
                                  ),
                                  SizedBox(width: 10),
                                  PoppinsText(
                                    '12',
                                    fontSize: PoppinsFontSizeVariant.size14,
                                    fontWeight:
                                        PoppinsFontWeightVariant.regular,
                                    color: customColors.textColor,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 30),
                            GestureDetector(
                              onTap: () {},
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/images/shareiconnew.png",
                                    width: 24,
                                    height: 24,
                                    color: customColors.textColor,
                                  ),
                                  SizedBox(width: 10),
                                  PoppinsText(
                                    'Share',
                                    fontSize: PoppinsFontSizeVariant.size14,
                                    fontWeight:
                                        PoppinsFontWeightVariant.regular,
                                    color: customColors.textColor,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        GestureDetector(
                          onTap: () {},
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/add.png",
                                width: 18,
                                height: 18,
                                color: customColors.textColor,
                              ),
                              SizedBox(width: 10),
                              PoppinsText(
                                'Save',
                                fontSize: PoppinsFontSizeVariant.size14,
                                fontWeight: PoppinsFontWeightVariant.regular,
                                color: customColors.textColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const CircleAvatar(
                    backgroundColor: Colors.black54,
                    radius: 20,
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      barrierColor: Colors.transparent,
                      builder: (context) {
                        return Align(
  alignment: Alignment.topRight,
  child: Padding(
    padding: const EdgeInsets.only(top: 20, right: 10),
    child: Material(
      elevation: 0,
      borderRadius: BorderRadius.circular(10),
      color: customColors.regular,
      child: SizedBox(
        width: 174,
        height: 142,
        child: Container(
          padding:  EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _popupRow(
                routePath: AppRoutes.reportContent.name,
                imagePath: Assets.images.reporticon.path,
                title: "Report",
                customColors: customColors,
              ),
              _popupRow(
                routePath: AppRoutes.reportContent.name,
                imagePath: Assets.images.interestedicon.path,
                title: "Interested",
                customColors: customColors,
              ),
              _popupRow(
                routePath: AppRoutes.reportContent.name,
                imagePath: Assets.images.notinterestedicon.path,
                title: "Not Interested",
                customColors: customColors,
              ),
            ],
          ),
        ),
      ),
    ),
  ),
);

                          
                      },
                    );
                  },
                  child: Image.asset(
                    "assets/images/3dotsicon.png",
                    height: 24,
                    width: 24,
                    color: customColors.textColor,
                  ),
                )
        ])
        )
        ]));
      
  }
  Widget _popupRow({
    required String routePath,
  required String imagePath,
  required String title,
  required AppCustomColors customColors,
}) {
  return GestureDetector(
    onTap: () {
       context.pushNamed(routePath);
    },
    child: Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          imagePath,
          width: 22,
          height: 22,
        ),
         SizedBox(width: 20),
        PoppinsText(
          title,
          fontSize: PoppinsFontSizeVariant.size12,
          fontWeight: PoppinsFontWeightVariant.medium,
          color: customColors.textColor,
        ),
      ],
    ),
  );
}
}


