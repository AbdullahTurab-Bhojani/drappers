import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';

class CardWidget extends StatefulWidget {
  final String backgroundImage;
  const CardWidget({super.key, required this.backgroundImage});

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
          image: NetworkImage(widget.backgroundImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Image.asset(Assets.images.envelopeicon.path, width: 20)],
        ),
      ),
    );
  }
}
