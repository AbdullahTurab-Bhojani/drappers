import 'package:flutter/material.dart';
import '../../core/extensions/theme_extension.dart';
import '../../core/theme/app_scalar.dart';
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
    required this.isMenuOpen,
  });

  final ImageProvider image;
  final String titleText;
  final String subtitleText;
  final List<dynamic> options;
  final String initialValue;
  final ValueChanged<String> onChanged;
  final bool isMenuOpen;
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
      width: AppScaler.scaleSize(context, 24),
      height: AppScaler.scaleHeight(context, 24),
      fit: BoxFit.cover,
    );

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(width: AppScaler.scaleSize(context, 10)),
              leadingWidget,
              SizedBox(width: AppScaler.scaleSize(context, 20)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PoppinsText(
                    context,
                    widget.titleText,
                    fontSize: PoppinsFontSizeVariant.size16,
                    fontWeight: PoppinsFontWeightVariant.medium,
                    color: customColors.textColor,
                  ),
                  SizedBox(height: AppScaler.scaleHeight(context, 4)),
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
          SizedBox(height: AppScaler.scaleHeight(context, 20)),

          CustomDropdown(
            hintText: _currentValue,
            dynamicValues: widget.options,
            isOpen: widget.isMenuOpen,
          ),
        ],
      ),
    );
  }
}
