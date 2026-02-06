part of '../../drappers.dart';

class LoadingLottieWidget extends StatelessWidget {
  final double size;
  final Color? color;
  final EdgeInsets padding;

  const LoadingLottieWidget({
    super.key,
    this.size = 65,
    this.color,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;

    return Padding(
      padding: padding,
      child: Center(
        child: Container(
          width: size + 0,
          height: size + 0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: (color ?? AppColors.buttoncolor.first),
                blurRadius: 5,
                spreadRadius: 3,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: customColors.dark,
              shape: BoxShape.circle,
            ),

            child: ClipOval(
              child: Lottie.asset(
                'assets/EYEBROWW.json',
                width: size,
                height: size,
                fit: BoxFit.cover,

                delegates: LottieDelegates(
                  values: [
                    ValueDelegate.color([
                      '**',
                    ], value: color ?? AppColors.buttoncolor.first),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
