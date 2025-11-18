part of '../../../drappers.dart';

class CustomIconBtn extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  const CustomIconBtn({super.key, this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (onPressed != null) {
          onPressed!();
        }
      },
      style: ButtonStyle(
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity(vertical: -4, horizontal: -4),
      ),
      icon: child,
    );
  }
}
