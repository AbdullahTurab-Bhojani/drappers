import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../drappers.dart';
import '../../gen/assets.gen.dart';

class NoOnlyWhitespaceFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;

    // Prevent only-whitespace input
    if (text.trim().isEmpty && text.isNotEmpty) {
      return oldValue;
    }

    return newValue;
  }
}

class TextFormFieldWidget extends ConsumerStatefulWidget {
  const TextFormFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.labelText,
    this.validator,
    this.textInputAction,
    this.keyboardType,
    this.prefixIcon,
    this.prefixIconConstraints,
    this.maxLines,
    this.onChanged,
    this.hintStyle,
    this.errorStyle,
    this.filledColor,
    this.maxLength,
    this.maxLengthOutSide = false,
    this.readOnly = false,
    this.isPasswordField = false,
    this.inputFormatters,
    this.autoFocus = false,
    this.sufixIcon,
    this.onTap,
    this.borderColor,
    this.autovalidateMode,
  });

  final bool readOnly;
  final VoidCallback? onTap;
  final bool autoFocus;
  final bool isPasswordField;
  final TextEditingController controller;
  final String hintText;
  final TextStyle? hintStyle;
  final TextStyle? errorStyle;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? sufixIcon;
  final BoxConstraints? prefixIconConstraints;
  final ValueChanged<String>? onChanged;
  final int? maxLength;
  final int? maxLines;
  final bool maxLengthOutSide;
  final Color? filledColor;
  final Color? borderColor;
  final List<TextInputFormatter>? inputFormatters;
  final AutovalidateMode? autovalidateMode;
  final String? labelText;
  @override
  ConsumerState<TextFormFieldWidget> createState() =>
      _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends ConsumerState<TextFormFieldWidget> {
  OutlineInputBorder get border => OutlineInputBorder(
    // borderSide: BorderSide(color: widget.borderColor ?? AppColors.borderColor),
    borderRadius: BorderRadius.circular(10),
  );
  TextStyle get textStryle => GoogleFonts.plusJakartaSans(
    fontWeight: FontWeight.w500,
    fontSize: 13,
    color: AppColors.color9CA3AF,
  );
  bool obSecure = false;
  var focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    onInit();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  void onInit() {
    if (widget.isPasswordField) {
      setState(() {
        obSecure = true;
      });
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      textLength = widget.controller.text.length;
      setState(() {});
    });
  }

  int textLength = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // if (widget.labelText != null) TextFieldLabel(name: widget.labelText!),
        TextFormField(
          focusNode: focusNode,
          autofocus: widget.autoFocus,
          autovalidateMode:
              widget.autovalidateMode ?? AutovalidateMode.onUserInteraction,
          inputFormatters: [
            NoOnlyWhitespaceFormatter(),
            ...(widget.inputFormatters ?? []),
          ],
          maxLines: widget.maxLines,
          readOnly: widget.readOnly,
          onTap: widget.onTap,
          cursorColor: AppColors.primary,
          controller: widget.controller,
          textInputAction: widget.textInputAction ?? TextInputAction.next,
          keyboardType: widget.keyboardType,
          validator: widget.validator,
          onChanged: (value) {
            if (widget.maxLength != null) {
              setState(() {
                textLength = value.length;
              });
            }

            if (widget.onChanged != null) {
              widget.onChanged!(value);
            }
          },
          maxLength: widget.maxLength,

          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          style: textStryle.copyWith(color: AppColors.lightText),
          obscureText: obSecure,

          decoration: InputDecoration(
            alignLabelWithHint: true,
            counter: widget.maxLength != null && !widget.maxLengthOutSide
                ? Offstage()
                : null,
            errorStyle:
                widget.errorStyle ??
                textStryle.copyWith(color: AppColors.colorEF4444),
            errorMaxLines: 10,
            label: Column(
              children: [
                SizedBox(height: 40),
                PoppinsText(widget.labelText!),
                SizedBox(height: 5),
              ],
            ),

            hintText: widget.hintText,
            hintTextDirection: TextDirection.ltr,

            hintStyle:
                widget.hintStyle ??
                textStryle.copyWith(color: AppColors.color9CA3AF, height: 2),
            filled: true,
            fillColor: widget.filledColor ?? AppColors.fieldColor,
            errorBorder: border,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            floatingLabelAlignment: FloatingLabelAlignment.start,
            prefixIconConstraints: widget.prefixIconConstraints,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.sufixIcon != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 12,
                    ),
                    child: widget.sufixIcon,
                  )
                : (context.isWeb &&
                          (widget.maxLength != null && !widget.maxLengthOutSide)
                      ? Padding(
                          padding: EdgeInsets.only(right: 14, left: 0),
                          child: SizedBox(
                            width: 50,
                            height: 40,
                            child: Center(
                              child: PlusJakartaText(
                                '$textLength/${widget.maxLength}',
                              ),
                            ),
                          ),
                        )
                      : widget.isPasswordField
                      ? CustomIconBtn(
                          onPressed: () {
                            setState(() {
                              obSecure = !obSecure;
                            });
                          },
                          child: SizedBox(
                            child: obSecure
                                ? Padding(
                                    padding: const EdgeInsets.all(14.0),
                                    child: Assets.icons.visible.image(
                                      scale: 4,
                                      height: 20,
                                      width: 20,
                                      fit: BoxFit.cover,
                                      color: AppColors.color6B7280,
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.all(14.0),
                                    child: Assets.icons.hide.image(
                                      scale: 4,
                                      height: 20,
                                      width: 20,
                                      fit: BoxFit.cover,
                                      color: AppColors.color6B7280,
                                    ),
                                  ),
                          ),
                        )
                      : null),
            border: border,
            focusedBorder: border,
            enabledBorder: border,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 16, // adjust for both label and hint
              horizontal: 14,
            ),
          ),
        ),
      ],
    );
  }
}
