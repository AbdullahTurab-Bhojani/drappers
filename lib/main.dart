part of 'drappers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    setUrlStrategy(PathUrlStrategy());
  }

  runApp(const ProviderScope(child: MyApp()));
}
