// ignore_for_file: annotate_overrides

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../shared/models/user_model.dart';
import 'local_storage_repository.dart';

class SharedPreferencesService implements SharedPrefService {
  SharedPreferencesService(this.sharedPreferences);

  final SharedPreferences sharedPreferences;

  final _tokenKey = 'access-token';
  final _isFirstTimeKey = 'is-first-time';
  final _idKey = 'id-user';
  final _loginKey = 'login';
  final _userKey = 'user';
  final _userNameKey = 'user-name';
  final _marketAccessToken = 'metaAccessToken';
  final _marketAccessTokenNew = 'metaAccessTokenNew';
  final _marketRefreshToken = 'metaRefreshToken';
  final _marketRefreshTokenNew = 'metaRefreshTokenNew';
  final _emailKey = 'setEmail';
  final _rememberMeKey = 'rememberMe';
  final _passwordKey = 'password';
  final themeKey = 'selected_theme';

  static const _deviceIdKey = 'device_id';
  static const _fcmTokenKey = 'fcm_token';

  // ---------------- AUTH ----------------

  @override
  String? get accessToken => sharedPreferences.getString(_tokenKey);

  @override
  Future<bool> setAccessToken(String token) async {
    return sharedPreferences.setString(_tokenKey, token);
  }

  @override
  Future<bool> setLogout() async {
    await sharedPreferences.setBool(_loginKey, false);
    await setAccessToken('');
    return true;
  }

  @override
  Future<bool> setIsLogin() async {
    return sharedPreferences.setBool(_loginKey, true);
  }

  @override
  bool get isLogin => sharedPreferences.getBool(_loginKey) ?? false;

  // ---------------- MARKET ----------------

  @override
  String? get marketAccessToken =>
      sharedPreferences.getString(_marketAccessToken);

  @override
  Future<bool> setAccessTokenMarket(String token) async {
    return sharedPreferences.setString(_marketAccessToken, token);
  }

  @override
  String? get marketAccessTokenNew =>
      sharedPreferences.getString(_marketAccessTokenNew);

  @override
  Future<bool> setAccessTokenMarketNew(String token) async {
    return sharedPreferences.setString(_marketAccessTokenNew, token);
  }

  @override
  String? get marketRefreshToken =>
      sharedPreferences.getString(_marketRefreshToken);

  @override
  Future<bool> setRefreshTokenMarket(String token) async {
    return sharedPreferences.setString(_marketRefreshToken, token);
  }

  @override
  String? get marketRefreshTokenNew =>
      sharedPreferences.getString(_marketRefreshTokenNew);

  @override
  Future<bool> setRefreshTokenMarketNew(String token) async {
    return sharedPreferences.setString(_marketRefreshTokenNew, token);
  }

  // ---------------- USER PREFS ----------------

  @override
  String? get getUserName => sharedPreferences.getString(_userNameKey);

  @override
  Future<void> saveUserName(String userName) async {
    await sharedPreferences.setString(_userNameKey, userName);
  }

  @override
  String get getUserId => sharedPreferences.getString(_idKey) ?? '';

  @override
  Future<void> saveUserId(String userId) async {
    await sharedPreferences.setString(_idKey, userId);
  }

  @override
  Future<void> removeUserId(String userId) async {
    await sharedPreferences.remove(_idKey);
  }

  @override
  String? get getEmail => sharedPreferences.getString(_emailKey);

  @override
  Future<bool> setEmail(String email) async {
    return sharedPreferences.setString(_emailKey, email);
  }

  @override
  String? get getRemamberMe => sharedPreferences.getString(_rememberMeKey);

  @override
  Future<bool> setRememberMe(String rememberMe) async {
    return sharedPreferences.setString(_rememberMeKey, rememberMe);
  }

  @override
  String? get getPassword1 => sharedPreferences.getString(_passwordKey);

  @override
  Future<bool> setPassword(String password) async {
    return sharedPreferences.setString(_passwordKey, password);
  }

  // ---------------- FIRST TIME ----------------

  @override
  bool getIsFirstTime() => sharedPreferences.getBool(_isFirstTimeKey) ?? true;

  @override
  Future<void> setIsFirstTime(bool value) async {
    await sharedPreferences.setBool(_isFirstTimeKey, value);
  }

  // ---------------- USER OBJECT ----------------

  @override
  Future<void> saveUser(UserData user) async {
    await sharedPreferences.setString(_userKey, jsonEncode(user.toJson()));
  }

  @override
  Future<UserData?> getUser() async {
    final userJson = sharedPreferences.getString(_userKey);
    if (userJson == null) return null;
    return UserData.fromJson(jsonDecode(userJson));
  }

  // ---------------- DEVICE & FCM ----------------

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

  // ---------------- CLEAR ----------------

  @override
  Future<bool> clearAllData() async {
    return sharedPreferences.clear();
  }

  // ---------------- LOCATION ----------------
  Future<void> saveLatitude(double value) async {
    await sharedPreferences.setDouble('latitude', value);
  }

  Future<void> saveLongitude(double value) async {
    await sharedPreferences.setDouble('longitude', value);
  }

  double? getLatitude() {
    return sharedPreferences.getDouble('latitude');
  }

  double? getLongitude() {
    return sharedPreferences.getDouble('longitude');
  }

  @override
  Future<void> saveTheme(String themeName) async {
    await sharedPreferences.setString(themeKey, themeName);
  }

  @override
  String getTheme() {
    return sharedPreferences.getString(themeKey) ?? 'default';
  }
}
