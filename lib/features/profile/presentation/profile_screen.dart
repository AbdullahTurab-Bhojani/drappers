// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../drappers.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../shared/widgets/app_bar/main_app_bar.dart';
import '../../../core/extensions/theme_extension.dart';
import '../../../core/theme/app_scalar.dart';
import '../../../shared/widgets/likedcontent_header.dart';
import '../../../shared/widgets/popupmenuitem/signup_popup_widget.dart';
import '../../../shared/widgets/tile_widget.dart';
import '../../../shared/widgets/watchhistory_header.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;
    bool canExit = false;
    List menuList = [
      {
        'title': 'Saved Reel',
        'image': Assets.images.savereelnewicon.path,
        'route': AppRoutes.savedreel.path,
        'color': customColors.textColor,
        'isTap': true,
      },
      {
        'title': 'Settings & Preferences',
        'image': Assets.images.settingsPreferencesicon.path,
        'route': AppRoutes.settingpreferencesScreen.path,
        'color': customColors.textColor,
        'isTap': true,
      },
      {
        'title': 'Terms & Conditions',
        'image': Assets.images.termconditionicon.path,
        'route': AppRoutes.termscondition.path,
        'color': customColors.textColor,
        'isTap': true,
      },
      {
        'title': 'Privacy Policy',
        'image': Assets.images.privacyolicyicon.path,
        'route': AppRoutes.privacypolicyScreen.path,
        'color': customColors.textColor,
        'isTap': true,
      },
      {
        'title': 'FAQ’s',
        'image': Assets.images.faqsicon.path,
        'route': AppRoutes.faqsScreen.path,
        'color': customColors.textColor,
        'isTap': true,
      },
      {
        'title': 'Help & Support',
        'image': Assets.images.helpsupportnewicon.path,
        'route': AppRoutes.helpsupport.path,
        'color': customColors.textColor,
        'isTap': true,
      },
      {
        'title': 'Sign Out',
        'image': Assets.images.signouticon.path,
        'route': AppRoutes.privacypolicyScreen.path,
        'color': customColors.rednormal,
        'isTap': false,
      },
    ];

    return WillPopScope(
      onWillPop: () async {
        if (!canExit) {
          canExit = true;
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

                onTap: () {
                  context.pushNamed(AppRoutes.editprofile.name);
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

                      child: CircleAvatar(
                        radius: 60,
                        // radius: isSelected ? 15 : 15,
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage(
                          Assets.images.editprofileimage.path,
                        ),
                      ),
                    ),
                    SizedBox(height: AppScaler.scaleHeight(context, 20)),
                    PoppinsText(
                      context,
                      'Jerry Mackson',
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
