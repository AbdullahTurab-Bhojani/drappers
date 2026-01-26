import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/extensions/theme_extension.dart';
import '../../../drappers.dart';
import '../../../features/deactivateAccount/provider/deactivate_provider.dart';
import '../../../gen/assets.gen.dart';

class DeactivatePopupWidget extends ConsumerWidget {
  final bool showSaveIcon;

  const DeactivatePopupWidget({super.key, this.showSaveIcon = true});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;

    return Container(
      height: 350,
      width: double.infinity,
      padding: const EdgeInsets.only(top: 24, bottom: 24, left: 32, right: 32),
      decoration: BoxDecoration(
        color: customColors.regular,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(Assets.images.ban123.path, height: 54, width: 54),
          const SizedBox(height: 40),
          PoppinsText(
            context,
            "Are you sure you want to deactivate your account?",
            fontSize: PoppinsFontSizeVariant.size16,
            fontWeight: PoppinsFontWeightVariant.medium,
            color: customColors.textColor,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          AppButton(
            onPressed: () async {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) => Center(
                  child: LoadingWidget(color: AppColors.buttoncolor.first),
                ),
              );

              try {
                final response = await ref.read(deactivateUserProvider.future);

                if (context.mounted) {
                  Navigator.pop(context);
                }

                if (response.isSuccess) {
                  if (context.mounted) {
                    context.pushReplacement(AppRoutes.socialLoginScreen.path);
                  }
                } else {
                  if (context.mounted) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(response.message)));
                  }
                }
              } catch (e) {
                if (context.mounted) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("Error: $e")));
                }
              }
            },
            title: "Yes, deactivate",
          ),

          const SizedBox(height: 11),

          AppButton(
            color: Colors.transparent,
            borderColor: customColors.greyColor,
            borderWidth: 1,
            border: true,
            onPressed: () => Navigator.pop(context),
            title: "Cancel",
          ),
        ],
      ),
    );
  }
}
