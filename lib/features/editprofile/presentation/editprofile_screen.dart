import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../drappers.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../shared/widgets/app_bar/main_app_bar.dart';
import '../../../core/extensions/theme_extension.dart';
import '../../../core/local/domain/repositories/local_storage_repository.dart';
import '../../../core/theme/app_scalar.dart';
import '../../../shared/widgets/phonefield_code.dart';
import '../../../shared/widgets/textfield_new.dart';
import '../../user/domain/models/user_model.dart';
import 'edit_profile_popup.dart';

class EditprofileScreen extends ConsumerStatefulWidget {
  const EditprofileScreen({super.key});

  @override
  ConsumerState<EditprofileScreen> createState() => _EditprofileScreenState();
}

class _EditprofileScreenState extends ConsumerState<EditprofileScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _countryCodeController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  UserData? user;

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  Future<void> _loadUser() async {
    final fetchedUser = await ref.read(localDataProvider).getUser();
    if (fetchedUser != null) {
      _fullNameController.text = fetchedUser.fullName ?? '';
      _emailController.text = fetchedUser.email ?? '';

      if (fetchedUser.phoneNumber != null &&
          fetchedUser.phoneNumber!.contains(" ")) {
        final parts = fetchedUser.phoneNumber!.split(" ");
        _countryCodeController.text = parts[0];
        _phoneNumberController.text = parts.sublist(1).join("");
      } else {
        _countryCodeController.text = "+92"; // default
        _phoneNumberController.text = fetchedUser.phoneNumber ?? '';
      }
    }
    setState(() {});
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _countryCodeController.dispose();
    _phoneNumberController.dispose();
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              // App Bar
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

              // Profile Image + Name
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
                    _fullNameController.text.isNotEmpty
                        ? _fullNameController.text
                        : 'Guest User',
                    fontSize: PoppinsFontSizeVariant.size22,
                    fontWeight: PoppinsFontWeightVariant.medium,
                    color: customColors.textColor,
                  ),
                  SizedBox(height: AppScaler.scaleHeight(context, 20)),
                ],
              ),

              // Form Fields
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppScaler.scaleSize(context, 20),
                    ),
                    child: Column(
                      children: [
                        NewTextField(
                          fieldbg: AppColors.tfield,
                          controller: _fullNameController,
                          labelText: "Full Name*",
                          hintText: "Enter your full name",
                          hintStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          filledColor: customColors.textColor,
                        ),
                        SizedBox(height: 15),
                        NewTextField(
                          fieldbg: AppColors.tfield,
                          controller: _emailController,
                          labelText: "Email Address*",
                          hintText: "Enter your email",
                          hintStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          filledColor: AppColors.tfield,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: AppScaler.scaleHeight(context, 15)),

                        // Phone Field (with country code)
                        PhoneOtpField(
                          countryCode: Country.parse("US"),
                          phoneController: _phoneNumberController,
                          otpController: otpController,
                          fieldbg: AppColors.tfield,
                          labelText: 'Phone Number*',
                          onSendCode: () {},
                        ),

                        SizedBox(height: AppScaler.scaleHeight(context, 20)),

                        AppButton(
                          onPressed: () {
                            // Save logic here
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
