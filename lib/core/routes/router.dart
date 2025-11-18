part of '../../drappers.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final shellKey = GlobalKey<NavigatorState>();
final homeKey = GlobalKey<NavigatorState>();
final routerConfigProvider = Provider((ref) {
  return GoRouter(
    debugLogDiagnostics: kDebugMode,
    navigatorKey: navigatorKey,

    initialLocation: AppRoutes.home.path,

    redirect: (context, state) {
      return null;
    },

    routes: [],
  );
});
