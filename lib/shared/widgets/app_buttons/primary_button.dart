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

  // Color get textColor => border ? AppColors.primary : AppColors.white;
  // Color get backgroundColor =>
  //     color ?? (border ? Colors.white : AppColors.primary);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;
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
              color: color,
              gradient: LinearGradient(
                colors: customColors.buttonColors,
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.blue.withOpacity(0.4),
              //     blurRadius: 5,
              //     offset: const Offset(0, 5),
              //   ),
              // ],
              border: border
                  ? Border.all(color: customColors.greyColor, width: 1)
                  : null,
              borderRadius: BorderRadius.circular(50),
            ),
            child: IntrinsicHeight(child: child),
          );
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        // backgroundColor: backgroundColor,
      ),
      onPressed: isLoading ? () {} : onPressed,
      child: isLoading
          ? LoadingWidget(height: 20, width: 20, color: color)
          : Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PoppinsText(
                  fontSize: PoppinsFontSizeVariant.size16,
                  title,
                  fontWeight: PoppinsFontWeightVariant.medium,
                  color: customColors.textColor,
                ),
                if (icon != null) ...[const SizedBox(width: 6), icon!],
              ],
            ),
    );
  }
}

class AppButtonwithoudbg extends StatelessWidget {
  const AppButtonwithoudbg({
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

  // Color get textColor => border ? AppColors.primary : AppColors.white;
  // Color get backgroundColor =>
  //     color ?? (border ? Colors.white : AppColors.primary);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;
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
              color: Colors.transparent,
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.blue.withOpacity(0.4),
              //     blurRadius: 5,
              //     offset: const Offset(0, 5),
              //   ),
              // ],
              border: Border.all(color: customColors.textColor, width: 0.3),
              borderRadius: BorderRadius.circular(50),
            ),
            child: IntrinsicHeight(child: child),
          );
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        // backgroundColor: backgroundColor,
      ),
      onPressed: isLoading ? () {} : onPressed,
      child: isLoading
          ? LoadingWidget(height: 20, width: 20, color: color)
          : Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PoppinsText(
                  fontSize: PoppinsFontSizeVariant.size16,
                  title,
                  fontWeight: PoppinsFontWeightVariant.medium,
                  color: customColors.textColor,
                ),
                if (icon != null) ...[const SizedBox(width: 6), icon!],
              ],
            ),
    );
  }
}
