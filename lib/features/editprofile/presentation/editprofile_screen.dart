import 'package:flutter/material.dart';
import '../../../../drappers.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../shared/widgets/app_bar/main_app_bar.dart';
import '../../../core/extensions/theme_extension.dart';
import '../../../shared/widgets/textfield_new.dart';

class EditprofileScreen extends StatelessWidget {
  EditprofileScreen({super.key});

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

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
                leadingIcon: Icons.arrow_back_ios,
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
                        bottom: -12,
                        right: 42,
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
                            child: Icon(
                              Icons.camera_alt,
                              color: customColors.textColor,
                              size: 20,
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
                          filledColor: AppColors.tfield,
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
                          filledColor: AppColors.tfield,
                          keyboardType: TextInputType.emailAddress,
                          // validator: (value) {
                          //   if (value == null || value.trim().isEmpty) {
                          //     return "Email required";
                          //   }
                          //   if (!value.contains("@")) return "Enter valid email";
                          //   return null;
                          // },
                        ),
                        SizedBox(height: 15),

                        NewTextField(
                          fieldbg: AppColors.tfield,
                          controller: _phoneController,
                          labelText: "Phone Number*",
                          hintText: "03XXXXXXXXX",
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
