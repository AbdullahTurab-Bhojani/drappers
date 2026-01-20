import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../core/local/domain/repositories/local_storage_repository.dart';
import '../../authentication/data/dto/social_dto/social_dto.dart';
import '../../authentication/domain/models/google_user.dart';
import '../../authentication/domain/repository/auth_repository.dart';
import '../../user/domain/models/user_model.dart';

final appleAuthServiceProvider = Provider<AppleAuthService>((ref) {
  return AppleAuthService(ref);
});

class AppleAuthService {
  final Ref ref;
  AppleAuthService(this.ref);

  Future<Map<String, dynamic>?> appleSignIn() async {
    try {
      if (!Platform.isIOS) {
        debugPrint('Apple Sign-In is only available on iOS');
        return null;
      }

      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      debugPrint("Apple ID Token: ${credential.identityToken}");
      debugPrint("Apple Auth Code: ${credential.authorizationCode}");

      return {
        "subject_token": credential.identityToken,
        "subject_id": credential.userIdentifier,
        "subject_email": credential.email,
        "subject_issuer": "apple",
        "access_token": credential.authorizationCode,
      };
    } catch (e, st) {
      debugPrint("Apple SignIn Error: $e\n$st");
      return null;
    }
  }

  Future<bool> onAppleAuthApi(SocialDTO socialDto) async {
    try {
      final repo = ref.read(authRepository);
      final response = await repo.socialLogin(socialDto);

      if (response != null) {
        final appleUserModel = GoogleSocialModel.fromJson(response);
        final storage = ref.read(localDataProvider);

        final data = appleUserModel.data;
        final accessToken = data!.accessToken;
        final refreshToken = data.refreshToken;

        if (accessToken.isNotEmpty) {
          await storage.setAccessToken(accessToken);
        }

        if (refreshToken.isNotEmpty) {
          await storage.setRefreshToken(refreshToken);
        }

        final user = data.user;
        if (user != null) {
          final userData = UserData(
            keycloakUserId: user.sub,
            email: user.email,
            fullName: user.name,
            firstName: user.givenName,
            lastName: user.familyName,
            type: 'apple',
            profileUrl: '',
          );

          await storage.saveUser(userData);
          debugPrint('Apple user saved: ${user.toJson()}');
        }

        return appleUserModel.isSuccess;
      }
    } catch (e, st) {
      debugPrint("Apple Auth API Error: $e\n$st");
    }
    return false;
  }
}
