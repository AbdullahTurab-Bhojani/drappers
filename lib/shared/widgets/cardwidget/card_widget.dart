import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({super.key});

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
          image: NetworkImage(
            'https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding:  EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container(),
            Image.asset(
              Assets.images.envelopeicon.path
            )
          ],
        ),
      ),
    );
  }
}
