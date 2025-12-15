// ignore_for_file: deprecated_member_use, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import '../../core/extensions/theme_extension.dart';
import '../../drappers.dart';
import 'settingitem.dart';

class GradientSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final List<Color> gradientColors;

  const GradientSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    required this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
     final customColors = Theme.of(context).extension<AppCustomColors>()!;
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 250),
        width: 52,
        height: 28,
        padding: EdgeInsets.all(3),
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(100),
        //   gradient: value ? LinearGradient(colors: gradientColors) : null,
        //   color: value ? null : customColors.white0xffbdbdbe,
        // ),
        decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(100),
  gradient: LinearGradient(
    colors: value
        ? gradientColors
        : gradientColors
            .map((c) => c.withOpacity(0.3))
            .toList(),
  ),
),
        child: AnimatedAlign(
          duration: Duration(milliseconds: 250),
          alignment: value ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: Colors.white,
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

  final List<Color> _defaultGradientColors = [
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
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;

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
        width: 24,
        height: 24,
        fit: BoxFit.cover,
      );
    } else {
      leadingWidget = SizedBox.shrink();
    }

    return SettingItem(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          leadingWidget,
          SizedBox(width: 20.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              PoppinsText(
                widget.titleText,
                fontSize: PoppinsFontSizeVariant.size16,
                fontWeight: PoppinsFontWeightVariant.medium,
                color: customColors.textColor,
              ),
              SizedBox(height: 2),
              PoppinsText(
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
      ),
    );
  }
}
