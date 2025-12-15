import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'drappers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent background
    statusBarIconBrightness: Brightness.light, // white icons
    systemNavigationBarColor: Colors.transparent, // optional: transparent nav bar
    systemNavigationBarIconBrightness: Brightness.light,
  ));
  runApp(const ProviderScope(child: MyApp()));
}
