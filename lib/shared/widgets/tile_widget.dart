import 'package:flutter/material.dart';
import '../../core/theme/app_scalar.dart';
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
      behavior: HitTestBehavior.opaque,
      onTap: ontaped,
      child: Container(
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.only(
            top: AppScaler.scaleHeight(context, 12),
            bottom: AppScaler.scaleHeight(context, 12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    widget.iconImage,
                    width: AppScaler.scaleSize(context, 24),
                    height: AppScaler.scaleHeight(context, 24),
                  ),
                  SizedBox(width: AppScaler.scaleSize(context, 20),),
                  PoppinsText(
                    context,
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
