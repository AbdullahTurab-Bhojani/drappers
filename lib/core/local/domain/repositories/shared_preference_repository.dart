part of '../../../../drappers.dart';

class SharedPreferencesService implements SharedPrefService {
  SharedPreferencesService(this.sharedPreferences);

  final SharedPreferences sharedPreferences;

  final _tokenKey = 'access-token';
  final _isFirstTimeKey = 'is-first-time';
  final idKey = 'id-user';
  final transcribeBaseUrlKey = 'transcribeBaseUrl';
  final isGuestKey = 'is-guest-user';

  final login = 'login';
  final profileComplete = 'profile-complete';
  final languageCodeKey = 'language-code';
  final countryCodeKey = 'country-code';
  final themeKey = 'selected_theme';

  @override
  Future<String?> get accessToken async {
    // final currentUser = FirebaseAuth.instance.currentUser;
    // if (currentUser == null) return null;

    // final result = await currentUser.getIdTokenResult();
    // final expiry = result.expirationTime?.subtract(Duration(minutes: 10));
    // final now = DateTime.now();

    // String? token = sharedPreferences.getString(_tokenKey);

    // // 10 minutes before expiry

    // final shouldRefresh =
    //     token == null || expiry == null || now.isAfter(expiry);

    // if (shouldRefresh) {
    //   token = await currentUser.getIdToken(true); // Force refresh
    //   await sharedPreferences.setString(_tokenKey, token ?? "");
    // }

    return null;
  }

  @override
  Future<bool> setAccessToken(String token) async {
    debugPrint("setAccessToken ${token}");

    await sharedPreferences.setBool(isGuestKey, false);
    return await sharedPreferences.setString(_tokenKey, token);
  }

  @override
  Future<bool> setCompleteProfile() async {
    return await sharedPreferences.setBool(profileComplete, true);
  }

  @override
  Future<bool> setIsGuest() async {
    return await sharedPreferences.setBool(isGuestKey, true);
  }

  @override
  bool get isCompleteProfile =>
      sharedPreferences.getBool(profileComplete) ?? false;

  @override
  bool get isLoginTutor => getUserId.isNotEmpty && isCompleteProfile;
  @override
  bool get isLoginLearner => getUserId.isNotEmpty && isCompleteProfile;
  @override
  bool getIsFirstTime() {
    return sharedPreferences.getBool(_isFirstTimeKey) ?? true;
  }

  @override
  Future<void> setIsFirstTime(bool value) async {
    await sharedPreferences.setBool(_isFirstTimeKey, value);
  }

  @override
  Future<bool> clearAllData() async {
    return await sharedPreferences.clear();
  }

  @override
  String get getUserId => sharedPreferences.getString(idKey) ?? "";

  @override
  bool get isGuest => sharedPreferences.getBool(isGuestKey) ?? false;

  @override
  Future<void> saveUserId(String userId) {
    return sharedPreferences.setString(idKey, userId);
  }

  @override
  Future<void> removeUserId(String userId) {
    return sharedPreferences.remove(idKey);
  }

  @override
  String get transcribeBaseUrl =>
      sharedPreferences.getString(transcribeBaseUrlKey) ?? '';
  @override
  Future<void> setTranscribeBaseUrl(String baseUrl) async {
    await sharedPreferences.setString(transcribeBaseUrlKey, baseUrl);
  }

  @override
  String get languageCode =>
      sharedPreferences.getString(languageCodeKey) ?? 'en';
  @override
  String get countryCode => sharedPreferences.getString(countryCodeKey) ?? 'en';
  @override
  Future<void> setLanguageCode(String languageCode) async {
    await sharedPreferences.setString(languageCodeKey, languageCode);
  }

  @override
  Future<void> setCountryCode(String countryCode) async {
    await sharedPreferences.setString(countryCodeKey, countryCode);
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
