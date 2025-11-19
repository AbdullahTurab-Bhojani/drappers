part of '../../drappers.dart';

enum AppRoutes {
  splashScreen('splash', '/');
  // signupScreen('Signup', '/')

  final String name;
  final String path;

  const AppRoutes(this.name, this.path);

  static String get initialLocation => AppRoutes.splashScreen.path;


  static List<AppRoutes> bottomNavPages = [];

  static List<AppRoutes> get publicRoutes => [
    AppRoutes.splashScreen
  // AppRoutes.signupScreen
  
  
  
  
  ];

  static bool isPublicRoute(GoRouterState state) {
    final fullPath = state.fullPath;

    return fullPath != null &&
        publicRoutes.any((p) {
          return fullPath.startsWith(p.path);
        });
  }
}
