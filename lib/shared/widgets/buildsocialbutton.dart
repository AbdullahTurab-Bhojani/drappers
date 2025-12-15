import 'package:flutter/material.dart';

import '../../drappers.dart';
// Assuming 'drappers.dart' provides PoppinsText and its variants

class SocialLoginButton extends StatefulWidget {
  const SocialLoginButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  final String label;
  final String icon; // Assuming this is the social icon character/text
  final VoidCallback onPressed;

  @override
  State<SocialLoginButton> createState() => _SocialLoginButtonState();
}

class _SocialLoginButtonState extends State<SocialLoginButton> {
  static const Color _inputFieldColor = Color(0xFF17244D);
  static const Color _textColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45, // Reduced button height
      decoration: BoxDecoration(
        color: _inputFieldColor,
        borderRadius: BorderRadius.circular(10), // Reduced radius
        border: Border.all(color: Colors.white10),
      ),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,

        onTap: widget.onPressed,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon display (using the provided String)
              Text(
                widget.icon,
                style: const TextStyle(
                  fontSize: 18,
                  color: _textColor,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(width: 6),
              // Label display (using PoppinsText)
              PoppinsText(
                widget.label,
                fontSize: PoppinsFontSizeVariant.size15,
                fontWeight: PoppinsFontWeightVariant.medium,
                // Color is typically inherited or defaulted to _textColor in this style
                // but since PoppinsText is a custom widget, ensure it uses the desired color
                color: _textColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
