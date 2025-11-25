// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/extensions/theme_extension.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';

class BottomNavigationBarShell extends ConsumerStatefulWidget {
  final Widget child;
  const BottomNavigationBarShell({super.key, required this.child});

  @override
  ConsumerState<BottomNavigationBarShell> createState() =>
      _BottomNavigationBarShellState();
}

class _BottomNavigationBarShellState
    extends ConsumerState<BottomNavigationBarShell> {
  int selectedIndex = 0;
  bool isOpen = false;
  bool isEditing = false;

  static final List<Map<String, dynamic>> _navItems = [
    {
      'path': AppRoutes.home.name,
      'label': 'Home',
      'icon': Assets.images.footericon1.path,
    },
    {
      'path': AppRoutes.discover.name,
      'label': 'Discover',
      'icon': Assets.images.footericon2.path,
    },
    {
      'path': AppRoutes.watchlist.name,
      'label': 'Watchlist',
      'icon': Assets.images.footericon3.path,
    },
    {
      'path': AppRoutes.profile.name,
      'label': 'Profile',
      'icon': Assets.images.shareicon.path,
    },
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      syncIndex();
    });
  }

  @override
  void didUpdateWidget(covariant BottomNavigationBarShell oldWidget) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      syncIndex();
    });
    super.didUpdateWidget(oldWidget);
  }

  void syncIndex() {
    final location = GoRouterState.of(context).matchedLocation;
    final index = _navItems.indexWhere((item) {
      final path = item['path'] as String;
      return path.isNotEmpty && location.contains(path);
    });
    setState(() {
      selectedIndex = index >= 0 ? index : 0;
    });
  }

  void _onTap(BuildContext context, int index) {
    selectedIndex = index;
    setState(() {});
    final path = _navItems[index]['path'];
    if (path.isNotEmpty) context.goNamed(path);
  }

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<AppCustomColors>()!;
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: customColors.dark,
        body: Container(child: widget.child),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(0, 12, 29, 1),
                Color.fromRGBO(2, 37, 88, 1),
              ],
              begin: AlignmentGeometry.topCenter,
              end: AlignmentGeometry.bottomCenter
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(_navItems.length, (index) {
              final bool isProfileTab = index == _navItems.length - 1;

              final isSelected = selectedIndex == index;
              return InkWell(
                onTap: () {
                  _onTap(context, index);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (isProfileTab)
                      CircleAvatar(
                        radius: isSelected ? 15 : 15,
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage(
                          'https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D',
                        ),
                      )
                    else
                      Image(
                        image: AssetImage(_navItems[index]['icon']),
                        height: 24,
                        color: isSelected
                            ? customColors.textColor
                            : customColors.greyColor,
                      ),

                    const SizedBox(height: 4),

                    PoppinsText(
                      _navItems[index]['label'],
                      fontSize: PoppinsFontSizeVariant.size14,
                      color: isSelected
                          ? customColors.textColor
                          : customColors.greyColor,
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
