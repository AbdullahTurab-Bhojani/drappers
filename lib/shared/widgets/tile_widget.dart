import 'package:flutter/material.dart';

import '../../drappers.dart';
import '../../gen/assets.gen.dart';

class TileWidget extends StatefulWidget {
  final String title;
  final String iconImage;
  const TileWidget({super.key, required this.title, required this.iconImage});

  @override
  State<TileWidget> createState() => _TileWidgetState();
}

class _TileWidgetState extends State<TileWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12, bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(widget.iconImage),
              SizedBox(width: 20),
              PoppinsText(
                widget.title,
                fontSize: PoppinsFontSizeVariant.size16,
                fontWeight: PoppinsFontWeightVariant.medium,
                color: Colors.white,
              ),
            ],
          ),
         Icon(Icons.arrow_forward_ios,
         size: 16,
         )
        ],
      ),
    );
  }
}
