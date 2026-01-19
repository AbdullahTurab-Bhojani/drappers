import 'dart:async';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_scalar.dart';
import '../../drappers.dart';

class PhoneOtpField extends ConsumerStatefulWidget {
  final TextEditingController phoneController;
  final TextEditingController otpController;
  final VoidCallback onSendCode;
  final Color fieldbg;
  final String labelText;
  final String? Function(String?)? validator;
  final Country? countryCode; // optional, will use runtime default

  const PhoneOtpField({
    super.key,
    required this.phoneController,
    required this.otpController,
    required this.onSendCode,
    required this.fieldbg,
    required this.labelText,
    this.validator,
    this.countryCode,
  });

  @override
  ConsumerState<PhoneOtpField> createState() => _PhoneOtpFieldState();
}

class _PhoneOtpFieldState extends ConsumerState<PhoneOtpField> {
  late Country selectedCountry;

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
    // Runtime default country
    selectedCountry = widget.countryCode ?? Country.parse("US");

    _otpControllers = List.generate(6, (_) => TextEditingController());
    _focusNodes = List.generate(6, (_) => FocusNode());
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
    for (final c in _otpControllers) c.dispose();
    for (final f in _focusNodes) f.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: widget.fieldbg,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFieldLabel(name: widget.labelText),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
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
                          fontSize: AppScaler.scaleFont(context, 14),
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
                        fontSize: AppScaler.scaleFont(context, 16),
                        color: AppColors.white,
                      ),
                      decoration: const InputDecoration(
                        counterText: "",
                        hintText: "Enter phone number",
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 6),
                      ),
                      validator:
                          widget.validator ??
                          (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Phone number required";
                            }
                            String digitsOnly = value.replaceAll(
                              RegExp(r'[^0-9]'),
                              '',
                            );
                            String fullNumber =
                                '+${selectedCountry.phoneCode}$digitsOnly';
                            String pattern = r'^\+[1-9]\d{9,14}$';
                            if (!RegExp(pattern).hasMatch(fullNumber)) {
                              return "Enter a valid phone number with country code";
                            }
                            return null;
                          },
                      onChanged: (value) {
                        String digitsOnly = value.replaceAll(
                          RegExp(r'[^0-9]'),
                          '',
                        );
                        String fullNumber =
                            '+${selectedCountry.phoneCode}$digitsOnly';

                        setState(() {
                          showSendButton = RegExp(
                            r'^\+[1-9]\d{9,14}$',
                          ).hasMatch(fullNumber);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
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
      ],
    );
  }
}
