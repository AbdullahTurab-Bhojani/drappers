// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../../../gen/assets.gen.dart';
import 'popupmenuitem/popupmenu_widget.dart';

class WatchHistory extends StatefulWidget {
  final String assetImage; 
  final bool showSaveIcon;

   const WatchHistory({super.key, required this.assetImage, required this.showSaveIcon});

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
              Padding(
         padding: widget.showSaveIcon ? EdgeInsets.only(left: 8, top: 5, bottom: 5,right: 8)  : EdgeInsetsGeometry.only(top: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           PopupmenuWidget(
             showSaveIcon: widget.showSaveIcon,
           ),

            // PoppinsText(
            //   widget.title,
            //   fontSize: PoppinsFontSizeVariant.size14,
            //   fontWeight: PoppinsFontWeightVariant.medium,
            // ),
          ],
        ),
      ),
              Image.asset(Assets.images.playwithbgicon.path),
              Padding(
                padding:  EdgeInsets.only(left: 8, right: 8, bottom: 10),
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
