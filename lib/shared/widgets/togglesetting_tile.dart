// ignore_for_file: deprecated_member_use, prefer_const_constructors_in_immutables, unused_local_variable

import 'package:flutter/material.dart';
import '../../core/extensions/theme_extension.dart';
import '../../core/theme/app_scalar.dart';
import '../../drappers.dart';
import 'settingitem.dart';

class GradientSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final List<Color> gradientColors;

  final Color inactiveColor;

  final Color thumbColor;

  const GradientSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    required this.gradientColors,
    this.inactiveColor = const Color(0xFFBDBDBD),
    this.thumbColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 250),
        width: AppScaler.scaleSize(context, 52),
        height: AppScaler.scaleHeight(context, 28),
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),

          gradient: value ? LinearGradient(colors: gradientColors) : null,
          color: value ? null : inactiveColor,
        ),
        child: AnimatedAlign(
          duration: Duration(milliseconds: 250),
          alignment: value ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: AppScaler.scaleSize(context, 24),
            height: AppScaler.scaleHeight(context, 24),
            decoration: BoxDecoration(
              color: thumbColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 4),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ToggleSettingTile extends StatefulWidget {
  const ToggleSettingTile({
    super.key,
    this.icon,
    this.image,
    required this.titleText,
    required this.subtitleText,
    required this.initialValue,
    required this.onChanged,
  }) : assert(
         icon != null || image != null,
         'Either icon or image must be provided',
       );

  final IconData? icon;
  final ImageProvider? image;
  final String titleText;
  final String subtitleText;
  final bool initialValue;
  final ValueChanged<bool> onChanged;

  @override
  State<ToggleSettingTile> createState() => _ToggleSettingTileState();
}

class _ToggleSettingTileState extends State<ToggleSettingTile> {
  late bool _currentValue;

  final List<Color> _defaultGradientColors = const [
    Color(0xFF1FCFFF),
    Color(0xFF0063FF),
  ];

  @override
  void initState() {
    super.initState();
    _currentValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<AppCustomColors>()!;

    Widget leadingWidget;
    if (widget.icon != null) {
      leadingWidget = Icon(
        widget.icon,
        color: customColors.textColor,
        size: 24,
      );
    } else if (widget.image != null) {
      leadingWidget = Image(
        image: widget.image!,
        width: AppScaler.scaleSize(context, 24),
        height: AppScaler.scaleHeight(context, 24),
        fit: BoxFit.cover,
      );
    } else {
      leadingWidget = const SizedBox.shrink();
    }

    return SettingItem(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          leadingWidget,
          SizedBox(width: AppScaler.scaleSize(context, 20)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              PoppinsText(
                context,
                widget.titleText,
                fontSize: PoppinsFontSizeVariant.size16,
                fontWeight: PoppinsFontWeightVariant.medium,
                color: customColors.textColor,
              ),
              SizedBox(height: AppScaler.scaleHeight(context, 2)),
              PoppinsText(
                context,
                widget.subtitleText,
                fontSize: PoppinsFontSizeVariant.size12,
                fontWeight: PoppinsFontWeightVariant.regular,
                color: customColors.textColor,
              ),
            ],
          ),
        ],
      ),
      trailing: GradientSwitch(
        value: _currentValue,
        onChanged: (val) {
          setState(() => _currentValue = val);
          widget.onChanged(val);
        },
        gradientColors: _defaultGradientColors,
        inactiveColor: Colors.grey.shade400,
        thumbColor: Colors.white,
      ),
    );
  }
}
