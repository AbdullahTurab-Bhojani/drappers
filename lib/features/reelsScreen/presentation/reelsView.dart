// ignore_for_file: file_names, unused_field

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart';
import '../../../core/extensions/theme_extension.dart';
import '../../../core/theme/app_scalar.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';
import '../../../shared/widgets/guestloginwidget.dart';

class ReelsviewScreen extends StatefulWidget {
  final bool showSaveIcon;

  const ReelsviewScreen({super.key, this.showSaveIcon = false});
  @override
  State<ReelsviewScreen> createState() => _ReelsviewScreenState();
}

class _ReelsviewScreenState extends State<ReelsviewScreen> {
  final List<String> _videoPaths = [
    'assets/images/video8.mp4',
    'assets/images/video8.mp4',
    'assets/images/video8.mp4',
    'assets/images/video8.mp4',
    'assets/images/video8.mp4',
  ];

  late final PageController _pageController;
  late final List<VideoPlayerController> _videoControllers;

  late final List<bool> _isLiked;
  late final List<int> _likeCounts;
  late final List<bool> _isSaved;
  late final List<bool> _expanded;

  final List<String> _titles = [
    'Rio de Janeiro – Meet the Drapers Season 6 (2023)',
    'Startup Spotlight — Episode 2',
    'Behind the Scenes — Drapers Live',
    'Behind the Scenes — Drapers Live',
    'Behind the Scenes — Drapers Live',
    'Rio de Janeiro – Meet the Drapers Season 6 (2023)',
  ];

  final List<String> _descriptions = [
    'Welcome to ‘Meet the Drapers’ at Websummit Rio de Janeiro! Tim Draper, with judges Luis Justo and Cris Arcangeli, assess startups Renova, Voxcell Bio, Instor Robotics, and Aprix. Which Rio startup advances to the semi-finals?',
    'Quick highlight of our latest startup pitch — watch till the end!',
    'Short Behind-the-Scenes from our last founder meetup — raw and real.',
    'Short Behind-the-Scenes from our last founder meetup — raw and real.',
    'Short Behind-the-Scenes from our last founder meetup — raw and real.',
    'Quick highlight of our latest startup pitch — watch till the end!',
  ];

  final List<String> _dates = [
    '12 July 2025',
    '10 July 2025',
    '08 July 2025',
    '08 July 2025',
    '08 July 2025',
    '12 July 2025',
  ];

  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();

    _isLiked = List.generate(_videoPaths.length, (_) => false);
    _likeCounts = List.generate(_videoPaths.length, (_) => 0);
    _isSaved = List.generate(_videoPaths.length, (_) => false);
    _expanded = List.generate(_videoPaths.length, (_) => false);

    _videoControllers = _videoPaths
        .map((path) => VideoPlayerController.asset(path))
        .toList();

