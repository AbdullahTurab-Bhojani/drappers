part of 'drappers.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(context, ref) {
    final goRouter = ref.watch(routerConfigProvider);
    final themeState = ref.watch(customThemeProvider);

    final buttonStyle = ButtonStyle(
      iconColor: WidgetStateProperty.all<Color>(Colors.black),
      foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
      padding: WidgetStateProperty.all(const EdgeInsets.all(12)),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      ),
    );

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp.router(
        themeMode: themeState.themeMode,
        theme: themeState.themeData,
        darkTheme: themeState.themeData,
        title: 'Drappers',
        debugShowCheckedModeBanner: false,
        routerConfig: goRouter,
        builder: (_, child) {
          return AppStartupWidget(
            onLoaded: (_) => MediaQuery(
              data: MediaQuery.of(
                context,
              ).copyWith(textScaler: const TextScaler.linear(1.0)),
              child: child!,
            ),
          );
        },
      ),
    );
  }
}
