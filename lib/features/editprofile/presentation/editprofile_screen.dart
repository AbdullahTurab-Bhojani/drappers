import 'package:flutter/material.dart';
import '../../../../drappers.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../shared/widgets/app_bar/main_app_bar.dart';
import '../../../core/extensions/theme_extension.dart';
import '../../../shared/widgets/phonefield_code.dart';
import '../../../shared/widgets/textfield_new.dart';

class EditprofileScreen extends StatelessWidget {
  EditprofileScreen({super.key});

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final phoneController = TextEditingController();
  final otpController = TextEditingController();

  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
  }

  void initState() {
    _fullNameController.text == 'johnmackson';
    _emailController.text == 'john@gmail.com';
    _phoneController.text == '03** *****92';
  }

  @override
  Widget build(BuildContext context) {
    _fullNameController.text = 'johnmackson';
    _emailController.text = 'john@gmail.com';
    _phoneController.text = '03** *****92';
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(Assets.images.screensbg.path, fit: BoxFit.cover),
          ),
          Column(
            children: [
              AppMainBar(
                leading: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Image.asset(
                      "assets/images/backicon.png",
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
                title: "Edit Profile",
                centerTitle: false,
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              SizedBox(height: 50),
              Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage(
                          'https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D',
                        ),
                      ),
                      Positioned(
                        bottom: -14,
                        right: 38,
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: customColors.buttonColors.first,
                            shape: BoxShape.circle,
                            // border: Border.all(
                            //   color: customColors.textColor,
                            //   width: 1,
                            // ),
                          ),
                          child: Center(
                            child: Image.asset(
                              Assets.images.screenshoticon.path,
                              width: 24,
                              height: 24,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  PoppinsText(
                    'Jerry Mackson',
                    fontSize: PoppinsFontSizeVariant.size22,
                    fontWeight: PoppinsFontWeightVariant.medium,
                    color: customColors.textColor,
                  ),
                  SizedBox(height: 20),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        NewTextField(
                          fieldbg: AppColors.tfield,
                          controller: _fullNameController,
                          labelText: "Full Name*",
                          hintText: "Enter your full name",
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          filledColor: customColors.textColor,
                          // validator: (value) {
                          //   if (value == null || value.trim().isEmpty) {
                          //     return "Full name required";
                          //   }
                          //   return null;
                          // },
                        ),
                        SizedBox(height: 15),

                        NewTextField(
                          fieldbg: AppColors.tfield,
                          controller: _emailController,
                          labelText: "Email Address*",
                          hintText: "Enter your email",
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          filledColor: AppColors.tfield,
                          keyboardType: TextInputType.emailAddress,
                          sufixIcon: Container(
                            height: 28,
                            width: 84,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: customColors.buttonColors.first,
                            ),
                            child: Center(
                              child: PoppinsText(
                                "Send Code",
                                fontSize: PoppinsFontSizeVariant.size12,
                                fontWeight: PoppinsFontWeightVariant.regular,
                                color: customColors.textColor,
                              ),
                            ),
                          ),
                        ),
                        
                        // VerificationCodeField(
                        //   length: 6,
                        //   onCompleted: (code) {
                        //     print('Entered code: $code');
                        //   },
                        // ),

                        // SizedBox(height: 15),

                        // PhoneNumberInputField(
                        //   onChanged: (fullNumber) {
                        //     print('Full Phone Number: $fullNumber');
                        //   },
                        // ),
                        SizedBox(height: 15),
                        NewTextField(
                          fieldbg: AppColors.tfield,
                          controller: _phoneController,
                          labelText: "Phone Number*",
                          hintText: "03XXXXXXXXX",
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          filledColor: AppColors.tfield,
                          keyboardType: TextInputType.phone,
                          // validator: (value) {
                          //   if (value == null || value.trim().isEmpty) {
                          //     return "Phone number required";
                          //   }
                          //   if (value.length < 11) return "Enter valid phone";
                          //   return null;
                          // },
                        ),

                        SizedBox(height: 25),

                        PhoneOtpField(
                          phoneController: phoneController,
                          otpController: otpController,
                          fieldbg: AppColors.tfield,
                          labelText: 'Phone Number*',
                          onSendCode: () {
                            print("OTP API CALL HERE");
                          },
                        ),
                        AppButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          title: "Save Changes",
                        ),
                        SizedBox(height: 12),
                        AppButton(
                          color: Colors.transparent,
                          borderColor: customColors.textColor,
                          borderWidth: 1,
                          border: true,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          title: "Discard Changes",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
