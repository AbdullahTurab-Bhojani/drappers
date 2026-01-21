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
  final Country? countryCode;
  // Step 1: Callback function define karein
  final Function(Country) onCountryChanged;

  const PhoneOtpField({
    super.key,
    required this.phoneController,
    required this.otpController,
    required this.onSendCode,
    required this.fieldbg,
    required this.labelText,
    required this.onCountryChanged, // Isse required karein
    this.validator,
    this.countryCode,
  });

  @override
  ConsumerState<PhoneOtpField> createState() => _PhoneOtpFieldState();
}

class _PhoneOtpFieldState extends ConsumerState<PhoneOtpField> {
  late Country selectedCountry;

  @override
  void initState() {
    super.initState();
    selectedCountry = widget.countryCode ?? Country.parse("US");
  }

  bool _isPhoneValid(String value) {
    String digitsOnly = value.replaceAll(RegExp(r'[^0-9]'), '');
    String fullNumber = '+${selectedCountry.phoneCode}$digitsOnly';
    return RegExp(r'^\+[1-9]\d{9,14}$').hasMatch(fullNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                        widget.onCountryChanged(country);
                      }
                    },
                    countryListTheme: CountryListThemeData(
                      flagSize: 20,
                      backgroundColor: AppColors.bDark,
                      textStyle: GoogleFonts.poppins(
                        fontSize: 16,
                        color: AppColors.white,
                      ),
                      searchTextStyle: GoogleFonts.poppins(
                        fontSize: 16,
                        color: AppColors.white,
                      ),

                      bottomSheetHeight: 600,
                      inputDecoration: InputDecoration(
                        focusColor: AppColors.buttoncolor.first,
                        hoverColor: AppColors.buttoncolor.first,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.bSubTextColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.bSubTextColor,
                          ),
                        ),
                        hintText: 'Search by country name',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.bSubTextColor,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.bSubTextColor,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: widget.fieldbg,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Text(
                        '+${selectedCountry.phoneCode}',
                        style: GoogleFonts.poppins(
                          fontSize: AppScaler.scaleFont(context, 16),
                          color: AppColors.white,
                        ),
                      ),
                      const Icon(Icons.arrow_drop_down, color: Colors.white),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextFormField(
                  controller: widget.phoneController,
                  keyboardType: TextInputType.phone,
                  maxLength: 15,
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
                        if (!_isPhoneValid(value)) {
                          return "Enter a valid phone number";
                        }
                        return null;
                      },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
