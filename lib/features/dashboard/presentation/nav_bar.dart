// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/extensions/theme_extension.dart';
import '../../../core/theme/app_scalar.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';
import '../../../shared/widgets/guestloginwidget.dart';

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

  final List<Map<String, dynamic>> _navItems = [
    {
      'path': AppRoutes.home.name,
      'label': 'Home',
      'icon': Assets.images.footericon1.path,
      'icon2': Assets.images.dtvlogogrey.path,
    },
    {
      'path': AppRoutes.discover.name,
      'label': 'Discover',
      'icon': Assets.images.discovernanewvbaricon.path,
      'icon2': Assets.images.discoverGrey.path,
    },
    {
      'path': AppRoutes.watchlist.name,
      'label': 'Watchlist',
      'icon': Assets.images.watchlistnavbaricon.path,
      'icon2': Assets.images.watchlistgrey.path,
    },
    {
      'path': AppRoutes.profile.name,
      'label': 'Profile',
      'icon': Assets.images.shareicon.path,
      'icon2': Assets.images.footericon1.path,
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

  // old void _onTap(BuildContext context, int index) {
  //   selectedIndex = index;
  //   setState(() {});
  //   final path = _navItems[index]['path'];
  //   if (path.isNotEmpty) context.goNamed(path);
  // }

  void _onTap(BuildContext context, int index) {
    if (GuestHelper.isGuest) {
      GuestHelper.checkGuest(context);
      return;
    }
    setState(() {
      selectedIndex = index;
    });
    final path = _navItems[index]['path'];
    if (path.isNotEmpty) {
      context.goNamed(path);
    }
  }

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<AppCustomColors>()!;
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: customColors.dark,
        body: SafeArea(top: true, child: Container(child: widget.child)),
        bottomNavigationBar: SafeArea(
          bottom: true,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(0, 12, 29, 1),
                  Color.fromRGBO(2, 37, 88, 1),
                ],
                begin: AlignmentGeometry.topCenter,
                end: AlignmentGeometry.bottomCenter,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(_navItems.length, (index) {
                final bool isProfileTab = index == _navItems.length - 1;
                final isSelected = selectedIndex == index;
                return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    _onTap(context, index);
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (isProfileTab)
                        GuestHelper.isGuest
                            ? Image.asset(
                                Assets.images.user.path,
                                width: 20,
                                height: 20,
                                color: isSelected
                                    ? customColors.textColor
                                    : customColors.greyColor,
                              )
                            : CircleAvatar(
                                radius: 9,
                                backgroundColor: Colors.transparent,
                                backgroundImage: AssetImage(
                                  Assets.images.editprofileimage.path,
                                ),
                              )
                      else
                        isSelected
                            ? Image(
                                image: AssetImage(_navItems[index]['icon']),
                                height: AppScaler.scaleHeight(context, 20),
                              )
                            : Image(
                                image: AssetImage(_navItems[index]['icon2']),
                                height: AppScaler.scaleHeight(context, 20),
                              ),

                      SizedBox(height: AppScaler.scaleHeight(context, 4)),

                      PoppinsText(
                        context,
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
      ),
    );
  }
}
