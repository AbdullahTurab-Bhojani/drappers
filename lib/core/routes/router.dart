part of '../../drappers.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final shellKey = GlobalKey<NavigatorState>();
final homeKey = GlobalKey<NavigatorState>();
final routerConfigProvider = Provider((ref) {
  return GoRouter(
    debugLogDiagnostics: kDebugMode,
    navigatorKey: navigatorKey,
    initialLocation: AppRoutes.splashScreen.path,
    redirect: (context, state) {
      return null;
    },
    routes: [
      GoRoute(
        path: AppRoutes.splashScreen.path,
        name: AppRoutes.splashScreen.name,
        builder: (context, state) => SplashScreen(),
      ),
       GoRoute(
        path: AppRoutes.onboardingScreen.path,
        name: AppRoutes.onboardingScreen.name,
        builder: (context, state) => OnboardingScreen(),
      ),
       GoRoute(
        path: AppRoutes.loginScreen.path,
        name: AppRoutes.loginScreen.name,
        builder: (context, state) => LoginScreen(),
      ),
       GoRoute(
        path: AppRoutes.forgetpasswordScreen.path,
        name: AppRoutes.forgetpasswordScreen.name,
        builder: (context, state) => ForgetpasswordScreen(),
      ),
      GoRoute(
        path: AppRoutes.verfiicationcodeScreen.path,
        name: AppRoutes.verfiicationcodeScreen.name,
        builder: (context, state) => VerfiicationcodeScreen(),
      ),
    ],
  );
});
