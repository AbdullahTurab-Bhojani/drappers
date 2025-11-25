import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart';
import '../../../../core/extensions/theme_extension.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../drappers.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../shared/widgets/app_bar/main_app_bar.dart';
import '../../../../shared/widgets/cardwidget/card_widget.dart';
import '../../../../shared/widgets/podcardswidget/podcards_widget.dart';
import '../../../../shared/widgets/reelcard/reelcard_widget.dart';
import '../../../../shared/widgets/reels_widget.dart';
import '../../../shared/widgets/documentries_card/documentries_card_widget.dart';
import '../../../shared/widgets/genreboxwidget.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  VideoPlayerController? _controller;
  bool _showControls = true;
  final posterPath = '/mnt/data/Live Tv.png';

  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.network(
            'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
          )
          ..initialize().then((_) {
            setState(() {});
            _controller!.play();
          });

    // Keep controls visible when user interacts
    _controller!.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _controller!.removeListener(() {});
    _controller!.dispose();
    super.dispose();
  }

  String _format(Duration d) {
    String two(int n) => n.toString().padLeft(2, '0');
    final minutes = two(d.inMinutes.remainder(60));
    final seconds = two(d.inSeconds.remainder(60));
    final hours = d.inHours;
    return hours > 0 ? '$hours:$minutes:$seconds' : '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    List<String> reelimages = [
      Assets.images.reelimage1.path,
      Assets.images.reelimage2.path,
      Assets.images.reelimage3.path,
      Assets.images.reelimage4.path,
      Assets.images.reelimage5.path,
    ];
    List trendingimages = [
      Assets.images.trendingshowimage1.path,
      Assets.images.trendingshowimage2.path,
      Assets.images.trendingshowimage3.path,
      Assets.images.trendingshowimage4.path,
      Assets.images.trendingshowimage5.path,
      Assets.images.trendingshowimage6.path,
      Assets.images.trendingshowimage7.path,
    ];

    List<String> podcardimages = [
      Assets.images.podcastimage1.path,
      Assets.images.podcastimage2.path,
      Assets.images.podcastimage3.path,
      Assets.images.podcastimage4.path,
      Assets.images.podcastimage5.path,
    ];
    List<String> documentriescard = [
      Assets.images.documentaries1.path,
      Assets.images.documentaries2.path,
      Assets.images.documentaries3.path,
      Assets.images.documentaries4.path,
      Assets.images.documentaries5.path,
      Assets.images.documentaries6.path,
    ];
    List<String> reelTitles = [
      'Rio De Janeiro - Meet The Drappers',
      'Brand Acceleration - Meet The Drappers',
      'Season 5, India - Meet The Drappers',
      'The Frontier - Meet The Drappers',
      'Season 6, Saudi Arabia - Meet The Drappers',
    ];
    List<String> Genretitle = [
      'Shows',
      'Documentaries',
      'Podcasts',
      'Shows',
      'Reels',
    ];
    List images = [
      'https://source.boomplaymusic.com/buzzgroup2/M00/2E/F3/rBEe_GHV1vCACRvaAAJjfsEidFI769.png',
      'https://i.ytimg.com/vi/5HxoC-W_iq4/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLDGjYkZgzRShZtbRAcxcHteNwOuig',
      'https://resizing.flixster.com/kmvpUXbW_IqKOXauZ76IceSquTA=/fit-in/180x240/v2/https://resizing.flixster.com/2bkyVmLlw_8s0SzA8C1gaYNdoZY=/ems.cHJkLWVtcy1hc3NldHMvbW92aWVzLzJlNTkwNTIxLTM0YmYtNDgzNi1hZGFlLThjODM2ZTA5OTEzMi5qcGc=',
      'https://i0.wp.com/maactioncinema.com/wp-content/uploads/2024/01/MV5BOGU2NDNmY2UtZTJmZS00M2U4LTkyMGQtNjc5MmNiZTQ4YjA0XkEyXkFqcGdeQXVyNTk1ODQ5NDg%40._V1_-scaled.jpg?ssl=1',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHIybZ6umH09-6J4suX89s4BGUn-CSb_4j3A&s',
    ];
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;
    final playerWidth = 400.0;
    final playerHeight = 500.0;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(Assets.images.screensbg.path, fit: BoxFit.cover),
          ),

          Column(
            children: [
              AppMainBar(
                width: 133,
                leadingText: "Discover",
                title: "",
                centerTitle: false,
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: [
                  InkWell(
                    onTap: () {
                      context.pushNamed(AppRoutes.Searchscreen.name);
                    },
                    child: Image.asset(
                      Assets.images.searchicon.path,
                      color: customColors.textColor,
                    ),
                  ),
                  SizedBox(width: 15),
                ],
              ),

              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            PoppinsText(
                              'Genre',
                              fontSize: PoppinsFontSizeVariant.size16,
                              fontWeight: PoppinsFontWeightVariant.medium,
                              color: customColors.textColor,
                            ),
                          ],
                        ),

                        SizedBox(height: 20),

                        SizedBox(
                          height: 56,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (context, index) =>
                                SizedBox(width: 15),
                            itemCount: Genretitle.length,
                            itemBuilder: (context, index) {
                              return genreBoxWidget(title: Genretitle[index]);
                            },
                          ),
                        ),

                        SizedBox(height: 30),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            PoppinsText(
                              'Trending Show',
                              fontSize: PoppinsFontSizeVariant.size16,
                              fontWeight: PoppinsFontWeightVariant.medium,
                              color: customColors.textColor,
                            ),
                          ],
                        ),

                        SizedBox(height: 20),

                        SizedBox(
                          height: 180,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (context, index) =>
                                SizedBox(width: 15),
                            itemCount: trendingimages.length,
                            itemBuilder: (context, index) {
                              return CardWidget(
                                assetImage: trendingimages[index],
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 30),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            PoppinsText(
                              'Podcasts',
                              fontSize: PoppinsFontSizeVariant.size16,
                              fontWeight: PoppinsFontWeightVariant.medium,
                              color: customColors.textColor,
                            ),
                          ],
                        ),
                        SizedBox(height: 20),

                        SizedBox(
                          height: 180,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (context, index) =>
                                SizedBox(width: 15),
                            itemCount: podcardimages.length,
                            itemBuilder: (context, index) {
                              return PodcardsWidget(
                                assetImage: podcardimages[index],
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 30),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            PoppinsText(
                              'Documentaries',
                              fontSize: PoppinsFontSizeVariant.size16,
                              fontWeight: PoppinsFontWeightVariant.medium,
                              color: customColors.textColor,
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          height: 180,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (context, index) =>
                                SizedBox(width: 15),
                            itemCount: documentriescard.length,
                            itemBuilder: (context, index) {
                              return DocumentriesCardWidget(
                                assetImage: documentriescard[index],
                              );
                            },
                          ),
                        ),

                        SizedBox(height: 50),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
