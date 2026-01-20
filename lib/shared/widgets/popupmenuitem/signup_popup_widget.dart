import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/extensions/theme_extension.dart';
import '../../../core/local/domain/repositories/local_storage_repository.dart';
import '../../../core/theme/app_scalar.dart';
import '../../../drappers.dart';
import '../../../features/authentication/data/dto/logout_dto/logout_dto.dart';
import '../../../features/authentication/domain/repository/auth_repository.dart';
import '../../../gen/assets.gen.dart';

class SignupPopupWidget extends ConsumerStatefulWidget {
  final bool showSaveIcon;

  const SignupPopupWidget({super.key, this.showSaveIcon = true});

  @override
  ConsumerState<SignupPopupWidget> createState() => _SignupPopupWidget();
}

class _SignupPopupWidget extends ConsumerState<SignupPopupWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;

    return IntrinsicWidth(
      child: Container(
        padding: EdgeInsets.only(
          top: AppScaler.scaleHeight(context, 24),
          bottom: AppScaler.scaleHeight(context, 24),
          left: AppScaler.scaleSize(context, 20),
          right: AppScaler.scaleSize(context, 20),
        ),
        decoration: BoxDecoration(
          color: customColors.regular,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              Assets.images.logout123.path,
              height: AppScaler.scaleHeight(context, 54),
              width: AppScaler.scaleSize(context, 54),
            ),

            SizedBox(height: AppScaler.scaleHeight(context, 40)),

            PoppinsText(
              context,
              "Are you sure you want to Sign Out?",
              fontSize: PoppinsFontSizeVariant.size16,
              fontWeight: PoppinsFontWeightVariant.medium,
              color: customColors.textColor,
              textAlign: TextAlign.center,
            ),

            SizedBox(height: AppScaler.scaleHeight(context, 40)),

            AppButton(
              onPressed: () async {
                final router = GoRouter.of(context);
                final messenger = ScaffoldMessenger.of(context);
                if (mounted) Navigator.of(context).pop();
                final localData = ref.read(localDataProvider);
                final authApi = ref.read(authRepository);
                final token = localData.refreshToken;
                String message = "Logged out successfully";

                try {
                  if (token != null && token.isNotEmpty) {
                    final response = await authApi.logout(
                      LogoutDTO(refreshToken: token),
                    );
                    message = response.message;
                  }

                  await localData.clearAllData();

                  if (mounted) {
                    messenger.showSnackBar(SnackBar(content: Text(message)));
                    router.goNamed(AppRoutes.socialLoginScreen.name);
                  }
                } catch (e) {
                  await localData.clearAllData();

                  if (mounted) {
                    messenger.showSnackBar(
                      SnackBar(content: Text('Logged out locally')),
                    );
                    router.goNamed(AppRoutes.socialLoginScreen.name);
                  }
                }
              },
              title: "Sign Out",
            ),

            SizedBox(height: AppScaler.scaleHeight(context, 14)),
            AppButton(
              color: Colors.transparent,
              borderColor: customColors.greyColor,
              borderWidth: 1,
              border: true,
              onPressed: () {
                Navigator.pop(context, false);
              },
              title: "Cancel",
            ),
          ],
        ),
      ),
    );
  }
}
