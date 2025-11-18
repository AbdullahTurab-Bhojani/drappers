part of '../../../drappers.dart';

class BackAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const BackAppBar({super.key, required this.title, this.onBack});

  final String title;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      backgroundColor: AppColors.screenBG,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      toolbarHeight: kToolbarHeight + 15,
      automaticallyImplyLeading: false,
      titleSpacing: 20,
      title: PlusJakartaText(
        title,
        size: 22,
        fontWeight: FontWeight.w700,
        color: AppColors.darkText,
      ),
    );
  }

  @override
  Size get preferredSize => Size(600, 50);
}