    for (int i = 0; i < _videoControllers.length; i++) {
      final c = _videoControllers[i];
      c.setLooping(true);
      c.initialize().then((_) {
        if (i == 0) c.play();
        if (mounted) setState(() {});
      });
    }
  }

  @override
  void dispose() {
    for (var c in _videoControllers) {
      c.dispose();
    }
    _pageController.dispose();
    super.dispose();
  }

  void _playOnlyAt(int index) {
    for (int i = 0; i < _videoControllers.length; i++) {
      if (_videoControllers[i].value.isInitialized) {
        i == index ? _videoControllers[i].play() : _videoControllers[i].pause();
      }
    }
    setState(() => _currentPage = index);
  }

  Widget _popupRow({
    String? routePath,
    required String imagePath,
    required String title,
    required AppCustomColors customColors,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.of(context).pop();
        if (routePath != null) {
          context.pushNamed(routePath);
        }
      },
      child: Row(
        children: [
          Image.asset(
            imagePath,
            width: AppScaler.scaleSize(context, 22),
            height: AppScaler.scaleHeight(context, 22),
          ),
          SizedBox(width: AppScaler.scaleSize(context, 20)),
          PoppinsText(
            context,
            title,
            fontSize: PoppinsFontSizeVariant.size12,
            color: customColors.textColor,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<AppCustomColors>()!;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        bottom: true,
        top: false,
        left: false,
        right: false,
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.vertical,
              itemCount: _videoControllers.length,
              onPageChanged: (index) {
                _playOnlyAt(index);
              },
              itemBuilder: (context, index) {
                final controller = _videoControllers[index];

                return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    if (!controller.value.isInitialized) return;
                    controller.value.isPlaying
                        ? controller.pause()
                        : controller.play();
                    setState(() {});
                  },
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: controller.value.isInitialized
                            ? FittedBox(
                                fit: BoxFit.cover,
                                child: SizedBox(
                                  width: controller.value.size.width,
                                  height: controller.value.size.height,
                                  child: VideoPlayer(controller),
                                ),
                              )
                            : Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.white,
                                ),
                              ),
                      ),

                      if (controller.value.isInitialized &&
                          !controller.value.isPlaying)
                        Center(
                          child: Icon(
                            Icons.play_arrow,
                            size: 70,
                            color: Colors.white70,
                          ),
                        ),

                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: AppScaler.scaleHeight(context, 260),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  Colors.black87,
                                  Colors.black,
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                        ),
                      ),

                      Positioned(
                        left: AppScaler.scaleSize(context, 20),
                        right: AppScaler.scaleSize(context, 20),
                        bottom: AppScaler.scaleHeight(context, 95),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PoppinsText(
                              context,
                              _titles[index],
                              fontSize: PoppinsFontSizeVariant.size18,
                              fontWeight: PoppinsFontWeightVariant.medium,
                              color: customColors.textColor,
                            ),
                            SizedBox(height: AppScaler.scaleHeight(context, 4)),
                            PoppinsText(
                              context,
                              "${_dates[index]} • 2.2k views",
                              fontSize: PoppinsFontSizeVariant.size14,
                              color: Colors.white70,
                            ),
                            SizedBox(height: AppScaler.scaleHeight(context, 8)),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                PoppinsText(
                                  context,
                                  _descriptions[index],
                                  fontSize: PoppinsFontSizeVariant.size14,
                                  color: customColors.textColor,
                                  maxLines: _expanded[index] ? 20 : 3,
                                  textOverflow: TextOverflow.ellipsis,
                                ),
                                GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () {
                                    setState(() {
                                      _expanded[index] = !_expanded[index];
                                    });
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top: AppScaler.scaleHeight(context, 4),
                                    ),
                                    child: PoppinsText(
                                      context,
                                      _expanded[index]
                                          ? "Read Less"
                                          : "Read More",
                                      color: customColors.textColor,
                                      fontSize: PoppinsFontSizeVariant.size13,
                                      fontWeight:
                                          PoppinsFontWeightVariant.semiBold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      Positioned(
                        left: AppScaler.scaleSize(context, 20),
                        right: AppScaler.scaleSize(context, 20),
                        bottom: AppScaler.scaleHeight(context, 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () {
                                    if (GuestHelper.isGuest) {
                                      GuestHelper.checkGuest(context);
                                      return;
                                    }
                                    setState(() {
                                      _isLiked[index] = !_isLiked[index];
                                      _likeCounts[index] += _isLiked[index]
                                          ? 1
                                          : -1;
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        _isLiked[index]
                                            ? Assets.images.like.path
                                            : Assets.images.likeicon.path,
                                        width: AppScaler.scaleSize(context, 26),
                                        height: AppScaler.scaleHeight(
                                          context,
                                          26,
                                        ),
                                        color: _isLiked[index]
                                            ? customColors.buttonColors[0]
                                            : null,
                                      ),
                                      SizedBox(width: 8),
                                      PoppinsText(
                                        context,
                                        "${_likeCounts[index]}",
                                        fontSize: PoppinsFontSizeVariant.size14,
                                        color: AppColors.white,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 22),

                                GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () {
                                    if (GuestHelper.isGuest) {
                                      GuestHelper.checkGuest(context);
                                      return;
                                    }
                                  },
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/shareiconnew.png",
                                        width: AppScaler.scaleSize(context, 24),
                                        height: AppScaler.scaleHeight(
                                          context,
                                          24,
                                        ),
                                        color: customColors.textColor,
                                      ),
                                      SizedBox(
                                        width: AppScaler.scaleSize(context, 8),
                                      ),
                                      PoppinsText(
                                        context,
                                        "Share",
                                        fontSize: PoppinsFontSizeVariant.size14,
                                        color: customColors.textColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            AppButton(
                              buttonSize: Size(0, 0),
                              onPressed: () {
                                if (GuestHelper.isGuest) {
                                  GuestHelper.checkGuest(context);
                                  return;
                                }
                                setState(() {
                                  _isSaved[index] = !_isSaved[index];
                                });
                              },
                              title: _isSaved[index] ? " Saved" : " Save",
                              color: Colors.transparent,
                              prefixIcon: _isSaved[index]
                                  ? Icon(
                                      Icons.check,
                                      size: 17,
                                      color: customColors.textColor,
                                    )
                                  : Image.asset(
                                      Assets.images.addicon.path,
                                      width: AppScaler.scaleSize(context, 15),
                                    ),
                              fontSize: PoppinsFontSizeVariant.size14,
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(
                          top: AppScaler.scaleHeight(context, 60),
                          left: AppScaler.scaleSize(context, 20),
                          right: AppScaler.scaleSize(context, 20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                _videoControllers[index].pause();
                                Navigator.pop(context);
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.black54,
                                radius: AppScaler.scaleFont(context, 20),
                                child: Icon(
                                  Icons.arrow_back_ios_new,
                                  size: AppScaler.scaleFont(context, 20),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                showDialog(
                                  context: context,
                                  barrierColor: Colors.transparent,
                                  builder: (context) {
                                    return Align(
                                      alignment: Alignment.topRight,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          top: AppScaler.scaleHeight(
                                            context,
                                            30,
                                          ),
                                          right: AppScaler.scaleSize(
                                            context,
                                            10,
                                          ),
                                        ),
                                        child: Material(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          color: customColors.regular,
                                          child: SizedBox(
                                            width: AppScaler.scaleSize(
                                              context,
                                              174,
                                            ),
                                            height: AppScaler.scaleHeight(
                                              context,
                                              142,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: AppScaler.scaleSize(
                                                  context,
                                                  12,
                                                ),
                                                vertical: AppScaler.scaleHeight(
                                                  context,
                                                  16,
                                                ),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  _popupRow(
                                                    routePath: AppRoutes
                                                        .reportContent
                                                        .name,
                                                    imagePath: Assets
                                                        .images
                                                        .reporticon
                                                        .path,
                                                    title: "Report",
                                                    customColors: customColors,
                                                  ),
                                                  _popupRow(
                                                    imagePath: Assets
                                                        .images
                                                        .interestedicon
                                                        .path,
                                                    title: "Interested",
                                                    customColors: customColors,
                                                  ),
                                                  _popupRow(
                                                    imagePath: Assets
                                                        .images
                                                        .notinterestedicon
                                                        .path,
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
                                width: AppScaler.scaleSize(context, 24),
                                height: AppScaler.scaleHeight(context, 24),
                                color: customColors.textColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
