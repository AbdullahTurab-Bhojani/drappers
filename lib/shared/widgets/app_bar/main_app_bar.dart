import 'package:flutter/material.dart';
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
    Widget? _leadingWidget;

    if (leading != null) {
      _leadingWidget = leading;
    } else if (leadingText != null) {
      _leadingWidget = TextButton(
        onPressed: () => Navigator.pop(context),
        child: PoppinsText(
          leadingText!,
          color: Colors.white,
          fontWeight: PoppinsFontWeightVariant.semiBold,
          fontSize: PoppinsFontSizeVariant.size24,
        ),
      );
    } else if (leadingIcon != null) {
      _leadingWidget = IconButton(
        icon: Icon(leadingIcon, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      );
    } else {
      _leadingWidget = IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      );
    }

    return AppBar(
      backgroundColor: backgroundColor ?? Colors.black,
      elevation: elevation,
      leading: _leadingWidget,
      leadingWidth: width > 0 ? width : null,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      title: PoppinsText(
        title,
        color: Colors.white,
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
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
