part of '../../drappers.dart';

class TextFieldLabel extends ConsumerWidget {
  final String name;

  const TextFieldLabel({super.key, required this.name});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: PlusJakartaText(
        name,
        fontWeight: FontWeight.w400,
        color: customColors.labelColor,
      ),
    );
  }
}
