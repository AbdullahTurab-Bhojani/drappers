part of '../../../../drappers.dart';

abstract interface class SharedPrefService {
  Future<bool> setCompleteProfile();
  Future<bool> setIsGuest();
  bool get isLoginTutor;
  bool get isLoginLearner;
  bool get isCompleteProfile;
  bool get isGuest;

  Future<bool> setAccessToken(String token);

  Future<String?> get accessToken;

  Future<void> setIsFirstTime(bool value);

  bool getIsFirstTime();

  Future<bool> clearAllData();

  Future<void> saveUserId(String userId);

  String get getUserId;
  String get transcribeBaseUrl;
  Future<void> setTranscribeBaseUrl(String baseUrl);

  Future<void> removeUserId(String userType);

  String get languageCode;
  String get countryCode;
  Future<void> setLanguageCode(String languageCode);
  Future<void> setCountryCode(String countryCode);
  Future<void> saveTheme(String themeName);
  String getTheme();
}

final localDataProvider = Provider<SharedPrefService>(
  (ref) => SharedPreferencesService(
    ref.read(sharedPreferencesProvider).requireValue,
  ),
);
