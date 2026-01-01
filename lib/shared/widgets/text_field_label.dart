part of '../../drappers.dart';

class TextFieldLabel extends ConsumerWidget {
  final String name;

  const TextFieldLabel({super.key, required this.name});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;
    return Padding(
      padding: EdgeInsets.only(bottom: 2),
      child: PoppinsText(
        context,
        name,
        color: customColors.labelColor,
        fontWeight: PoppinsFontWeightVariant.regular,
        fontSize: PoppinsFontSizeVariant.size12,
      ),
    );
  }
}
