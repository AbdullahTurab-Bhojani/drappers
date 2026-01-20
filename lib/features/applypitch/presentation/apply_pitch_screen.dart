import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/extensions/theme_extension.dart';
import '../../../core/theme/app_scalar.dart';
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

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.images.screensbg.path),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppMainBar(
          leading: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => Navigator.of(context).pop(),
            child: Padding(
              padding: EdgeInsets.only(
                left: AppScaler.scaleHeight(context, 20),
              ),
              child: Image.asset(
                "assets/images/backicon.png",
                width: AppScaler.scaleSize(context, 20),
                height: AppScaler.scaleHeight(context, 20),
              ),
            ),
          ),
          title: "Apply to Pitch",
          centerTitle: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppScaler.scaleSize(context, 20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: AppScaler.scaleHeight(context, 30)),
                      PoppinsText(
                        context,
                        "Submit Your Pitch",
                        fontSize: PoppinsFontSizeVariant.size16,
                        fontWeight: PoppinsFontWeightVariant.medium,
                      ),
                      SizedBox(height: AppScaler.scaleHeight(context, 8)),
                      PoppinsText(
                        context,
                        "Apply to appeal on Meet the Drapers and pitch your startup to investors.",
                        fontSize: PoppinsFontSizeVariant.size12,
                        fontWeight: PoppinsFontWeightVariant.regular,
                        height: 1.7,
                      ),
                      SizedBox(height: AppScaler.scaleHeight(context, 16)),
                      NewTextField(
                        fieldbg: AppColors.tfield,
                        controller: _fullNameController,
                        labelText: "Full Name*",
                        hintText: "johnmackson",
                        hintStyle: TextStyle(
                          fontSize: AppScaler.scaleFont(context, 16),
                          fontWeight: FontWeight.w500,
                          color: customColors.textColor,
                        ),
                      ),
                      SizedBox(height: AppScaler.scaleHeight(context, 16)),
                      NewTextField(
                        fieldbg: AppColors.tfield,
                        controller: _startupController,
                        labelText: "Startup Name*",
                        hintText: "Crypto",
                        hintStyle: TextStyle(
                          fontSize: AppScaler.scaleFont(context, 16),
                          fontWeight: FontWeight.w500,
                          color: customColors.textColor,
                        ),
                      ),
                      SizedBox(height: AppScaler.scaleHeight(context, 16)),
                      NewTextField(
                        fieldbg: AppColors.tfield,
                        controller: _emailController,
                        labelText: "Email Address*",
                        hintText: "Enter your email",
                        hintStyle: TextStyle(
                          fontSize: AppScaler.scaleFont(context, 16),
                          fontWeight: FontWeight.w500,
                          color: customColors.textColor,
                        ),
                      ),
                      SizedBox(height: AppScaler.scaleHeight(context, 16)),
                      NewTextField(
                        fieldbg: AppColors.tfield,
                        controller: _linkController,
                        labelText: "Shareable link for your pitch deck*",
                        hintText: "www.link.com",
                        hintStyle: TextStyle(
                          fontSize: AppScaler.scaleFont(context, 16),
                          fontWeight: FontWeight.w500,
                          color: customColors.textColor,
                        ),
                      ),
                      SizedBox(height: AppScaler.scaleHeight(context, 16)),
                      PoppinsText(
                        context,
                        "Share a link to your pitch deck (Google Drive, DocSend, Dropbox, etc.)",
                        fontSize: PoppinsFontSizeVariant.size12,
                        fontWeight: PoppinsFontWeightVariant.regular,
                        height: 1.7,
                      ),
                      SizedBox(height: AppScaler.scaleHeight(context, 16)),
                      DropDownField(
                        controller: _locationController,
                        labelText: "Location*",
                        hintText: "Select your location",
                        hintStyle: TextStyle(
                          fontSize: AppScaler.scaleFont(context, 16),
                          fontWeight: FontWeight.w500,
                          color: customColors.textColor,
                        ),
                        // validator: (value) {
                        //   if (value == null || value.trim().isEmpty) {
                        //     return "Full name required";
                        //   }
                        //   return null;
                        // },
                        sufixIcon: Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColors.white,
                          size: AppScaler.scaleFont(context, 24),
                        ),
                      ),
                      SizedBox(height: AppScaler.scaleHeight(context, 16)),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          vertical: AppScaler.scaleHeight(context, 12),
                          horizontal: AppScaler.scaleSize(context, 12),
                        ),
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
                              width: AppScaler.scaleSize(context, 16),
                              height: AppScaler.scaleHeight(context, 16),
                            ),
                            SizedBox(width: AppScaler.scaleSize(context, 8)),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  PoppinsText(
                                    context,
                                    "What happens next?",
                                    fontSize: PoppinsFontSizeVariant.size12,
                                    fontWeight:
                                        PoppinsFontWeightVariant.semiBold,
                                  ),
                                  SizedBox(
                                    height: AppScaler.scaleHeight(context, 6),
                                  ),
                                  PoppinsText(
                                    context,
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
                      SizedBox(height: AppScaler.scaleHeight(context, 30)),
                      SizedBox(
                        child: AppButton(
                          onPressed: () {
                            context.goNamed(AppRoutes.home.name);
                          },
                          title: 'Submit',
                        ),
                      ),
                      SizedBox(height: AppScaler.scaleHeight(context, 30)),
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
