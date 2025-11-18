part of '../../../drappers.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.border = false,
    this.icon,
    this.buttonSize,
    this.isLoading = false,
    this.color,
  });

  final VoidCallback onPressed;
  final Widget? icon;
  final String title;
  final Size? buttonSize;
  final bool isLoading;
  final bool border;
  final Color? color;

  Color get textColor => border ? AppColors.primary : AppColors.white;
  Color get backgroundColor =>
      color ?? (border ? Colors.white : AppColors.primary);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        minimumSize: buttonSize ?? Size(MediaQuery.of(context).size.width, 52),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        alignment: Alignment.center,

        // Removes extra height
        overlayColor: WidgetStateColor.resolveWith((states) => AppColors.white),
        backgroundBuilder: (context, states, child) {
          return DecoratedBox(
            decoration: BoxDecoration(
              border: border ? Border.all(color: AppColors.primary) : null,
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: IntrinsicHeight(child: child),
          );
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: backgroundColor,
      ),
      onPressed: isLoading ? () {} : onPressed,
      child: isLoading
          ? LoadingWidget(height: 20, width: 20, color: textColor)
          : Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PlusJakartaText(
                  size: 14,
                  title,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
                if (icon != null) ...[const SizedBox(width: 6), icon!],
              ],
            ),
    );
  }
}
