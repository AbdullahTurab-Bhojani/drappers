// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/extensions/theme_extension.dart';
import '../../../../drappers.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../shared/widgets/app_bar/main_app_bar.dart';
import '../../../core/theme/app_scalar.dart';
import '../../../shared/widgets/dropdownsettingtile.dart';
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

  final List<String> _qualityOptions = ['Auto', '1440p', '1080p', '720p'];
  final List<String> _subtitleOptions = ['Off', 'English', 'Spanish', 'French'];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;
    const double horizontalPadding = 10.0;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.images.screensbg.path),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: AppMainBar(
                backgroundColor: Colors.transparent,
                title: "Settings & Preferences",
                leading: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => Navigator.of(context).pop(),
                  child: Image.asset(
                    "assets/images/backicon.png",
                    width: AppScaler.scaleSize(context, 20),
                    height: AppScaler.scaleHeight(context, 20),
                  ),
                ),
              ),
            ),
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
                      padding: EdgeInsets.only(
                        top: AppScaler.scaleHeight(context, 40),
                      ),
                      child: Padding(
                        // padding: const EdgeInsets.all(8.0),
                        padding: EdgeInsets.symmetric(
                          horizontal: AppScaler.scaleHeight(context, 20),
                        ),

                        child: Divider(
                          color: customColors.labelColor.withOpacity(0.2),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: horizontalPadding + horizontalPadding,
                        right: horizontalPadding + horizontalPadding,
                        top: horizontalPadding,
                        bottom: horizontalPadding,
                      ),
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,

                        onTap: () {
                          context.pushNamed(AppRoutes.changePassword.name);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  Assets.images.lock786.path,
                                  height: AppScaler.scaleHeight(context, 26),
                                  width: AppScaler.scaleSize(context, 26),
                                ),
                                SizedBox(
                                  width: AppScaler.scaleSize(context, 15),
                                ),
                                PoppinsText(
                                  context,
                                  "Change Password",
                                  fontSize: PoppinsFontSizeVariant.size16,
                                  fontWeight: PoppinsFontWeightVariant.medium,
                                  color: customColors.textColor,
                                ),
                              ],
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: customColors.textColor,
                              size: 18,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      // padding: const EdgeInsets.all(8.0),
                      padding: EdgeInsets.symmetric(
                        horizontal: AppScaler.scaleHeight(context, 20),
                      ),
                      child: Divider(
                        color: customColors.labelColor.withOpacity(0.2),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: horizontalPadding + horizontalPadding,
                        right: horizontalPadding + horizontalPadding,
                        top: horizontalPadding,
                        bottom: horizontalPadding,
                      ),
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,

                        onTap: () {
                          context.pushNamed(AppRoutes.deleteAccountScreen.name);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  Assets.images.delete123.path,
                                  height: AppScaler.scaleHeight(context, 26),
                                  width: AppScaler.scaleSize(context, 26),
                                  color: customColors.rednormal,
                                ),
                                SizedBox(
                                  width: AppScaler.scaleSize(context, 15),
                                ),
                                PoppinsText(
                                  context,
                                  "Delete or Deactivate Account",
                                  fontSize: PoppinsFontSizeVariant.size16,
                                  fontWeight: PoppinsFontWeightVariant.medium,
                                  color: customColors.rednormal,
                                ),
                              ],
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: customColors.textColor,
                              size: 18,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: AppScaler.scaleHeight(context, 80)),
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
