import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../core/local/domain/repositories/local_storage_repository.dart';
import '../../authentication/data/dto/social_dto/social_dto.dart';
import '../../authentication/domain/repository/auth_repository.dart';

enum SocialType { google, apple }

// Google Sign In Instance Provider
final googleSignInProvider = Provider<GoogleSignIn>((ref) {
  return GoogleSignIn(scopes: ['email', 'profile']);
});

// SocialAuthService Provider
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

      if (googleAuth.idToken == null) {
        debugPrint("Google SignIn Error: idToken is null");
        return null;
      }

      return {
        "subject_token": googleAuth.idToken,
        "subject_id": googleUser.id,
        "subject_email": googleUser.email,
        "subject_issuer": SocialType.google.name,
        "access_token": googleAuth.accessToken,
      };
    } catch (e, st) {
      debugPrint("Google SignIn Error: $e\n$st");
      return null;
    }
  }

  /// API Call to Backend
  Future<bool> onSocialAuthApi(SocialDTO socialDto) async {
    try {
      final repo = ref.read(authRepository);
      final response = await repo.socialLogin(socialDto);

      if (response.isSuccess) {
        final token = response['access_token'];
        final refreshToken = response['refresh_token'];

        final storage = ref.read(localDataProvider);
        await storage.setAccessToken(token);
        await storage.setRefreshToken(refreshToken);
        return true;
      }
    } catch (e) {
      debugPrint("Social Auth API Error: $e");
    }
    return false;
  }
}
