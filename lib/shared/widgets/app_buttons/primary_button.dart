part of '../../../drappers.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.border = false,
    this.prefixIcon,
    this.suffixIcon,
    this.buttonSize,
    this.isLoading = false,
    this.color,
    this.borderColor = Colors.transparent,
    this.borderWidth = 2,
    List<Color>? buttonGradient,
    this.fontSize = PoppinsFontSizeVariant.size16,
    this.fontWeight = PoppinsFontWeightVariant.medium,
  }) : buttonGradient = (buttonGradient != null && buttonGradient.length >= 2)
           ? buttonGradient
           : const [Color(0xFF00C6FF), Color(0xFF0072FF)];

  final VoidCallback onPressed;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String title;
  final Size? buttonSize;
  final bool isLoading;
  final bool border;
  final Color? color;
  final Color? borderColor;
  final double? borderWidth;
  final List<Color>? buttonGradient;
  final PoppinsFontSizeVariant fontSize;
  final PoppinsFontWeightVariant fontWeight;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;

    return TextButton(
      style: TextButton.styleFrom(
        minimumSize: buttonSize ?? Size(MediaQuery.of(context).size.width, 52),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        alignment: Alignment.center,
        overlayColor: WidgetStateColor.resolveWith((states) => AppColors.white),
        backgroundBuilder: (context, states, child) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: color,
              gradient: LinearGradient(
                colors: buttonGradient!,
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              border: border
                  ? Border.all(color: borderColor!, width: borderWidth!)
                  : null,
              borderRadius: BorderRadius.circular(50),
            ),
            child: IntrinsicHeight(child: child),
          );
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: isLoading ? () {} : onPressed,
      child: isLoading
          ? LoadingWidget(height: 20, width: 20, color: color)
          : Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (prefixIcon != null) ...[prefixIcon!, SizedBox(width: 6)],
                PoppinsText(
                  fontSize: fontSize,
                  title,
                  fontWeight: fontWeight,
                  color: customColors.textColor,
                ),
                if (suffixIcon != null) ...[SizedBox(width: 6), suffixIcon!],
              ],
            ),
    );
  }
}
