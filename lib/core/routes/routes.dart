part of '../../drappers.dart';

enum AppRoutes {
  splashScreen('splash', '/'),
  onboardingScreen('onboarding', '/onboarding'),
  loginScreen('login', '/login'),
  forgetpasswordScreen('forgetpassword', '/forgetpassword'),
  changePassword('changePassword', '/changePassword'),
  verfiicationcodeScreen('verificationcode', '/verificationcode'),
  home('home', '/home'),
  discover('discover', '/discover'),
  watchlist('watchlist', '/watchlist'),
    EditWatchlistScreen('EditWatchlistScreen', '/EditWatchlistScreen'),

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
  deactivateAccountScreen(
    'deactivateAccountScreen',
    '/deactivateAccountScreen',
  ),
  reportContent('reportContent', '/reportContent'),
  reportContentSomehingElse(
    'reportContentSomehingElse',
    '/reportContentSomehingElse',
  ),
  termscondition('termscondition', '/termscondition'),
  savedreel('savedreel', '/savedreel'),
  helpsupport('helpsupport', '/helpsupport'),
  trendingshow('trendingshow', '/trendingshow'),
  podcasts('podcasts', '/podcasts'),
  reelWidget('reelWidget', '/reelWidget'),
  documentries('documentries', '/documentries'),
  applyPitch('applyPitch', '/applyPitch'),
  likecontent('likecontent', '/likecontent'),
  continueWatchingViewmore(
    'continueWatchingViewmore',
    '/continueWatchingViewmore',
  ),
  watchHistoryViewmore('watchHistoryViewmore', '/watchHistoryViewmore'),
  notificationScreen('notificationScreen', '/notificationScreen'),
  notificationSetting('notificationSetting', '/notificationSetting'),
  ReelsviewScreen('ReelsviewScreen', '/ReelsviewScreen'),
  searchscreen('searchscreen', '/searchscreen'),
  Startupdetails('Startupdetails', '/Startupdetails'),
  createAccountCodeScreen(
    'createAccountCodeScreen',
    '/createAccountCodeScreen',
  ),
  contentDetail('contentDetail', '/contentDetail'),

  voteForStartupScreen('voteForStartupScreen', '/voteForStartupScreen'),
    newliveScreen('newliveScreen', '/newliveScreen'),
    LivepitchesScreen('LivepitchesScreen', '/LivepitchesScreen'),

  videoScreen('videoScreen', '/videoScreen');

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
