part of '../../drappers.dart';

class CustomErrorWidget extends StatelessWidget {
  final String message;

  const CustomErrorWidget({super.key, this.message = "Something went wrong"});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PoppinsText(
        message,
        color: AppColors.colorEF4444,
        fontWeight: PoppinsFontWeightVariant.medium,
        fontSize: PoppinsFontSizeVariant.size16,
      ),
    );
  }
}
