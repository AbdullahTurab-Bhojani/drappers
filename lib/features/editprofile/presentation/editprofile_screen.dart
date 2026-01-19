import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '../../../../drappers.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../shared/widgets/app_bar/main_app_bar.dart';
import '../../../core/extensions/theme_extension.dart';
import '../../../core/local/domain/repositories/local_storage_repository.dart';
import '../../../core/theme/app_scalar.dart';
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
  final TextEditingController _phoneController = TextEditingController();

  PhoneNumber? initialPhoneNumber;
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

      if (fetchedUser.phoneNumber != null) {
        initialPhoneNumber = await PhoneNumber.getRegionInfoFromPhoneNumber(
          fetchedUser.phoneNumber!,
        );
        _phoneController.text = initialPhoneNumber?.parseNumber() ?? '';
      } else {
        initialPhoneNumber = PhoneNumber(isoCode: 'US', dialCode: '+1');
      }
    }
    setState(() {});
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
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
                        if (initialPhoneNumber != null)
                          InternationalPhoneNumberInput(
                            textStyle: GoogleFonts.poppins(
                              fontSize: AppScaler.scaleFont(context, 16),
                              color: AppColors.white,
                            ),
                            onInputChanged: (PhoneNumber number) {
                              _phoneController.text = number.phoneNumber ?? '';
                            },
                            onInputValidated: (bool isValid) {},
                            selectorConfig: const SelectorConfig(
                              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                              showFlags: false,
                            ),
                            initialValue: initialPhoneNumber,
                            textFieldController: _phoneController,
                            inputDecoration: InputDecoration(
                              hintStyle: GoogleFonts.poppins(
                                fontSize: AppScaler.scaleFont(context, 16),
                                color: AppColors.white,
                              ),
                              filled: true,
                              fillColor: AppColors.tfield,
                              labelText: 'Phone Number*',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none,
                              ),
                              labelStyle: GoogleFonts.poppins(
                                fontSize: AppScaler.scaleFont(context, 12),
                                color: customColors.labelColor,
                              ),
                            ),
                          ),

                        SizedBox(height: AppScaler.scaleHeight(context, 20)),
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
