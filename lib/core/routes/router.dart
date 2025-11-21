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
      GoRoute(
        path: AppRoutes.updatepasswordScreen.path,
        name: AppRoutes.updatepasswordScreen.name,
        builder: (context, state) => UpdatepasswordScreen(),
      ),
      GoRoute(
        path: AppRoutes.signupScreen.path,
        name: AppRoutes.signupScreen.name,
        builder: (context, state) => SignupScreen(),
      ),
      GoRoute(
        path: AppRoutes.privacypolicyScreen.path,
        name: AppRoutes.privacypolicyScreen.name,
        builder: (context, state) => PrivacypolicyScreen(),
      ),
      GoRoute(
        path: AppRoutes.faqsScreen.path,
        name: AppRoutes.faqsScreen.name,
        builder: (context, state) => FaqsScreen(),
      ),
      GoRoute(
        path: AppRoutes.editprofile.path,
        name: AppRoutes.editprofile.name,
        builder: (context, state) => EditprofileScreen(),
      ),
      GoRoute(
        path: AppRoutes.termscondition.path,
        name: AppRoutes.termscondition.name,
        builder: (context, state) => Termscondition(),
      ),
      GoRoute(
        path: AppRoutes.savedreel.path,
        name: AppRoutes.savedreel.name,
        builder: (context, state) => Savedreel(),
      ),
      GoRoute(
        path: AppRoutes.helpsupport.path,
        name: AppRoutes.helpsupport.name,
        builder: (context, state) => Helpsupport(),
      ),
      ShellRoute(
        navigatorKey: shellKey,
        builder: (context, state, child) {
          return BottomNavigationBarShell(child: child);
        },
        routes: [
          GoRoute(
            path: AppRoutes.home.path,
            name: AppRoutes.home.name,
            builder: (context, state) => HomeScreen(),
          ),
          GoRoute(
            path: AppRoutes.discover.path,
            name: AppRoutes.discover.name,
            builder: (context, state) => DiscoverScreen(),
          ),
          GoRoute(
            path: AppRoutes.watchlist.path,
            name: AppRoutes.watchlist.name,
            builder: (context, state) => WatchlistScreen(),
          ),
          GoRoute(
            path: AppRoutes.profile.path,
            name: AppRoutes.profile.name,
            builder: (context, state) => ProfileScreen(),
          ),
        ],
      ),
    ],
  );
});
