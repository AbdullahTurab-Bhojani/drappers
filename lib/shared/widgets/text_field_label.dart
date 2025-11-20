part of '../../drappers.dart';

class TextFieldLabel extends ConsumerWidget {
  final String name;

  const TextFieldLabel({super.key, required this.name});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: PoppinsText(
        name,
        fontWeight: PoppinsFontWeightVariant.regular,
        fontSize: PoppinsFontSizeVariant.size12,
        color: AppColors.dLabel,
      ),
    );
  }
}
