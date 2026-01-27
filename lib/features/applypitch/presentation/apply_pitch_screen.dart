import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/extensions/theme_extension.dart';
import '../../../core/theme/app_scalar.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';
import '../../../shared/widgets/app_bar/main_app_bar.dart';
import '../../../shared/widgets/textfield_new.dart';
import '../data/dto/pitch_dto.dart';
import '../providers/apply_pitch_provider.dart';

class ApplyPitch extends ConsumerStatefulWidget {
  const ApplyPitch({super.key});

  @override
  ConsumerState<ApplyPitch> createState() => _ApplyPitchState();
}

class _ApplyPitchState extends ConsumerState<ApplyPitch> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _startupController = TextEditingController();
  final TextEditingController _linkController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? requiredValidator(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return "$fieldName is required";
    }
    return null;
  }

  String? emailValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Email address is required";
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(value.trim())) {
      return "Enter a valid email address";
    }
    return null;
  }

  String? linkValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Pitch deck link is required";
    }

    final uri = Uri.tryParse(value.trim());
    if (uri == null || !uri.hasAbsolutePath) {
      return "Enter a valid link (https://...)";
    }
    return null;
  }

  String? selectedCity;

  final List<String> locationList = [
    "SWSX Austin",
    "Salt lake city",
    "Waikiki",
    "Palm beach",
    "Las Vegas",
    "Silicon Valley",
    "Nashville",
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;
    final state = ref.watch(pitchProviderProvider);

    ref.listen(pitchProviderProvider, (previous, next) {
      next.whenOrNull(
        success: (res) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(res.message)));
            context.goNamed(AppRoutes.home.name);
          });
        },
        error: (msg) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(msg!)));
          });
        },
      );
    });

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
                  child: Form(
                    key: formKey,
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
                          validator: (value) =>
                              requiredValidator(value, "Full name"),
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
                          validator: (value) =>
                              requiredValidator(value, "Startup name"),
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
                          validator: emailValidator,
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
                          validator: linkValidator,
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select location';
                            }
                            return null;
                          },
                          labelText: "Location",
                          hintText: "Select your location",
                          value: selectedCity,
                          items: locationList,
                          onChanged: (value) {
                            setState(() {
                              selectedCity = value;
                            });
                          },
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
                        AppButton(
                          title: "Submit",
                          isLoading: state.isLoading,
                          onPressed: () async {
                            if (!formKey.currentState!.validate()) return;

                            final dto = PitchDto(
                              fullName: _fullNameController.text.trim(),
                              startUpName: _startupController.text.trim(),
                              email: _emailController.text.trim(),
                              link: _linkController.text.trim(),
                              address: selectedCity!,
                            );

                            try {
                              await ref
                                  .read(pitchProviderProvider.notifier)
                                  .onSubmit(dto: dto);
                            } catch (_) {}
                          },
                        ),

                        SizedBox(height: AppScaler.scaleHeight(context, 30)),
                      ],
                    ),
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
