part of '../../drappers.dart';

enum AppRoutes {
  splashScreen('splash', '/'),
  onboardingScreen('onboarding', '/onboarding'),
  loginScreen('login', '/login'),
  forgetpasswordScreen('forgetpassword', '/forgetpassword'),
  verfiicationcodeScreen('verificationcode', '/verificationcode'),
  home('home', '/home'),
  discover('discover', '/discover'),
  watchlist('watchlist', '/watchlist'),
  signupScreen('signup', '/signup'),
  updatepasswordScreen('updatepassword', '/updatepassword'),
  profile('profile', '/profile'),
  privacypolicyScreen('PrivacypolicyScreen', '/PrivacypolicyScreen'),
  faqsScreen('FaqsScreen', '/FaqsScreen'),
  editprofile('editprofile', '/editprofile'),
  settingpreferencesScreen(
    'SettingpreferencesScreen',
    '/SettingpreferencesScreen',
  ),
  deleteDetailScreen('deleteDetailScreen', '/deleteDetailScreen'),
  deleteAccountScreen('deleteAccountScreen', '/deleteAccountScreen'),
  deactivateAccountScreen('deactivateAccountScreen', '/deactivateAccountScreen'),
  termscondition('termscondition', '/termscondition'),
  savedreel('savedreel', '/savedreel'),
  helpsupport('helpsupport', '/helpsupport'),
  trendingshow('trendingshow', '/trendingshow'),
  podcasts('podcasts', '/podcasts'),
  reelWidget('reelWidget', '/reelWidget'),
  documentries ('documentries', '/documentries'),
  applyPitch  ('applyPitch', '/applyPitch'),
  voteForStartupScreen('voteForStartupScreen', '/voteForStartupScreen'),
  Searchscreen('searchscreen', '/searchscreen');






  final String name;
  final String path;

  const AppRoutes(this.name, this.path);

  static String get initialLocation => AppRoutes.splashScreen.path;

  static List<AppRoutes> get publicRoutes => [
    AppRoutes.splashScreen,
    AppRoutes.signupScreen,
  ];
  static List<AppRoutes> bottomNavPages = [
    AppRoutes.home,
    AppRoutes.discover,
    AppRoutes.watchlist,
    AppRoutes.profile,
  ];

  static bool isPublicRoute(GoRouterState state) {
    final fullPath = state.fullPath;

    return fullPath != null &&
        publicRoutes.any((p) {
          return fullPath.startsWith(p.path);
        });
  }
}
