import 'package:flutter/material.dart';
import '../../core/extensions/theme_extension.dart';
import '../../drappers.dart';

class CustomRadioTile extends StatelessWidget {
  const CustomRadioTile({
    super.key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  final String title;
  final String value;
  final String? groupValue;
  final ValueChanged<String?> onChanged;

  static const Color primaryBlue = Color(0xFF1E88E5);
  static const Color inputFieldColor = Color(
    0xFF17244D,
  ); 

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;

    final isSelected = groupValue == value;

    return Container(
      child: InkWell(
        onTap: () => onChanged(value),
        child: Row(
          children: [
            SizedBox(
              height: 18,

              width: 18,

              child: Radio<String>(
                value: value,

                groupValue: groupValue,

                onChanged: onChanged,

                activeColor: primaryBlue,

                fillColor: MaterialStateProperty.resolveWith<Color>((
                  Set<MaterialState> states,
                ) {
                  if (states.contains(MaterialState.selected)) {
                    return primaryBlue;
                  }

                  return Colors.white54;
                }),
              ),
            ),

            SizedBox(width: 7),

            Flexible(
              child: PoppinsText(
                title,
                fontSize: PoppinsFontSizeVariant.size16,
                fontWeight: PoppinsFontWeightVariant.regular,
                color: customColors.textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
