import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/local/providers/shared_pref.dart';
part 'app_start.g.dart';

@Riverpod(keepAlive: true)
Stream<double> appStartup(Ref ref) async* {
  try {
    yield 0.1;
    await ref.read(sharedPreferencesProvider.future);
    yield 0.3;
    yield 0.6;
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    await Future.delayed(Duration(seconds: 1));
    yield 0.9;

    yield 1.0;
  } catch (e, stack) {
    debugPrint('❌ App startup failed: $e');
    debugPrint('$stack');
    rethrow;
  }
}
