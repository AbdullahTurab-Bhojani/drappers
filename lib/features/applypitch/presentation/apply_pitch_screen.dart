import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/extensions/theme_extension.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';
import '../../../shared/widgets/app_bar/main_app_bar.dart';
import '../../../shared/widgets/textfield_new.dart';

class ApplyPitch extends StatefulWidget {
  const ApplyPitch({super.key});

  @override
  State<ApplyPitch> createState() => _ApplyPitchState();
}

class _ApplyPitchState extends State<ApplyPitch> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _startupController = TextEditingController();
  final TextEditingController _linkController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

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
        child: Column(
          children: [
            // Fixed App Bar
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
              title: "Apply to Pitch",
              centerTitle: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30),
                      PoppinsText(
                        "Submit Your Pitch",
                        fontSize: PoppinsFontSizeVariant.size16,
                        fontWeight: PoppinsFontWeightVariant.medium,
                      ),
                      SizedBox(height: 18),
                      PoppinsText(
                        "Apply to appeal on Meet the Drapers and pitch your startup to investors.",
                        fontSize: PoppinsFontSizeVariant.size12,
                        fontWeight: PoppinsFontWeightVariant.regular,
                        height: 1.7,
                      ),
                      SizedBox(height: 16),

                      NewTextField(
                        fieldbg: AppColors.tfield,
                        controller: _fullNameController,
                        labelText: "Full Name",
                        hintText: "johnmackson",
                      ),
                      SizedBox(height: 16),

                      NewTextField(
                        fieldbg: AppColors.tfield,
                        controller: _startupController,
                        labelText: "Startup Name*",
                        hintText: "Krypto",
                      ),
                      SizedBox(height: 16),

                      NewTextField(
                        fieldbg: AppColors.tfield,
                        controller: _emailController,
                        labelText: "Email Address",
                        hintText: "Enter your email",
                      ),
                      SizedBox(height: 16),

                      NewTextField(
                        fieldbg: AppColors.tfield,
                        controller: _linkController,
                        labelText: "Shareable link for your pitch deck*",
                        hintText: "www.link.com",
                      ),
                      SizedBox(height: 16),
                      PoppinsText(
                        "Share a link to your pitch deck (Google Drive, DocSend, Dropbox, etc.)",
                        fontSize: PoppinsFontSizeVariant.size12,
                        fontWeight: PoppinsFontWeightVariant.regular,
                        height: 1.7,
                      ),
                      SizedBox(height: 16),

                      AppPasswordField(
                        controller: _locationController,
                        labelText: "Location*",
                        hintText: "Select your location",
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Full name required";
                          }
                          return null;
                        },
                        sufixIcon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      SizedBox(height: 16),

                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: customColors.dark,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              Assets.images.infoicon.path,
                              width: 16,
                              height: 16,
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  PoppinsText(
                                    "What happens next?",
                                    fontSize: PoppinsFontSizeVariant.size12,
                                    fontWeight:
                                        PoppinsFontWeightVariant.semiBold,
                                  ),
                                  SizedBox(height: 6),
                                  PoppinsText(
                                    "Our team will review your application and pitchdeck. If selected, you’ll be contacted within 2-3 weeks to schedule your appearance on Meet the Drapers.",
                                    fontSize: PoppinsFontSizeVariant.size12,
                                    fontWeight:
                                        PoppinsFontWeightVariant.regular,
                                    maxLines: 5,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 50),
                      AppButton(
                        onPressed: () {
                          context.goNamed(AppRoutes.home.name);
                        },
                        title: 'Submit',
                      ),
                      SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
