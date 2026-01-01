import 'package:flutter/material.dart';
import '../../../../drappers.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../shared/widgets/app_bar/main_app_bar.dart';
import '../../../core/extensions/theme_extension.dart';
import '../../../core/theme/app_scalar.dart';
import '../../../shared/widgets/phonefield_code.dart';
import '../../../shared/widgets/textfield_new.dart';
import 'edit_profile_popup.dart';

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
                  behavior: HitTestBehavior.opaque,

                  onTap: () => Navigator.of(context).pop(),
                  child: Image.asset(
                    "assets/images/backicon.png",
                    width: AppScaler.scaleSize(context, 20),
                    height: AppScaler.scaleHeight(context, 20),
                  ),
                ),
                title: "Edit Profile",
                centerTitle: false,
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              SizedBox(height: AppScaler.scaleHeight(context, 50)),
              Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (context) => Center(
                              child: Dialog(
                                backgroundColor: Colors.transparent,
                                insetPadding: EdgeInsets.symmetric(
                                  horizontal: AppScaler.scaleSize(context, 20),
                                ),
                                child: EditProfilePopup(),
                              ),
                            ),
                          );
                        },
                        child: SizedBox(
                          height: AppScaler.scaleHeight(context, 114.82),
                          width: AppScaler.scaleSize(context, 114.82),
                          child: CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.transparent,
                            backgroundImage: NetworkImage(
                              'https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D',
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: AppScaler.scaleSize(context, -10),
                        right: AppScaler.scaleSize(context, 46),
                        child: Container(
                          width: AppScaler.scaleSize(context, 24),
                          height: AppScaler.scaleHeight(context, 24),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: customColors.buttonColors.first,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Image.asset(
                              Assets.images.editprofilecameraicon.path,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppScaler.scaleHeight(context, 20)),
                  PoppinsText(
                    context,
                    'Jerry Mackson',
                    fontSize: PoppinsFontSizeVariant.size22,
                    fontWeight: PoppinsFontWeightVariant.medium,
                    color: customColors.textColor,
                  ),
                  SizedBox(height: AppScaler.scaleHeight(context, 20)),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: AppScaler.scaleSize(context, 20),
                      right: AppScaler.scaleSize(context, 20),
                    ),
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
                        ),
                        SizedBox(height: AppScaler.scaleHeight(context, 15)),
                        PhoneOtpField(
                          phoneController: phoneController,
                          otpController: otpController,
                          fieldbg: AppColors.tfield,
                          labelText: 'Phone Number*',
                          onSendCode: () {},
                        ),

                        AppButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          title: "Save Changes",
                        ),
                        SizedBox(height: AppScaler.scaleHeight(context, 12)),
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
