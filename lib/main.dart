import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/local/providers/shared_pref.dart';
import 'drappers.dart';
import 'firebase_options.dart';

Future<void> main() async {
  await mainCommon();
}

Future<void> mainCommon() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPrefs = await SharedPreferences.getInstance();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ProviderScope(
      overrides: [sharedPreferencesProvider.overrideWith((ref) => sharedPrefs)],
      child: const MyApp(),
    ),
  );
}
