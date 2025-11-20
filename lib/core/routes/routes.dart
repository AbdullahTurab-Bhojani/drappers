part of '../../drappers.dart';

enum AppRoutes {
  splashScreen('splash', '/'),
  onboardingScreen('onboarding', '/onboarding'),
  loginScreen('login', '/login'),
  forgetpasswordScreen('forgetpassword', '/forgetpassword'),
  verfiicationcodeScreen('verificationcode', '/verificationcode'),
  dashboard('dashboard', '/dashboard'),
  signupScreen('signup', '/signup');

  final String name;
  final String path;

  const AppRoutes(this.name, this.path);

  static String get initialLocation => AppRoutes.splashScreen.path;

  static List<AppRoutes> get publicRoutes => [
    AppRoutes.splashScreen,
    AppRoutes.signupScreen,
  ];
  static List<AppRoutes> bottomNavPages = [AppRoutes.dashboard];

  static bool isPublicRoute(GoRouterState state) {
    final fullPath = state.fullPath;

    return fullPath != null &&
        publicRoutes.any((p) {
          return fullPath.startsWith(p.path);
        });
  }
}
