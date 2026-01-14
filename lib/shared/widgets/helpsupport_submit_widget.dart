import 'package:flutter/material.dart';

import '../../core/extensions/theme_extension.dart';
import '../../core/theme/app_scalar.dart';
import '../../drappers.dart';
import '../../gen/assets.gen.dart';
import 'textfield_new.dart';

class HelpsupportSubmitWidget extends StatefulWidget {
  const HelpsupportSubmitWidget({super.key});

  @override
  State<HelpsupportSubmitWidget> createState() =>
      _HelpsupportSubmitWidgetState();
}

class _HelpsupportSubmitWidgetState extends State<HelpsupportSubmitWidget> {
  final _emailController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _describeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;
    return Column(
      crossAxisAlignment: .start,
      children: [
        Container(
          margin: EdgeInsets.only(
            top: AppScaler.scaleHeight(context, 20),
            left: AppScaler.scaleSize(context, 20),
          ),
          child: PoppinsText(
            context,
            "Submit a Ticket",
            fontSize: PoppinsFontSizeVariant.size22,
            fontWeight: PoppinsFontWeightVariant.medium,
            color: customColors.textColor,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: AppScaler.scaleSize(context, 20),
            right: AppScaler.scaleSize(context, 20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppScaler.scaleHeight(context, 10)),
              NewTextField(
                fieldbg: AppColors.submitfield181818,
                controller: _fullNameController,
                labelText: "Full Name*",
                hintText: "Enter your full name",
                filledColor: customColors.bgcontainerlight,
              ),
              SizedBox(height: AppScaler.scaleHeight(context, 15)),
              NewTextField(
                fieldbg: AppColors.submitfield181818,
                controller: _emailController,
                labelText: "Enter your Email Address or Phone*",
                hintText: "Enter your email",
                filledColor: customColors.bgcontainerlight,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Email required";
                  }
                  if (!value.contains("@")) {
                    return "Enter valid email";
                  }
                  return null;
                },
              ),
              SizedBox(height: AppScaler.scaleHeight(context, 15)),
              NewTextField(
                fieldbg: AppColors.submitfield181818,
                controller: _subjectController,
                labelText: "Subject*",
                hintText: "Subject here",
                filledColor: customColors.bgcontainerlight,
              ),
              SizedBox(height: AppScaler.scaleHeight(context, 15)),
              NewTextField(
                fieldbg: AppColors.submitfield181818,
                maxLines: 3,
                controller: _describeController,
                labelText: "Describe your issue*",
                hintText: "Describe your issue in detail...",
                filledColor: customColors.bgcontainerlight,
              ),
              SizedBox(height: AppScaler.scaleHeight(context, 10)),
              PoppinsText(
                context,
                "00/500 Characters",
                fontSize: PoppinsFontSizeVariant.size12,
                fontWeight: PoppinsFontWeightVariant.regular,
                color: customColors.greyColor,
              ),
              SizedBox(height: AppScaler.scaleHeight(context, 10)),
              PoppinsText(
                context,
                "Upload Screenshot (Optional)",
                fontSize: PoppinsFontSizeVariant.size16,
                fontWeight: PoppinsFontWeightVariant.regular,
                color: customColors.textColor,
              ),
              SizedBox(height: AppScaler.scaleHeight(context, 15)),
              Container(
                width: double.infinity,
                height: AppScaler.scaleHeight(context, 55),
                padding: EdgeInsets.symmetric(
                  horizontal: AppScaler.scaleSize(context, 12),
                ),
                decoration: BoxDecoration(
                  color: AppColors.submitfield181818,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      Assets.images.screenshoticon.path,
                      height: AppScaler.scaleHeight(context, 24),
                      width: AppScaler.scaleSize(context, 24),
                    ),
                    SizedBox(width: AppScaler.scaleSize(context, 24)),
                    PoppinsText(
                      context,
                      "Add Screenshot",
                      fontSize: PoppinsFontSizeVariant.size16,
                      fontWeight: PoppinsFontWeightVariant.regular,
                      color: customColors.textColor,
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppScaler.scaleHeight(context, 30)),
              AppButton(
                buttonSize: Size(
                  double.infinity,
                  AppScaler.scaleHeight(context, 40),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                title: "Submit Ticket",
              ),
              SizedBox(height: AppScaler.scaleHeight(context, 20)),
            ],
          ),
        ),
      ],
    );
  }
}
