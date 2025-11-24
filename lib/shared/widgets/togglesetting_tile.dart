import 'package:flutter/material.dart';
import '../../core/extensions/theme_extension.dart';
import '../../drappers.dart';
import 'settingitem.dart';

// --- Custom Gradient Switch Widget ---
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
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: 55,
        height: 30,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: value ? LinearGradient(colors: gradientColors) : null,
          color: value ? null : Colors.grey.shade400,
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 250),
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

// --- TOGGLE SETTING TILE ---
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

  final List<Color> _defaultGradientColors = [
    const Color(0xFF1FCFFF),
    const Color(0xFF0063FF),
  ];

  @override
  void initState() {
    super.initState();
    _currentValue =
        widget.initialValue; // <-- yeh current value set kar raha hai
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;

    return SettingItem(
      title: Row(
        children: [
          Icon(widget.icon, color: customColors.textColor, size: 24),
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

      trailing: GradientSwitch(
        value: _currentValue,
        onChanged: (val) {
          setState(() => _currentValue = val); // <-- Value update
          widget.onChanged(val); // <-- Callback
        },
        gradientColors: _defaultGradientColors,
      ),
    );
  }
}
