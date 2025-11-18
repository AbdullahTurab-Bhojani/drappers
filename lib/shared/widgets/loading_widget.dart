part of '../../drappers.dart';

class LoadingWidget extends StatelessWidget {
  final double width;
  final double height;
  final Color? color;
  final EdgeInsets padding;

  const LoadingWidget({
    super.key,
    this.height = 40,
    this.width = 40,
    this.color,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    Color? colorData;
    if (!kIsWeb) {
      if (Platform.isAndroid) {
        colorData = Colors.white;
      } else {
        colorData = color ?? AppColors.primary;
      }
    } else {
      colorData = color;
    }
    return Padding(
      padding: padding,
      child: Center(
        child: SizedBox(
          width: width,
          height: height,
          child: CircularProgressIndicator.adaptive(
            backgroundColor: colorData,
            valueColor: AlwaysStoppedAnimation(color ?? AppColors.primary),
            strokeCap: StrokeCap.round,
            strokeWidth: 2,
          ),
        ),
      ),
    );
  }
}
