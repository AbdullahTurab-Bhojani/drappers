// ignore_for_file: annotate_overrides

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../features/user/domain/models/user_model.dart';
import 'local_storage_repository.dart';

class SharedPreferencesService implements SharedPrefService {
  SharedPreferencesService(this.sharedPreferences);

  final SharedPreferences sharedPreferences;

  static const _tokenKey = 'access-token';
  static const _refreshTokenKey = 'refresh-token';
  static const _isFirstTimeKey = 'is-first-time';
  static const _idKey = 'id-user';
  static const _loginKey = 'login';
  static const _userKey = 'user';
  static const _userNameKey = 'user-name';

  static const _emailKey = 'setEmail';
  static const _rememberMeKey = 'rememberMe';
  static const _passwordKey = 'password';
  static const themeKey = 'selected_theme';

  static const _deviceIdKey = 'device_id';
  static const _fcmTokenKey = 'fcm_token';

  @override
  String? get accessToken => sharedPreferences.getString(_tokenKey);

  @override
  String? get refreshToken => sharedPreferences.getString(_refreshTokenKey);

  @override
  Future<bool> setAccessToken(String token) async {
    return sharedPreferences.setString(_tokenKey, token);
  }

  @override
  Future<bool> setRefreshToken(String token) async {
    return sharedPreferences.setString(_refreshTokenKey, token);
  }

  @override
  Future<bool> setIsLogin() async {
    return sharedPreferences.setBool(_loginKey, true);
  }

  @override
  bool get isLogin => sharedPreferences.getBool(_loginKey) ?? false;

  @override
  Future<bool> setLogout() async {
    await sharedPreferences.remove(_tokenKey);
    await sharedPreferences.remove(_refreshTokenKey);
    await sharedPreferences.remove(_userKey);
    await sharedPreferences.remove(_idKey);
    await sharedPreferences.remove(_userNameKey);
    await sharedPreferences.remove(_emailKey);
    await sharedPreferences.remove(_passwordKey);
    await sharedPreferences.remove(_rememberMeKey);
    await sharedPreferences.remove(_fcmTokenKey);
    await sharedPreferences.remove(_deviceIdKey);

    await sharedPreferences.setBool(_loginKey, false);
    return true;
  }

  @override
  Future<void> saveUser(UserData user) async {
    await sharedPreferences.setString(_userKey, jsonEncode(user.toJson()));
  }

  @override
  Future<UserData?> getUser() async {
    final data = sharedPreferences.getString(_userKey);
    if (data == null) return null;
    return UserData.fromJson(jsonDecode(data));
  }

  @override
  Future<void> saveUserId(String userId) async {
    await sharedPreferences.setString(_idKey, userId);
  }

  @override
  String get getUserId => sharedPreferences.getString(_idKey) ?? '';

  @override
  Future<void> saveUserName(String userName) async {
    await sharedPreferences.setString(_userNameKey, userName);
  }

  @override
  String? get getUserName => sharedPreferences.getString(_userNameKey);

  @override
  bool getIsFirstTime() => sharedPreferences.getBool(_isFirstTimeKey) ?? true;

  @override
  Future<void> setIsFirstTime(bool value) async {
    await sharedPreferences.setBool(_isFirstTimeKey, value);
  }

  @override
  Future<bool> clearAllData() async {
    return sharedPreferences.clear();
  }

  @override
  String? get getdeviceId => sharedPreferences.getString(_deviceIdKey);

  @override
  Future<void> saveDeviceId(String deviceId) async {
    await sharedPreferences.setString(_deviceIdKey, deviceId);
  }

  @override
  String? get getfcmToken => sharedPreferences.getString(_fcmTokenKey);

  @override
  Future<void> saveFcmToken(String fcmToken) async {
    await sharedPreferences.setString(_fcmTokenKey, fcmToken);
  }

  @override
  Future<void> saveTheme(String themeName) async {
    await sharedPreferences.setString(themeKey, themeName);
  }

  @override
  String getTheme() => sharedPreferences.getString(themeKey) ?? 'default';

  @override
  Future<void> saveLatitude(double value) async {
    await sharedPreferences.setDouble('latitude', value);
  }

  @override
  Future<void> saveLongitude(double value) async {
    await sharedPreferences.setDouble('longitude', value);
  }

  @override
  double? getLatitude() => sharedPreferences.getDouble('latitude');

  @override
  double? getLongitude() => sharedPreferences.getDouble('longitude');
}
