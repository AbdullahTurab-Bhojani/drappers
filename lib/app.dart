part of 'drappers.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(context, ref) {
    final goRouter = ref.watch(routerConfigProvider);
    final themeState = ref.watch(customThemeProvider);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,

      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp.router(
        themeMode: themeState.themeMode,
        theme: themeState.themeData,
        darkTheme: themeState.themeData,
        title: 'Drapertv',
        debugShowCheckedModeBanner: false,
        routerConfig: goRouter,
        builder: (_, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaleFactor: 1.0,
              viewInsets: MediaQuery.of(context).viewInsets,
              viewPadding: MediaQuery.of(context).viewPadding,
              padding: MediaQuery.of(context).padding,
            ),
            child: child!,
          );
        },
      ),
    );
  }
}
