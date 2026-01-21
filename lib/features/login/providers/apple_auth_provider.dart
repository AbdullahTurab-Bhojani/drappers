// ignore_for_file: unused_element

import 'dart:convert';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:crypto/crypto.dart';
import '../../authentication/data/dto/social_dto/social_dto.dart';
import '../../authentication/domain/repository/auth_repository.dart';
import '../../../core/local/domain/repositories/local_storage_repository.dart';
import '../../user/domain/models/user_model.dart';

final appleAuthServiceProvider = Provider<AppleAuthService>((ref) {
  return AppleAuthService(ref);
});

class AppleAuthService {
  final Ref ref;
  AppleAuthService(this.ref);

  String _generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(
      length,
      (_) => charset[random.nextInt(charset.length)],
    ).join();
  }

  String _sha256OfString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  // ---------------- APPLE SIGN IN ----------------

  Future<Map<String, dynamic>?> appleLogin() async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      return {
        "id_token": credential.identityToken, // 🔥 MAIN TOKEN
        "email": credential.email, // ⚠️ first login only
        "apple_user_id": credential.userIdentifier,
        "auth_code": credential.authorizationCode,
      };
    } catch (e) {
      print("Apple login error: $e");
      return null;
    }
  }

  Future<bool> onAppleAuthApi(SocialDTO socialDto) async {
    try {
      final repo = ref.read(authRepository);
      final storage = ref.read(localDataProvider);

      final response = await repo.socialLogin(socialDto);
      if (response == null) return false;

      final accessToken = response['data']?['accessToken'] ?? '';
      final refreshToken = response['data']?['refreshToken'] ?? '';

      if (accessToken.isNotEmpty) {
        await storage.setAccessToken(accessToken);
      }

      if (refreshToken.isNotEmpty) {
        await storage.setRefreshToken(refreshToken);
      }

      final userJson = response['data']?['user'];
      if (userJson != null) {
        final user = UserData.fromJson(userJson);
        await storage.saveUser(user);
      }

      return response['success'] == true;
    } catch (e, st) {
      debugPrint('Apple Auth API Error: $e\n$st');
      return false;
    }
  }
}
