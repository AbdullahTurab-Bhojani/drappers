part of '../../../drappers.dart';

/// Widget class to manage asynchronous app initialization
class AppStartupWidget extends ConsumerWidget {
  const AppStartupWidget({super.key, required this.onLoaded});

  final WidgetBuilder onLoaded;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 2. eagerly initialize appStartupProvider (and all the providers it depends on)
    final appStartupState = ref.watch(appStartupProvider);
    return appStartupState.when(
      // 3. loading state
      loading: () =>
          Container(color: AppColors.screenBG, child: LoadingWidget()),
      // 4. error state
      error: (e, st) => Container(),
      // 6. success - now load the main app
      data: (_) => onLoaded(context),
    );
  }
}
