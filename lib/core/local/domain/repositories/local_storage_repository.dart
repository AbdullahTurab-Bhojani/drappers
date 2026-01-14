import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/models/user_model.dart';
import '../../providers/shared_pref.dart';
import 'shared_preference_repository.dart';

/// ================= INTERFACE =================

abstract interface class SharedPrefService {
  Future<bool> setLogout();
  Future<bool> setIsLogin();
  bool get isLogin;

  Future<bool> setAccessToken(String token);
  String? get accessToken;

  Future<bool> setAccessTokenMarket(String token);
  String? get marketAccessToken;

  Future<bool> setRefreshTokenMarket(String token);
  String? get marketRefreshToken;

  Future<bool> setAccessTokenMarketNew(String token);
  String? get marketAccessTokenNew;

  Future<bool> setRefreshTokenMarketNew(String token);
  String? get marketRefreshTokenNew;

  Future<bool> setRememberMe(String rememberMe);
  String? get getRemamberMe;

  Future<bool> setEmail(String email);
  String? get getEmail;

  Future<bool> setPassword(String password);
  String? get getPassword1;

  Future<void> setIsFirstTime(bool value);
  bool getIsFirstTime();

  Future<bool> clearAllData();

  Future<void> saveUserName(String userName);
  String? get getUserName;

  Future<void> saveUserId(String userId);
  String get getUserId;

  Future<void> removeUserId(String userId);

  /// ✅ Device
  String? get getdeviceId;
  Future<void> saveDeviceId(String deviceId);

  /// ✅ FCM
  String? get getfcmToken;
  Future<void> saveFcmToken(String fcmToken);

  /// ✅ User
  Future<void> saveUser(UserData user);
  Future<UserData?> getUser();

  Future<void> saveLatitude(double value);
  Future<void> saveLongitude(double value);
  double? getLatitude();
  double? getLongitude();
  Future<void> saveTheme(String themeName);
  String getTheme();
}

/// ================= PROVIDER =================

final localDataProvider = Provider<SharedPrefService>(
  (ref) => SharedPreferencesService(
    ref.read(sharedPreferencesProvider).requireValue,
  ),
);
