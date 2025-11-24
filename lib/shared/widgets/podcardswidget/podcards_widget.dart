import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';

class PodcardsWidget extends StatefulWidget {
  final String AssetImage;

  const PodcardsWidget({super.key, required this.AssetImage});

  @override
  State<PodcardsWidget> createState() => _PodcardsWidgetState();
}

class _PodcardsWidgetState extends State<PodcardsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(widget.AssetImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 0, right: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              Assets.images.a3dotsicon.path
            )
          ],
        ),
      ),
    );
  }

}