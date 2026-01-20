import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../core/local/domain/repositories/local_storage_repository.dart';
import '../../authentication/data/dto/social_dto/social_dto.dart';
import '../../authentication/domain/models/google_user.dart';
import '../../authentication/domain/repository/auth_repository.dart';
import '../../user/domain/models/user_model.dart';

enum SocialType { google, apple }

final googleSignInProvider = Provider<GoogleSignIn>((ref) {
  return GoogleSignIn(
    scopes: ['email', 'profile'],
    serverClientId:
        '185760183118-ioajrkr6lvuobrhp0oac54jtu6iiv4pe.apps.googleusercontent.com',
  );
});

final socialAuthServiceProvider = Provider<SocialAuthService>((ref) {
  return SocialAuthService(ref);
});

class SocialAuthService {
  final Ref ref;
  SocialAuthService(this.ref);

  Future<Map<String, dynamic>?> googleSignIn() async {
    try {
      final googleSignIn = ref.read(googleSignInProvider);
      if (await googleSignIn.isSignedIn()) {
        await googleSignIn.signOut();
      }
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      debugPrint("Google ID Token: ${googleAuth.idToken}");
      debugPrint("Google Access Token: ${googleAuth.accessToken}");

      return {
        "subject_token": googleAuth.idToken,
        "subject_id": googleUser.id,
        "subject_email": googleUser.email,
        "subject_issuer": "google",
        "access_token": googleAuth.accessToken,
      };
    } catch (e, st) {
      debugPrint("Google SignIn Error: $e\n$st");
      return null;
    }
  }

  Future<bool> onSocialAuthApi(SocialDTO socialDto) async {
    try {
      final repo = ref.read(authRepository);

      final response = await repo.socialLogin(socialDto);

      if (response != null) {
        final googleUserModel = GoogleSocialModel.fromJson(response);
        final storage = ref.read(localDataProvider);
        final data = googleUserModel.data;
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
            type: 'google',
            profileUrl: '',
          );

          await storage.saveUser(userData);
          debugPrint('User saved: ${user.toJson()}');
        }

        return googleUserModel.isSuccess;
      }
    } catch (e, st) {
      debugPrint("Social Auth API Error: $e\n$st");
    }
    return false;
  }
}
