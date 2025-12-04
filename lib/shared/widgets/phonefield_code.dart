import 'dart:async';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../drappers.dart';

class PhoneOtpField extends ConsumerStatefulWidget {
  final TextEditingController phoneController;
  final TextEditingController otpController;
  final VoidCallback onSendCode;
  final Color fieldbg;
  final String labelText;

  const PhoneOtpField({
    super.key,
    required this.phoneController,
    required this.otpController,
    required this.onSendCode,
    required this.fieldbg,
    required this.labelText,
  });

  @override
  ConsumerState<PhoneOtpField> createState() => _PhoneOtpFieldState();
}

class _PhoneOtpFieldState extends ConsumerState<PhoneOtpField> {
  Country selectedCountry = Country.parse("US");

  bool showSendButton = false;
  bool showOtpField = false;
  bool isTimerRunning = false;
  bool showResendButton = false;

  int seconds = 30;
  Timer? _timer;

  late final List<TextEditingController> _otpControllers;
  late final List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _otpControllers = List.generate(6, (_) => TextEditingController());
    _focusNodes = List.generate(6, (_) => FocusNode());
  }

  /// -------------------- TIMER --------------------
  void _startTimer() {
    seconds = 30;

    setState(() {
      isTimerRunning = true;
      showResendButton = false;
      showOtpField = true; // ✅ show otp on send & resend
    });

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;

      if (seconds == 0) {
        timer.cancel();
        setState(() {
          isTimerRunning = false;
          showResendButton = true;
          showOtpField = false; // ✅ OTP HIDE AFTER TIMER
        });
      } else {
        setState(() => seconds--);
      }
    });
  }

  void _onOtpChanged(int index, String value) {
    if (value.isNotEmpty && index < 5) {
      _focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }

    widget.otpController.text = _otpControllers.map((e) => e.text).join();
  }

  @override
  void dispose() {
    _timer?.cancel();

    for (final c in _otpControllers) {
      c.dispose();
    }

    for (final f in _focusNodes) {
      f.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// ---------------- PHONE FIELD ----------------
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: widget.fieldbg,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFieldLabel(name: widget.labelText),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      showCountryPicker(
                        context: context,
                        showPhoneCode: true,
                        onSelect: (Country country) {
                          if (mounted) {
                            setState(() => selectedCountry = country);
                          }
                        },
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(
                        "+${selectedCountry.phoneCode}",
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    child: TextFormField(
                      controller: widget.phoneController,
                      keyboardType: TextInputType.phone,
                      maxLength: 10,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: AppColors.white,
                      ),
                      decoration: const InputDecoration(
                        counterText: "",
                        hintText: "Enter phone number",
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        setState(() {
                          showSendButton = value.length == 10;
                        });
                      },
                    ),
                  ),

                  /// ✅ SEND BUTTON
                  if (showSendButton && !isTimerRunning && !showResendButton)
                    GestureDetector(
                      onTap: () {
                        widget.onSendCode();
                        showSendButton = false;
                        _startTimer();
                      },
                      child: _actionButton("Send"),
                    ),

                  /// ✅ TIMER
                  if (isTimerRunning)
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        "00:$seconds",
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),

                  /// ✅ RESEND BUTTON
                  if (showResendButton)
                    GestureDetector(
                      onTap: () {
                        widget.onSendCode();
                        _startTimer();
                      },
                      child: _actionButton("Resend"),
                    ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        /// ---------------- OTP FIELD ----------------
        if (showOtpField)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(6, (index) {
              return SizedBox(
                width: 50,
                child: TextField(
                  controller: _otpControllers[index],
                  focusNode: _focusNodes[index],
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  maxLength: 1,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                  decoration: InputDecoration(
                    counterText: '',
                    filled: true,
                    fillColor: AppColors.color101317,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onChanged: (val) => _onOtpChanged(index, val),
                ),
              );
            }),
          ),

        const SizedBox(height: 30),
      ],
    );
  }

  /// ---------------- BUTTON UI ----------------
  Widget _actionButton(String text) {
    return Container(
      margin: const EdgeInsets.only(left: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(text, style: const TextStyle(color: Colors.white)),
    );
  }
}
