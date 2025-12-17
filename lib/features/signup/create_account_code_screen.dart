// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';
import '../../core/extensions/theme_extension.dart';
import '../../drappers.dart';
import '../../gen/assets.gen.dart';

class CreateAccountCodeScreen extends StatefulWidget {
  const CreateAccountCodeScreen({super.key});

  @override
  State<CreateAccountCodeScreen> createState() =>
      _CreateAccountCodeScreenState();
}

class _CreateAccountCodeScreenState extends State<CreateAccountCodeScreen> {
  final List<TextEditingController> _otpControllers = List.generate(
    6,
    (_) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  void _onOtpChanged(int index, String value) {
    if (value.length == 1 && index < 5) {
      _focusNodes[index + 1].requestFocus();
    }
    if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }

    final otp = _otpControllers.map((c) => c.text).join();
    if (otp.length == 6) {
      context.pushNamed(AppRoutes.home.name);
    }
  }

  int _seconds = 30;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        setState(() {
          _seconds--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  String get timerText {
    final minutes = (_seconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (_seconds % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  @override
  void dispose() {
    _timer?.cancel();

    for (var c in _otpControllers) {
      c.dispose();
    }
    for (var f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.images.screensbg.path),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 70),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,

                onTap: () {
                  context.go('/signup');
                },
                child: Image.asset(Assets.images.backicon.path),
              ),
              SizedBox(height: 40),
              PoppinsText(
                "Create an Account",
                fontSize: PoppinsFontSizeVariant.size24,
                fontWeight: PoppinsFontWeightVariant.semiBold,
                color: customColors.textColor,
              ),
              SizedBox(height: 20),
              PoppinsText(
                'sent a 6-digit code to johnmackson@gmail.com Confirm it belongs to you to keep your account secure.',
                fontSize: PoppinsFontSizeVariant.size16,
                fontWeight: PoppinsFontWeightVariant.regular,
                color: customColors.textColor,
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(6, (index) {
                  return SizedBox(
                    width: 56,
                    child: Container(
                      height: 54,
                      alignment: Alignment.center,
                      child: ValueListenableBuilder<TextEditingValue>(
                        valueListenable: _otpControllers[index],
                        builder: (context, value, _) {
                          return TextField(
                            controller: _otpControllers[index],
                            focusNode: _focusNodes[index],
                            keyboardType: TextInputType.numberWithOptions(),
                            textAlign: TextAlign.center,
                            textAlignVertical: TextAlignVertical.center,
                            maxLength: 1,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                            decoration: InputDecoration(
                              counterText: '',
                              filled: true,
                              fillColor: value.text.isEmpty
                                  ? AppColors.color101317
                                  : AppColors.color101317,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 20,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                // borderSide: BorderSide(
                                //   color: Colors.blueAccent,
                                // ),
                              ),
                            ),
                            onChanged: (val) => _onOtpChanged(index, val),
                          );
                        },
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PoppinsText(
                    "Resend",
                    fontSize: PoppinsFontSizeVariant.size16,
                    fontWeight: PoppinsFontWeightVariant.medium,
                    color: customColors.greyColor,
                  ),
                  PoppinsText(
                    timerText,
                    fontSize: PoppinsFontSizeVariant.size16,
                    fontWeight: PoppinsFontWeightVariant.medium,
                    color: customColors.textColor,
                  ),
                ],
              ),
              // SizedBox(
              //   width: double.infinity,
              //   child: ElevatedButton(
              //     onPressed: _submitOtp,
              //     style: ElevatedButton.styleFrom(
              //       padding: EdgeInsets.symmetric(vertical: 14),
              //       backgroundColor: Colors.blueAccent,
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(12),
              //       ),
              //     ),
              //     child: PoppinsText(
              //       "Continue",
              //       fontSize: PoppinsFontSizeVariant.size16,
              //       fontWeight: PoppinsFontWeightVariant.semiBold,
              //       color: Colors.white,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
