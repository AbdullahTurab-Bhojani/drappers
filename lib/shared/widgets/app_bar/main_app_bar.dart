import 'package:flutter/material.dart';
import '../../../core/theme/app_scalar.dart';
import '../../../drappers.dart';

class AppMainBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final String? leadingText;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final bool centerTitle;
  final Color? backgroundColor;
  final double elevation;
  final double width;

  const AppMainBar({
    super.key,
    required this.title,
    this.leading,
    this.leadingText,
    this.leadingIcon,
    this.actions,
    this.centerTitle = false,
    this.backgroundColor,
    this.elevation = 0,
    this.width = 0,
  });

  @override
  Widget build(BuildContext context) {
    Widget? leadingWidget;

    if (leading != null) {
      leadingWidget = leading;
    } else if (leadingText != null) {
      leadingWidget = Center(
        child: Padding(
          padding: EdgeInsets.only(left: AppScaler.scaleSize(context, 16)),
          child: PoppinsText(
            context,
            leadingText!,
            color: AppColors.white,
            fontWeight: PoppinsFontWeightVariant.semiBold,
            fontSize: PoppinsFontSizeVariant.size22,
            textOverflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      );
    } else if (leadingIcon != null) {
      leadingWidget = IconButton(
        icon: Icon(leadingIcon, color: AppColors.white),
        onPressed: () => Navigator.pop(context),
      );
    } else {
      leadingWidget = IconButton(
        icon: Icon(Icons.arrow_back, color: AppColors.white),
        onPressed: () => Navigator.pop(context),
      );
    }

    return AppBar(
      backgroundColor: backgroundColor ?? Colors.black,
      elevation: elevation,
      leading: leadingWidget,
      leadingWidth: width > 0 ? width : null,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      title: PoppinsText(
        context,
        title,
        color: AppColors.white,
        fontWeight: PoppinsFontWeightVariant.semiBold,
        fontSize: PoppinsFontSizeVariant.size24,
      ),
      centerTitle: centerTitle,
      actions: actions ??
          [
           
          ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
