import 'package:flutter/material.dart';


class VerificationCodeField extends StatefulWidget {
  final int length;
  final void Function(String)? onCompleted;
  final double boxSize;
  final TextStyle? textStyle;
  final InputDecoration? inputDecoration;

  const VerificationCodeField({
    super.key,
    this.length = 6,
    this.onCompleted,
    this.boxSize = 56,
    this.textStyle,
    this.inputDecoration,
  });

  @override
  State<VerificationCodeField> createState() => _VerificationCodeFieldState();
}

class _VerificationCodeFieldState extends State<VerificationCodeField> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _controllers =
        List.generate(widget.length, (index) => TextEditingController());
    _focusNodes = List.generate(widget.length, (index) => FocusNode());
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  String get _currentCode =>
      _controllers.map((c) => c.text).join();

  void _onChanged(String value, int index) {
    if (value.isEmpty) {
      // If user pressed backspace on empty field, move to previous
      if (index > 0) {
        _focusNodes[index - 1].requestFocus();
        _controllers[index - 1].selection = TextSelection.fromPosition(
            TextPosition(offset: _controllers[index - 1].text.length));
      }
      return;
    }

    // If user pasted multiple chars (e.g., full code)
    if (value.length > 1) {
      final pasted = value;
      for (int i = 0; i < widget.length; i++) {
        final ch = (i < pasted.length) ? pasted[i] : '';
        _controllers[i].text = ch;
      }
      final lastIndex = (pasted.length >= widget.length)
          ? widget.length - 1
          : pasted.length - 1;
      if (lastIndex >= 0) _focusNodes[lastIndex].requestFocus();
    } else {
      // normal single char entry
      _controllers[index].text = value;
      if (index + 1 < widget.length) {
        _focusNodes[index + 1].requestFocus();
      } else {
        // last box filled
        _focusNodes[index].unfocus();
      }
    }

    // If all boxes filled, call onCompleted
    final code = _currentCode;
    if (code.length == widget.length && !code.contains('')) {
      widget.onCompleted?.call(code);
    }
  }

  @override
  Widget build(BuildContext context) {
    final inputDecoration = widget.inputDecoration ??
        InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(width: 1),
          ),
          contentPadding: EdgeInsets.zero,
        );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.length, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: SizedBox(
            width: widget.boxSize,
            height: widget.boxSize,
            child: TextField(
              controller: _controllers[index],
              focusNode: _focusNodes[index],
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: widget.textStyle ??
                  const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
              maxLength: 1,
              decoration: inputDecoration.copyWith(
                counterText: '', 
              ),
              onChanged: (value) => _onChanged(value, index),
              inputFormatters: [
         
              ],
            ),
          ),
        );
      }),
    );
  }
}
