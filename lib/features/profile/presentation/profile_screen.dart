// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../drappers.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../shared/widgets/app_bar/main_app_bar.dart';
import '../../../core/extensions/theme_extension.dart';
import '../../../core/theme/app_scalar.dart';
import '../../../shared/widgets/cardwidget/card_widget.dart';
import '../../../shared/widgets/popupmenuitem/signup_popup_widget.dart';
import '../../../shared/widgets/tile_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;
    bool canExit = false;
    List images = [
      'https://source.boomplaymusic.com/buzzgroup2/M00/2E/F3/rBEe_GHV1vCACRvaAAJjfsEidFI769.png',
      'https://i0.wp.com/maactioncinema.com/wp-content/uploads/2024/01/MV5BOGU2NDNmY2UtZTJmZS00M2U4LTkyMGQtNjc5MmNiZTQ4YjA0XkEyXkFqcGdeQXVyNTk1ODQ5NDg%40._V1_-scaled.jpg?ssl=1',
      'https://resizing.flixster.com/kmvpUXbW_IqKOXauZ76IceSquTA=/fit-in/180x240/v2/https://resizing.flixster.com/2bkyVmLlw_8s0SzA8C1gaYNdoZY=/ems.cHJkLWVtcy1hc3NldHMvbW92aWVzLzJlNTkwNTIxLTM0YmYtNDgzNi1hZGFlLThjODM2ZTA5OTEzMi5qcGc=',
      'https://i0.wp.com/maactioncinema.com/wp-content/uploads/2024/01/MV5BOGU2NDNmY2UtZTJmZS00M2U4LTkyMGQtNjc5MmNiZTQ4YjA0XkEyXkFqcGdeQXVyNTk1ODQ5NDg%40._V1_-scaled.jpg?ssl=1',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHIybZ6umH09-6J4suX89s4BGUn-CSb_4j3A&s',
    ];
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
          color: Colors.amber,
          // image: DecorationImage(
          //   image: AssetImage(Assets.images.screensbg.path),
          //   fit: BoxFit.cover,
          // ),
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
                        backgroundImage: NetworkImage(
                          'https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D',
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PoppinsText(
                                context,
                                'Liked Content',
                                fontSize: PoppinsFontSizeVariant.size16,
                                fontWeight: PoppinsFontWeightVariant.medium,
                                color: customColors.textColor,
                              ),
                              AppButton(
                                buttonSize: Size(80, 25),
                                color: Colors.transparent,
                                borderColor: customColors.textColor.withOpacity(
                                  0.5,
                                ),
                                borderWidth: 1,
                                fontSize: PoppinsFontSizeVariant.size12,
                                fontWeight: PoppinsFontWeightVariant.regular,
                                border: true,
                                onPressed: () {
                                  context.pushNamed(AppRoutes.likecontent.name);
                                },
                                title: "View More",
                              ),
                            ],
                          ),
                          SizedBox(height: AppScaler.scaleHeight(context, 20)),
                          SizedBox(
                            height: AppScaler.scaleHeight(context, 180),
                            child: ListView.separated(
                              padding: EdgeInsets.zero,
                              clipBehavior: Clip.none,
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  width: AppScaler.scaleSize(context, 15),
                                );
                              },
                              shrinkWrap: true,
                              itemCount: images.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  behavior: HitTestBehavior.opaque,

                                  onTap: () {
                                    context.pushNamed(
                                      AppRoutes.contentDetail.name,
                                    );
                                  },
                                  child: CardWidget(
                                    assetImage: images[index],
                                    showSaveIcon: false,
                                    fromEpisode: false,
                                    allowGuestNavigation: false,
                                    index: index,
                                    showMenuOnly: true,
                                    showLiveTvBadge: false,
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: AppScaler.scaleHeight(context, 30)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PoppinsText(
                                context,
                                'Watch History',
                                fontSize: PoppinsFontSizeVariant.size16,
                                fontWeight: PoppinsFontWeightVariant.medium,
                                color: customColors.textColor,
                              ),
                              AppButton(
                                buttonSize: Size(80, 25),
                                color: Colors.transparent,
                                borderColor: customColors.textColor.withOpacity(
                                  0.5,
                                ),
                                borderWidth: 1,
                                fontSize: PoppinsFontSizeVariant.size12,
                                fontWeight: PoppinsFontWeightVariant.regular,
                                border: true,
                                onPressed: () {
                                  context.pushNamed(
                                    AppRoutes.watchHistoryViewmore.name,
                                  );
                                },
                                title: "View More",
                              ),
                            ],
                          ),
                          SizedBox(height: AppScaler.scaleHeight(context, 20)),
                          SizedBox(
                            height: AppScaler.scaleHeight(context, 180),
                            child: ListView.separated(
                              padding: EdgeInsets.zero,
                              clipBehavior: Clip.none,
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  width: AppScaler.scaleSize(context, 15),
                                );
                              },
                              shrinkWrap: true,
                              itemCount: images.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  behavior: HitTestBehavior.opaque,

                                  onTap: () {
                                    context.pushNamed(
                                      AppRoutes.contentDetail.name,
                                    );
                                  },
                                  child: CardWidget(
                                    assetImage: images[index],
                                    showSaveIcon: false,
                                    fromEpisode: false,
                                    allowGuestNavigation: false,
                                    index: index,
                                    showMenuOnly: true,
                                    showLiveTvBadge: false,
                                  ),
                                );
                              },
                            ),
                          ),
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
                                      builder: (context) => const Dialog(
                                        backgroundColor: Colors.transparent,
                                        child: SignupPopupWidget(),
                                      ),
                                    );
                                  } else {
                                    context.push(menuList[index]['route']);
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
