import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/local/providers/shared_pref.dart';
import '../../../drappers.dart';

part 'app_start.g.dart';

@Riverpod(keepAlive: true)
Future<void> appStartup(Ref ref) async {
  try {
    // Load environment variables

    // await EnvKeys.load();

    // // Initialize Firebase
    // await Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );
    // ref.read(notificationHandlerProvider(navigatorKey));

    // Invalidate dependencies on app exit
    ref.onDispose(() {
      ref.invalidate(sharedPreferencesProvider);
    });

    // Ensure SharedPreferences is ready
    await ref.read(sharedPreferencesProvider.future);

    // Lock orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    // Set system UI styles
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: AppColors.screenBG,
        systemNavigationBarIconBrightness: Brightness.light,
        systemStatusBarContrastEnforced: true,
        // systemNavigationBarDividerColor: Colors.transparent,
      ),
    );

    // ref.read(subscriptionServiceProvider.future);
  } catch (e, stack) {
    debugPrint('❌ App startup failed: $e');
    debugPrint('$stack');
    rethrow; // Let the app handle it (e.g., splash screen error state)
  }
}
