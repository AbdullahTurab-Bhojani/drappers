part of '../../drappers.dart';

typedef ChildWidgetBuilder =
    Widget Function(FormFieldState<bool> formFieldState);

class CustomFormValidator extends ConsumerWidget {
  final ChildWidgetBuilder child;
  final String? errorText;
  final AlignmentGeometry? errorAlignment;
  final bool value;
  const CustomFormValidator({
    super.key,
    required this.child,
    this.errorText,
    this.errorAlignment,
    required this.value,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FormField<bool>(
      key: key,
      initialValue: value,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (val) {
        if (val == false) {
          return errorText;
        }

        return null; // No error
      },
      builder: (formFieldState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            child(formFieldState),
            if (formFieldState.hasError)
              Padding(
                padding: errorAlignment == null
                    ? EdgeInsets.only(top: 10, left: 10)
                    : EdgeInsets.zero,
                child: Align(
                  alignment: errorAlignment ?? Alignment.centerLeft,
                  child: PlusJakartaText(
                    formFieldState.errorText!,
                    size: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.red.shade900,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
