import 'package:flutter/material.dart';
import '../../../gen/assets.gen.dart';

class CardWidget extends StatefulWidget {
  final String assetImage;
  const CardWidget({super.key, required this.assetImage});

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(widget.assetImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 8, right: 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Image.asset(Assets.images.a3dotsicon.path)],
        ),
      ),
    );
  }

}
