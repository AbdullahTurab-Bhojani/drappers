// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../../../gen/assets.gen.dart';

class WatchHistory extends StatefulWidget {
  final String assetImage; // can be asset path or network URL
  const WatchHistory({super.key, required this.assetImage});

  @override
  State<WatchHistory> createState() => _WatchHistoryState();
}

class _WatchHistoryState extends State<WatchHistory> {
  double _sliderValue = 60;

  @override
  Widget build(BuildContext context) {
    bool isNetworkImage = widget.assetImage.startsWith('http');

    return Container(
      width: 125,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: isNetworkImage
              ? NetworkImage(widget.assetImage) as ImageProvider
              : AssetImage(widget.assetImage),
          fit: BoxFit.cover,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: Colors.black.withOpacity(0.4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Top row with three dots
              Padding(
                padding: const EdgeInsets.only(top: 8, right: 2, bottom: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      Assets.images.a3dotsicon.path,
                      width: 20,
                      height: 20,
                    ),
                  ],
                ),
              ),
              Image.asset(Assets.images.playwithbgicon.path),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 10),
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 3,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 0),
                  ),
                  child: Slider(
                    activeColor: Colors.white,
                    inactiveColor: Colors.white.withOpacity(0.5),
                    value: _sliderValue,
                    thumbColor: Colors.transparent,
                    min: 0,
                    max: 100,
                    onChanged: (v) {
                      setState(() {
                        _sliderValue = v;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
