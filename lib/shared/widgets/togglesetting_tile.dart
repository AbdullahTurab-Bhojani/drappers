import 'package:flutter/material.dart';

import '../../core/extensions/theme_extension.dart';
import '../../drappers.dart';
import 'settingitem.dart';

class ToggleSettingTile extends StatefulWidget {
  const ToggleSettingTile({
    super.key,
    required this.icon,
    required this.titleText,
    required this.subtitleText,
    required this.initialValue,
    required this.onChanged,
  });

  final IconData icon;
  final String titleText;
  final String subtitleText;
  final bool initialValue;
  final ValueChanged<bool> onChanged;

  @override
  State<ToggleSettingTile> createState() => _ToggleSettingTileState();
}

class _ToggleSettingTileState extends State<ToggleSettingTile> {
  late bool _currentValue;

  // Define the default gradient colors needed for the Switch track
  final List<Color> _defaultGradientColors = [
    const Color(0xFF1FCFFF), // gradientStartColor
    const Color(0xFF0063FF), // gradientEndColor
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

    // Use AppCustomColors buttonColors if available, otherwise use default
    final List<Color> switchGradientColors =
        customColors.buttonColors ?? _defaultGradientColors;

    return SettingItem(
      title: Row(
        children: [
          Icon(
            widget.icon,
            color: customColors.textColor,
            size: 24,
          ),
          const SizedBox(width: 15.0),
          PoppinsText(
            widget.titleText,
            fontSize: PoppinsFontSizeVariant.size16,
            fontWeight: PoppinsFontWeightVariant.medium,
            color: customColors.textColor,
          ),
        ],
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(left: 40.0),
        child: PoppinsText(
          widget.subtitleText,
          fontSize: PoppinsFontSizeVariant.size12,
          fontWeight: PoppinsFontWeightVariant.regular,
          color: customColors.textColor,
        ),
      ),
      trailing: Switch(
        value: _currentValue,
        onChanged: (bool value) {
          setState(() {
            _currentValue = value;
          });
          widget.onChanged(value); 
        },
        activeColor: customColors.textColor,
        activeTrackColor: switchGradientColors.first, 
      ),
    );
  }
}