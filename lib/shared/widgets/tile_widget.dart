import 'package:flutter/material.dart';
import '../../drappers.dart';

class TileWidget extends StatefulWidget {
  final String title;
  final String iconImage;
  final Color textColor;
  final bool ontaped;
  const TileWidget({
    super.key,
    required this.title,
    required this.iconImage,
    required this.textColor,
    required this.ontaped,
  });

  @override
  State<TileWidget> createState() => _TileWidgetState();
}

class _TileWidgetState extends State<TileWidget> {
  GestureTapCallback? ontaped;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: ontaped,
      child: Container(
        color: Colors.transparent,
        child: Padding(
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
                    color: widget.textColor,
                  ),
                ],
              ),
              widget.ontaped == true
                  ? Icon(Icons.arrow_forward_ios, size: 16)
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
