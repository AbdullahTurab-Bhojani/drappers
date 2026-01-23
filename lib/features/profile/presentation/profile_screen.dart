// ignore_for_file: deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../drappers.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../shared/widgets/app_bar/main_app_bar.dart';
import '../../../core/extensions/theme_extension.dart';
import '../../../core/local/domain/repositories/local_storage_repository.dart';
import '../../../core/theme/app_scalar.dart';
import '../../../shared/widgets/likedcontent_header.dart';
import '../../../shared/widgets/popupmenuitem/signup_popup_widget.dart';
import '../../../shared/widgets/tile_widget.dart';
import '../../../shared/widgets/watchhistory_header.dart';
import '../../user/domain/models/user_model.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  bool canExit = false;
  UserData? user;

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  Future<void> _loadUser() async {
    user = await ref.read(localDataProvider).getUser();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;
    bool canExit = false;
    List menuList = [
      {
        'title': 'Saved Reel',
        'image': Assets.images.savereelnewicon.path,
        'route': AppRoutes.savedreel.name,
        'color': customColors.textColor,
        'isTap': true,
      },
      {
        'title': 'Settings & Preferences',
        'image': Assets.images.settingsPreferencesicon.path,
        'route': AppRoutes.settingpreferencesScreen.name,
        'color': customColors.textColor,
        'isTap': true,
      },
      {
        'title': 'Terms & Conditions',
        'image': Assets.images.termconditionicon.path,
        'route': AppRoutes.termscondition.name,
        'color': customColors.textColor,
        'isTap': true,
      },
      {
        'title': 'Privacy Policy',
        'image': Assets.images.privacyolicyicon.path,
        'route': AppRoutes.privacypolicyScreen.name,
        'color': customColors.textColor,
        'isTap': true,
      },
      {
        'title': 'FAQ’s',
        'image': Assets.images.faqsicon.path,
        'route': AppRoutes.faqsScreen.name,
        'color': customColors.textColor,
        'isTap': true,
      },
      {
        'title': 'Help & Support',
        'image': Assets.images.helpsupportnewicon.path,
        'route': AppRoutes.helpsupport.name,
        'color': customColors.textColor,
        'isTap': true,
      },
      {
        'title': 'Sign Out',
        'image': Assets.images.signouticon.path,
        'route': AppRoutes.privacypolicyScreen.name,
        'color': customColors.rednormal,
        'isTap': false,
      },
    ];

    return WillPopScope(
      onWillPop: () async {
        if (!canExit) {
          setState(() {
            canExit = true;
          });
          return false;
        }
        return true;
      },
      child: Container(
        padding: EdgeInsets.all(0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.images.screensbg.path),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppMainBar(
            leadingText: "Profile",
            width: AppScaler.scaleSize(context, 120),
            title: "",
            centerTitle: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () async {
                  var res = await context.pushNamed(AppRoutes.editprofile.name);
                  if (res != null && res is UserData) {
                    setState(() {
                      user = res;
                    });
                  }
                },
                child: PoppinsText(
                  context,
                  "Edit",
                  fontSize: PoppinsFontSizeVariant.size14,
                  fontWeight: PoppinsFontWeightVariant.medium,
                ),
              ),
              SizedBox(width: AppScaler.scaleSize(context, 20)),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: AppScaler.scaleHeight(context, 40)),
                Column(
                  children: [
                    SizedBox(
                      height: AppScaler.scaleHeight(context, 114.82),
                      width: AppScaler.scaleHeight(context, 114.82),
                      child: ClipOval(
                        child: CachedNetworkImage(
                          imageUrl:
                              user != null &&
                                  user!.profileUrl != null &&
                                  user!.profileUrl!.isNotEmpty
                              ? user!.profileUrl!
                              : "https://i.pinimg.com/736x/15/0f/a8/150fa8800b0a0d5633abc1d1c4db3d87.jpg",
                          fit: BoxFit.cover,
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.person, size: 50),
                        ),
                      ),
                    ),

                    SizedBox(height: AppScaler.scaleHeight(context, 20)),
                    PoppinsText(
                      context,
                      user != null
                          ? (user!.firstName != null &&
                                    user!.firstName!.isNotEmpty &&
                                    user!.lastName != null &&
                                    user!.lastName!.isNotEmpty
                                ? "${user!.firstName!} ${user!.lastName!}"
                                : user!.fullName!)
                          : "Guest User",
                      fontSize: PoppinsFontSizeVariant.size22,
                      fontWeight: PoppinsFontWeightVariant.medium,
                      color: customColors.textColor,
                    ),
                    SizedBox(height: AppScaler.scaleHeight(context, 20)),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppScaler.scaleSize(context, 20),
                      ),
                      child: Column(
                        children: [
                          LikedcontentHeader(),
                          SizedBox(height: AppScaler.scaleHeight(context, 30)),
                          WatchhistoryHeader(),
                          SizedBox(height: AppScaler.scaleHeight(context, 30)),
                          ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.all(0),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () {
                                  if (menuList[index]['title'] == 'Sign Out') {
                                    showDialog(
                                      context: context,
                                      builder: (context) => Dialog(
                                        backgroundColor: Colors.transparent,
                                        child: SignupPopupWidget(),
                                      ),
                                    );
                                  } else {
                                    context.pushNamed(menuList[index]['route']);
                                  }
                                },
                                child: TileWidget(
                                  iconImage: menuList[index]['image'],
                                  title: menuList[index]['title'],
                                  textColor: menuList[index]['color'],
                                  ontaped: menuList[index]['isTap'],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Divider(
                                color: customColors.textColor.withOpacity(0.1),
                              );
                            },
                            itemCount: menuList.length,
                          ),
                          SizedBox(height: AppScaler.scaleHeight(context, 10)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
