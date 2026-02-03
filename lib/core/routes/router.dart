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
      final localData = ref.read(localDataProvider);
      String? accessToken = localData.accessToken;
      bool isLogin = accessToken?.isNotEmpty ?? false;
      bool isPublic = AppRoutes.isPublicRoute(state);
      bool isGuest = GuestHelper.isGuest;
      final String? fullPath = state.fullPath;

      debugPrint(
        "🔁 Redirect : isLogin: $isLogin | isPublic: $isPublic | isGuest: $isGuest | path: ${state.fullPath}",
      );

      if (!isPublic && !isLogin && !isGuest) {
        return AppRoutes.splashScreen.path;
      }
      if (isGuest && fullPath != null) {
        final bool isGuestAllowed = AppRoutes.guestAllowedRoutes.any(
          (route) => fullPath.startsWith(route.path),
        );
        if (!isGuestAllowed) {
          return AppRoutes.home.path;
        }
      }

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
        path: AppRoutes.socialLoginScreen.path,
        name: AppRoutes.socialLoginScreen.name,
        builder: (context, state) => SocialLoginScreen(),
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
        path: AppRoutes.changePassword.path,
        name: AppRoutes.changePassword.name,
        builder: (context, state) => ChangePassword(),
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
      GoRoute(
        path: AppRoutes.trendingshow.path,
        name: AppRoutes.trendingshow.name,
        builder: (context, state) => TrendingshowWidget(),
      ),
      GoRoute(
        path: AppRoutes.podcasts.path,
        name: AppRoutes.podcasts.name,
        builder: (context, state) => PodcastWidget(),
      ),
      GoRoute(
        path: AppRoutes.reelWidget.path,
        name: AppRoutes.reelWidget.name,
        builder: (context, state) => ReelWidget(),
      ),
      GoRoute(
        path: AppRoutes.documentries.path,
        name: AppRoutes.documentries.name,
        builder: (context, state) => Documentriescard(),
      ),
      GoRoute(
        path: AppRoutes.applyPitch.path,
        name: AppRoutes.applyPitch.name,
        builder: (context, state) => ApplyPitch(),
      ),
      GoRoute(
        path: AppRoutes.signupVerification.path,
        name: AppRoutes.signupVerification.name,
        builder: (context, state) => SignupVerification(),
      ),
      GoRoute(
        path: AppRoutes.voteForStartupScreen.path,
        name: AppRoutes.voteForStartupScreen.name,
        builder: (context, state) => VoteForStartupScreen(),
      ),
      GoRoute(
        path: AppRoutes.continueWatchingViewmore.path,
        name: AppRoutes.continueWatchingViewmore.name,
        builder: (context, state) => ContinueWatchingViewmore(),
      ),
      GoRoute(
        path: AppRoutes.watchHistoryViewmore.path,
        name: AppRoutes.watchHistoryViewmore.name,
        builder: (context, state) => WatchHistoryViewmore(),
      ),
      GoRoute(
        path: AppRoutes.notificationScreen.path,
        name: AppRoutes.notificationScreen.name,
        builder: (context, state) => NotificationScreen(),
      ),
      GoRoute(
        path: AppRoutes.notificationSetting.path,
        name: AppRoutes.notificationSetting.name,
        builder: (context, state) => NotificationSetting(),
      ),
      GoRoute(
        path: AppRoutes.createAccountCodeScreen.path,
        name: AppRoutes.createAccountCodeScreen.name,
        builder: (context, state) => CreateAccountCodeScreen(),
      ),
      GoRoute(
        path: AppRoutes.contentDetail.path,
        name: AppRoutes.contentDetail.name,
        builder: (context, state) => ContentDetail(),
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
            path: AppRoutes.editWatchlistScreen.path,
            name: AppRoutes.editWatchlistScreen.name,
            builder: (context, state) => EditWatchlistScreen(),
          ),
          GoRoute(
            path: AppRoutes.profile.path,
            name: AppRoutes.profile.name,
            builder: (context, state) => ProfileScreen(),
          ),
        ],
      ),

      GoRoute(
        path: AppRoutes.settingpreferencesScreen.path,
        name: AppRoutes.settingpreferencesScreen.name,
        builder: (context, state) => SettingpreferencesScreen(),
      ),
      GoRoute(
        path: AppRoutes.deleteAccountScreen.path,
        name: AppRoutes.deleteAccountScreen.name,
        builder: (context, state) => DeleteAccount(),
      ),
      GoRoute(
        path: AppRoutes.deactivateAccountScreen.path,
        name: AppRoutes.deactivateAccountScreen.name,
        builder: (context, state) => DeactivateAccountScreen(),
      ),
      GoRoute(
        path: AppRoutes.searchscreen.path,
        name: AppRoutes.searchscreen.name,
        builder: (context, state) => Searchscreen(),
      ),
      GoRoute(
        path: AppRoutes.likecontent.path,
        name: AppRoutes.likecontent.name,
        builder: (context, state) => Likecontent(),
      ),
      GoRoute(
        path: AppRoutes.deleteDetailScreen.path,
        name: AppRoutes.deleteDetailScreen.name,
        builder: (context, state) => DeleteDetailScreen(),
      ),
      GoRoute(
        path: AppRoutes.reportContent.path,
        name: AppRoutes.reportContent.name,
        builder: (context, state) => ReportContent(),
      ),
      GoRoute(
        path: AppRoutes.reelsviewScreen.path,
        name: AppRoutes.reelsviewScreen.name,
        builder: (context, state) => ReelsviewScreen(),
      ),
      GoRoute(
        path: AppRoutes.reportContentSomehingElse.path,
        name: AppRoutes.reportContentSomehingElse.name,
        builder: (context, state) => ReportContentSomehingElse(),
      ),
      GoRoute(
        name: AppRoutes.startupdetails.name,
        path: '/startup-details',
        builder: (context, state) {
          final id = state.extra as int;
          return Startupdetails(startupId: id);
        },
      ),

      GoRoute(
        path: AppRoutes.newliveScreen.path,
        name: AppRoutes.newliveScreen.name,
        builder: (context, state) => Newlivescreen(),
      ),
      GoRoute(
        path: AppRoutes.livepitchesScreen.path,
        name: AppRoutes.livepitchesScreen.name,
        builder: (context, state) => LivepitchesScreen(),
      ),
      GoRoute(
        path: AppRoutes.videoScreen.path,
        name: AppRoutes.videoScreen.name,
        builder: (context, state) => VideoPlayerScreen(),
      ),
      GoRoute(
        path: AppRoutes.searchView.path,
        name: AppRoutes.searchView.name,
        builder: (context, state) => Searchview(),
      ),
      GoRoute(
        path: AppRoutes.editProfilePopup.path,
        name: AppRoutes.editProfilePopup.name,
        builder: (context, state) => EditProfilePopup(),
      ),
    ],
  );
});
