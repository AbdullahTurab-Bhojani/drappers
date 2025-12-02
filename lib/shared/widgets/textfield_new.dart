import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/extensions/theme_extension.dart';
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

class NewTextField extends ConsumerStatefulWidget {
  const NewTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.labelText,
    this.labelStyle,
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
    required this.fieldbg,
  });

  final bool readOnly;
  final VoidCallback? onTap;
  final bool autoFocus;
  final bool isPasswordField;
  final TextEditingController controller;
  final String hintText;
  final TextStyle? hintStyle;
  final TextStyle? errorStyle;
  final TextStyle? labelStyle;
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
  final Color fieldbg;
  @override
  ConsumerState<NewTextField> createState() => _NewTextFieldState();
}

class _NewTextFieldState extends ConsumerState<NewTextField> {
  OutlineInputBorder get border => OutlineInputBorder(
    // borderSide: BorderSide(color: widget.borderColor ?? AppColors.borderColor),
    borderRadius: BorderRadius.circular(10),
  );
  TextStyle get textStryle => GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: AppColors.white,
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
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: widget.fieldbg,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          if (widget.labelText != null) TextFieldLabel(name: widget.labelText!),
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
            cursorColor: AppColors.wDark,
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
            style: textStryle.copyWith(color: AppColors.wRegular),
            obscureText: obSecure,
            decoration: InputDecoration(
              isDense: true,
              counter: widget.maxLength != null && !widget.maxLengthOutSide
                  ? Offstage()
                  : null,
              // errorStyle:
              //     widget.errorStyle ??
              //     textStryle.copyWith(color: AppColors.colorEF4444),
              // errorMaxLines: 10,
              hintText: widget.hintText,
              hintTextDirection: TextDirection.ltr,
              contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              hintStyle:
                  widget.hintStyle ??
                  textStryle.copyWith(color: customColors.textColor),
              filled: false,
              fillColor: widget.filledColor ?? customColors.textColor,
              errorBorder: InputBorder.none,
              errorStyle: const TextStyle(height: 0, fontSize: 0),

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
                            (widget.maxLength != null &&
                                !widget.maxLengthOutSide)
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
                                      padding: EdgeInsets.all(14.0),
                                      child: Assets.icons.visible.image(
                                        scale: 4,
                                        height: 20,
                                        width: 20,
                                        fit: BoxFit.cover,
                                        color: AppColors.color6B7280,
                                      ),
                                    )
                                  : Padding(
                                      padding: EdgeInsets.all(14.0),
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
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }
}

class AppPasswordField extends StatefulWidget {
  const AppPasswordField({
    super.key,
    required this.controller,
    required this.hintText,
    this.validator,
    this.textInputAction,
    this.keyboardType,
    this.sufixIcon,
    this.prefixIcon,
    this.hintStyle,
    this.labelText,
  });

  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? sufixIcon;
  final TextStyle? hintStyle;
  final String? labelText;

  @override
  State createState() => _AppPasswordFieldState();
}

class _AppPasswordFieldState extends State<AppPasswordField> {
  bool isShow = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 14, right: 14, top: 12, bottom: 0),
      decoration: BoxDecoration(
        color: AppColors.tfield,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.labelText != null) TextFieldLabel(name: widget.labelText!),

          SizedBox(
            // height: 38,
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              cursorColor: AppColors.white,
              validator: widget.validator,
              obscureText: isShow,
              controller: widget.controller,
              inputFormatters: [NoOnlyWhitespaceFormatter()],
              keyboardType: widget.keyboardType,
              textInputAction: widget.textInputAction,

              style: GoogleFonts.poppins(
                color: AppColors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                // height: 1.1,
              ),

              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.zero,

                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,

                hintText: widget.hintText,
                hintStyle:
                    widget.hintStyle ??
                    GoogleFonts.poppins(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400
                    ),

                prefixIcon: widget.prefixIcon != null
                    ? Center(child: widget.prefixIcon!)
                    : null,
                prefixIconConstraints: const BoxConstraints(
                  minWidth: 32,
                  minHeight: 32,
                ),

                suffixIcon: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: GestureDetector(
                    onTap: () {
                      setState(() => isShow = !isShow);
                    },
                    child: Image.asset(
                      isShow
                          ? Assets.images.hideicon.path
                          : Assets.images.showicon.path,

                      color: Colors.white,
                      width: 18,
                      height: 18,
                    ),
                  ),
                ),

                suffixIconConstraints: BoxConstraints(
                  minWidth: 32,
                  minHeight: 32,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
