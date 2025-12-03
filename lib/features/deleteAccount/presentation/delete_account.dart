// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/extensions/theme_extension.dart';
import '../../../../drappers.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../shared/widgets/app_bar/main_app_bar.dart';

class DeleteAccount extends StatefulWidget {
  const DeleteAccount({super.key});

  @override
  State<DeleteAccount> createState() => _DeleteAccountScreenState();
}

enum AccountOption { deactivate, delete }

class _DeleteAccountScreenState extends State<DeleteAccount> {
  AccountOption? _selectedOption;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;

    const double horizontalPadding = 15.0;

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppMainBar(
              leadingIcon: Icons.arrow_back_ios,
              title: "",
              centerTitle: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding:  EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: 10.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PoppinsText(
                      "Delete or Deactivate Account",
                      fontSize: PoppinsFontSizeVariant.size24,
                      fontWeight: PoppinsFontWeightVariant.semiBold,
                      color: customColors.textColor,
                    ),
                    // Subtitle
                    PoppinsText(
                      "Choose how you'd like to manage your account",
                      fontSize: PoppinsFontSizeVariant.size16,
                      fontWeight: PoppinsFontWeightVariant.regular,
                      color: customColors.textColor,
                    ),
                    const SizedBox(height: 30.0),

                    Container(
                      padding: const EdgeInsets.all(14.0),
                      decoration: BoxDecoration(
                        color: customColors.boxyellow,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Radio<AccountOption>(
                            value: AccountOption.deactivate,
                            groupValue: _selectedOption,
                            onChanged: (value) {
                              setState(() {
                                if (_selectedOption == value) {
                                  _selectedOption = null; // Unselect
                                } else {
                                  _selectedOption = value; // Select
                                }
                              });
                            },
                            activeColor: customColors.textColor,
                          ),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                PoppinsText(
                                  "Deactivate Account",
                                  fontSize: PoppinsFontSizeVariant.size16,
                                  fontWeight: PoppinsFontWeightVariant.regular,
                                  color: customColors.yellowlight,
                                ),
                                 SizedBox(height: 5.0),
                                PoppinsText(
                                  "Your profile, watchlist, history, preferences, and downloads will be saved. You can reactivate anytime by signing in again.",
                                  fontSize: PoppinsFontSizeVariant.size16,
                                  fontWeight: PoppinsFontWeightVariant.regular,
                                  color: customColors.textColor,
                                  textOverflow: TextOverflow.visible,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20.0),

                    Container(
                      padding: const EdgeInsets.all(14.0),
                      decoration: BoxDecoration(
                        color: customColors.redbox,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Radio<AccountOption>(
                                value: AccountOption.delete,
                                groupValue: _selectedOption,
                                onChanged: (value) {
                                  setState(() {
                                    if (_selectedOption == value) {
                                      _selectedOption = null;
                                    } else {
                                      _selectedOption = value;
                                    }
                                  });
                                },
                                activeColor: customColors.textColor,
                              ),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    PoppinsText(
                                      "Delete Account Permanently",
                                      fontSize: PoppinsFontSizeVariant.size16,
                                      fontWeight:
                                          PoppinsFontWeightVariant.regular,
                                      color: customColors.redlight,
                                    ),
                                    const SizedBox(height: 8.0),
                                    PoppinsText(
                                      "All your data will be permanently removed, including watch history, preferences, profiles, downloads, payment data, and saved settings.",
                                      fontSize: PoppinsFontSizeVariant.size16,
                                      fontWeight:
                                          PoppinsFontWeightVariant.regular,
                                      color: customColors.textColor,
                                      textOverflow: TextOverflow.visible,
                                    ),
                                    SizedBox(height: 10),
                                    Container(
                                      padding: const EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                        color: customColors.rednormal,
                                        borderRadius: BorderRadius.circular(
                                          8.0,
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.info_outline,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                          const SizedBox(width: 10.0),
                                          Expanded(
                                            child: PoppinsText(
                                              "This action cannot be undone.",
                                              fontSize:
                                                  PoppinsFontSizeVariant.size14,
                                              fontWeight:
                                                  PoppinsFontWeightVariant
                                                      .semiBold,
                                              color: customColors.textColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),

                                // AppButton(
                                //   onPressed: () {},
                                //   title: "Delete Account Permanently",
                                // ),
                                // AppButton(
                                //   onPressed: () {},
                                //   title: "Deactivate Account",
                                // ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20.0),

                          // Warning Box
                        ],
                      ),
                    ),
                    const SizedBox(height: 40.0),
                    if (_selectedOption == AccountOption.delete)
                      AppButton(
                        onPressed: () {
                          context.pushNamed(AppRoutes.deleteDetailScreen.name);
                        },
                        title: "Delete Account Permanently",
                      ),

                    if (_selectedOption == AccountOption.deactivate)
                      AppButton(onPressed: () {
                      context.pushNamed(AppRoutes.deactivateAccountScreen.name);
                      }, title: "Deactivate Account"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
