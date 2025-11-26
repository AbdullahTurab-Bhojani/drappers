// Placeholder for the DropdownSettingTile
import 'package:flutter/material.dart';

import '../../core/extensions/theme_extension.dart';
import '../../drappers.dart';

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
    const double horizontalPadding =
        15; 
      Widget leadingWidget;
    
      leadingWidget = Image(
        image: widget.image!,
        width: 24,
        height: 24,
        fit: BoxFit.cover,
      );
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: 0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(width: 10),
              leadingWidget,
              // Icon(widget.icon, color: customColors.textColor, size: 24),
               SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PoppinsText(
                    widget.titleText,
                    fontSize: PoppinsFontSizeVariant.size16,
                    fontWeight: PoppinsFontWeightVariant.medium,
                    color: customColors.textColor,
                  ),
                   SizedBox(height: 4),
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
           SizedBox(height: 20),
          DropdownButtonFormField<String>(
            initialValue: _currentValue,
            dropdownColor: customColors.lightGray,
            style: TextStyle(
              color: customColors.textColor,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: customColors.lightGray,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 10.0,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none,
              ),
            ),
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: customColors.textColor,
              size: 25,
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
              return DropdownMenuItem<String>(
                value: value,
                child: PoppinsText(
                  value,
                  fontSize: PoppinsFontSizeVariant.size16,
                  fontWeight: PoppinsFontWeightVariant.regular,
                  color: customColors.textColor,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
