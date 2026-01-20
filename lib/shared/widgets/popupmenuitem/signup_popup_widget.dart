import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/extensions/theme_extension.dart';
import '../../../core/theme/app_scalar.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';
import 'provider/logout_provider.dart';

class SignupPopupWidget extends ConsumerStatefulWidget {
  const SignupPopupWidget({super.key});

  @override
  ConsumerState<SignupPopupWidget> createState() => _SignupPopupWidget();
}

class _SignupPopupWidget extends ConsumerState<SignupPopupWidget> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(logoutProviderProvider);
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;

    /// 🔥 LISTENER (navigation + snackbar)
    ref.listen<AppLoadingState>(logoutProviderProvider, (previous, next) {
      if (next.isSuccess) {
        context.goNamed(AppRoutes.socialLoginScreen.name);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Logged out successfully')),
        );
      }

      if (next.isError) {
        context.goNamed(AppRoutes.socialLoginScreen.name);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(next.message ?? 'Logged out')));
      }
    });

    return IntrinsicWidth(
      child: Container(
        padding: EdgeInsets.all(AppScaler.scaleSize(context, 20)),
        decoration: BoxDecoration(
          color: customColors.regular,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              Assets.images.logout123.path,
              height: AppScaler.scaleHeight(context, 54),
            ),

            SizedBox(height: AppScaler.scaleHeight(context, 30)),

            PoppinsText(
              context,
              "Are you sure you want to Sign Out?",
              textAlign: TextAlign.center,
              fontSize: PoppinsFontSizeVariant.size16,
              fontWeight: PoppinsFontWeightVariant.medium,
            ),

            SizedBox(height: AppScaler.scaleHeight(context, 30)),
            AppButton(
              onPressed: () async {
                if (!state.isLoading) {
                  await ref.read(logoutProviderProvider.notifier).logout();
                }
              },
              title: state.isLoading ? "Loading..." : "Continue",
            ),

            SizedBox(height: AppScaler.scaleHeight(context, 14)),

            AppButton(
              color: Colors.transparent,
              border: true,
              borderColor: customColors.greyColor,
              onPressed: () => Navigator.pop(context),
              title: "Cancel",
            ),
          ],
        ),
      ),
    );
  }
}
