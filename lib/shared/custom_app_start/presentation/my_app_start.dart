part of '../../../drappers.dart';

/// Widget class to manage asynchronous app initialization
class AppStartupWidget extends ConsumerWidget {
  const AppStartupWidget({super.key, required this.onLoaded});
  final WidgetBuilder onLoaded;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appStartupState = ref.watch(appStartupProvider);

    return appStartupState.when(
      loading: () =>
          Container(color: AppColors.screenBG, child: LoadingWidget()),
      error: (e, st) => Center(child: Text('❌ Initialization failed: $e')),
      data: (_) => onLoaded(context),
    );
  }
}
