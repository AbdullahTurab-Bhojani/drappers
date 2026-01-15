// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/extensions/theme_extension.dart';
import '../../../../drappers.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../shared/widgets/app_bar/main_app_bar.dart';
import '../../../core/theme/app_scalar.dart';
import '../../../shared/widgets/dropdownsettingtile.dart';
import '../../../shared/widgets/settings_row_item.dart';
import '../../../shared/widgets/settingsectionheader.dart';
import '../../../shared/widgets/togglesetting_tile.dart';

class SettingpreferencesScreen extends StatefulWidget {
  const SettingpreferencesScreen({super.key});

  @override
  State<SettingpreferencesScreen> createState() =>
      _SettingpreferencesScreenState();
}

class _SettingpreferencesScreenState extends State<SettingpreferencesScreen> {
  bool _autoplayNextEpisode = false;
  bool _autoplayNextPreview = false;
  String _streamingQuality = 'Auto';
  String _subtitlesLanguage = 'Off';

  final List<String> _qualityOptions = [
    'Auto',
    '1440p',
    '1080p',
    '720p',
    '480p',
    '360p',
    '240p',
    '144p',
  ];
  final List<String> _subtitleOptions = [
    'Off',
    'English',
    'Urdu',
    'Bangali',
    'Chinese',
    'Arabic',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;
    const double horizontalPadding = 10.0;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.images.screensbg.path),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppMainBar(
          backgroundColor: Colors.transparent,
          title: "Settings & Preferences",
          leading: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              context.go(AppRoutes.profile.path);
            },
            child: Image.asset(
              "assets/images/backicon.png",
              width: AppScaler.scaleSize(context, 20),
              height: AppScaler.scaleHeight(context, 20),
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AppScaler.scaleHeight(context, 10)),
                    SettingSectionHeader(
                      title: "Playback Settings",
                      color: customColors.textColor,
                    ),

                    ToggleSettingTile(
                      image: AssetImage(Assets.images.playbutton123.path),
                      titleText: "Autoplay Next Episode",
                      subtitleText: "Automatically play the next episode",
                      initialValue: _autoplayNextEpisode,
                      onChanged: (value) {
                        setState(() {
                          _autoplayNextEpisode = value;
                        });
                      },
                    ),
                    SizedBox(height: AppScaler.scaleHeight(context, 15)),
                    ToggleSettingTile(
                      image: AssetImage(Assets.images.playicon1234.path),
                      titleText: "Autoplay Next Preview",
                      subtitleText: "Play previews when browsing",
                      initialValue: _autoplayNextPreview,
                      onChanged: (value) {
                        setState(() {
                          _autoplayNextPreview = value;
                        });
                      },
                    ),
                    SizedBox(height: AppScaler.scaleHeight(context, 20)),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppScaler.scaleSize(context, 20),
                      ),
                      child: Divider(
                        color: customColors.labelColor.withOpacity(0.2),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SettingSectionHeader(
                          title: "Video Quality",
                          color: customColors.textColor,
                        ),
                        SizedBox(height: AppScaler.scaleHeight(context, 15)),
                        DropdownSettingTile(
                          image: AssetImage(Assets.images.hd123.path),
                          titleText: "Streaming Quality",
                          subtitleText: "Choose video quality for streaming",
                          options: _qualityOptions,
                          initialValue: _streamingQuality,
                          onChanged: (value) {
                            setState(() {
                              _streamingQuality = value;
                            });
                          },
                          isMenuOpen: false,
                        ),
                      ],
                    ),
                    SizedBox(height: AppScaler.scaleHeight(context, 40)),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppScaler.scaleSize(context, 20),
                      ),
                      child: Divider(
                        color: customColors.labelColor.withOpacity(0.2),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SettingSectionHeader(
                          title: "Accessibility",
                          color: customColors.textColor,
                        ),
                        SizedBox(height: AppScaler.scaleHeight(context, 10)),
                        DropdownSettingTile(
                          isMenuOpen: false,
                          image: AssetImage(Assets.images.cc123.path),
                          titleText: "Subtitles & Captions",
                          subtitleText: "Default subtitle language",
                          options: _subtitleOptions,
                          initialValue: _subtitlesLanguage,
                          onChanged: (value) {
                            setState(() {
                              _subtitlesLanguage = value;
                            });
                          },
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal:
                            horizontalPadding *
                            2, // One horizontal padding for all
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: AppScaler.scaleHeight(context, 40),
                          ), // Top spacing
                          Divider(
                            color: customColors.labelColor.withOpacity(0.2),
                          ),
                          SizedBox(height: horizontalPadding),

                          SettingsRowItem(
                            text: "Change Password",
                            iconPath: Assets.images.lock786.path,
                            onTap: () {
                              context.pushNamed(AppRoutes.changePassword.name);
                            },
                          ),
                          SizedBox(height: horizontalPadding),
                          Divider(
                            color: customColors.labelColor.withOpacity(0.2),
                          ),
                          SizedBox(height: horizontalPadding),

                          SettingsRowItem(
                            text: "Delete or Deactivate Account",
                            iconPath: Assets.images.delete123.path,
                            iconColor: customColors.rednormal,
                            onTap: () {
                              context.pushNamed(
                                AppRoutes.deleteAccountScreen.name,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
