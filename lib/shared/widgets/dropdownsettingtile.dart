import 'package:flutter/material.dart';

import '../../core/extensions/theme_extension.dart';
import '../../drappers.dart';
import '../../gen/assets.gen.dart';

class DropdownSettingTile extends StatefulWidget {
  const DropdownSettingTile({
    super.key,
    required this.image,
    required this.titleText,
    required this.subtitleText,
    required this.options,
    required this.initialValue,
    required this.onChanged,
  });

  final ImageProvider image;
  final String titleText;
  final String subtitleText;
  final List<String> options;
  final String initialValue;
  final ValueChanged<String> onChanged;

  @override
  State<DropdownSettingTile> createState() => _DropdownSettingTileState();
}

class _DropdownSettingTileState extends State<DropdownSettingTile> {
  late String _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;
    const double horizontalPadding = 15;
    Widget leadingWidget;

    leadingWidget = Image(
      image: widget.image,
      width: 24,
      height: 24,
      fit: BoxFit.cover,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: 0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const SizedBox(width: 10),
              leadingWidget,
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PoppinsText(
                    widget.titleText,
                    fontSize: PoppinsFontSizeVariant.size16,
                    fontWeight: PoppinsFontWeightVariant.medium,
                    color: customColors.textColor,
                  ),
                  const SizedBox(height: 4),
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
          const SizedBox(height: 20),

          DropdownButtonFormField<String>(
            value: _currentValue,
            dropdownColor: customColors.regular,
            style: TextStyle(
              color: customColors.textColor,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: customColors.lightGray,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 10.0,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none,
              ),
            ),
            icon: Image.asset(
              Assets.images.dropdownicon.path,
              height: 14,
              width: 14,
              scale: 2.5,
            ),

            onChanged: (String? newValue) {
              if (newValue != null) {
                setState(() {
                  _currentValue = newValue;
                });
                widget.onChanged(newValue);
              }
            },

            items: widget.options.map<DropdownMenuItem<String>>((String value) {
              final isSelected = value == _currentValue;

              return DropdownMenuItem<String>(
                value: value,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.check,
                        color: isSelected
                            ? customColors.textColor
                            : Colors.transparent,
                        size: 20,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: PoppinsText(
                          value,
                          fontSize: PoppinsFontSizeVariant.size16,
                          fontWeight: PoppinsFontWeightVariant.regular,
                          color: customColors.textColor,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),

            selectedItemBuilder: (context) {
              return widget.options.map((String item) {
                return PoppinsText(
                  item,
                  fontSize: PoppinsFontSizeVariant.size16,
                  fontWeight: PoppinsFontWeightVariant.regular,
                  color: customColors.textColor,
                );
              }).toList();
            },
          ),
        ],
      ),
    );
  }
}
