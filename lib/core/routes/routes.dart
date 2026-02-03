part of '../../drappers.dart';

enum AppRoutes {
  splashScreen('splash', '/splash'),
  onboardingScreen('onboarding', '/onboarding'),
  loginScreen('login', '/login'),
  forgetpasswordScreen('forgetpassword', '/forgetpassword'),
  changePassword('changePassword', '/changePassword'),
  verfiicationcodeScreen('verificationcode', '/verificationcode'),
  home('home', '/home'),
  discover('discover', '/discover'),
  watchlist('watchlist', '/watchlist'),
  editWatchlistScreen('EditWatchlistScreen', '/EditWatchlistScreen'),

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
  reelsviewScreen('ReelsviewScreen', '/ReelsviewScreen'),
  searchscreen('searchscreen', '/searchscreen'),
  startupdetails('Startupdetails', '/Startupdetails'),
  createAccountCodeScreen(
    'createAccountCodeScreen',
    '/createAccountCodeScreen',
  ),
  contentDetail('contentDetail', '/contentDetail'),

  voteForStartupScreen('voteForStartupScreen', '/voteForStartupScreen'),
  newliveScreen('newliveScreen', '/newliveScreen'),
  livepitchesScreen('LivepitchesScreen', '/LivepitchesScreen'),

  videoScreen('videoScreen', '/videoScreen'),
  searchView('searchView', '/searchView'),
  editProfilePopup('editProfilePopup', '/editProfilePopup'),
  socialLoginScreen('socialLoginScreen', '/socialLoginScreen'),
  signupVerification('signupVerification', '/signupVerification');

  final String name;
  final String path;

  const AppRoutes(this.name, this.path);

  static String get initialLocation => AppRoutes.splashScreen.path;

  static List<AppRoutes> get publicRoutes => [
    AppRoutes.splashScreen,
    AppRoutes.signupScreen,
    AppRoutes.loginScreen,
    AppRoutes.socialLoginScreen,
    AppRoutes.forgetpasswordScreen,
    AppRoutes.verfiicationcodeScreen,
    AppRoutes.createAccountCodeScreen,
    AppRoutes.onboardingScreen,
  ];
  static List<AppRoutes> bottomNavPages = [
    AppRoutes.home,
    AppRoutes.discover,
    AppRoutes.watchlist,
    AppRoutes.profile,
  ];

  static List<AppRoutes> guestAllowedRoutes = [
    AppRoutes.home,
    AppRoutes.reelWidget,
    AppRoutes.documentries,
    AppRoutes.trendingshow,
    AppRoutes.continueWatchingViewmore,
    AppRoutes.podcasts,
    AppRoutes.contentDetail,
  ];

  static bool isPublicRoute(GoRouterState state) {
    final fullPath = state.fullPath;

    return fullPath != null &&
        publicRoutes.any((p) {
          return fullPath.startsWith(p.path);
        });
  }
}
