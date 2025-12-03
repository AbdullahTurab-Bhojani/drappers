// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/extensions/theme_extension.dart';
import '../../../../drappers.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../shared/widgets/app_bar/main_app_bar.dart';
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

  // 3. Dropdown Options (Used by DropdownSettingTile)
  final List<String> _qualityOptions = ['Auto', '1440p', '1080p', '720p'];
  final List<String> _subtitleOptions = ['Off', 'English', 'Spanish', 'French'];

  // No more _buildSectionHeader or _buildSettingItem helpers needed here!

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;
    const double horizontalPadding = 20.0;

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
              padding: const EdgeInsets.symmetric(
                horizontal: horizontalPadding,
              ),
              child: AppMainBar(
                leading: Image.asset(Assets.images.backicon.path),
                title: "Settings & Preferences",
                centerTitle: false,
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: horizontalPadding,
                      ),
                      child: SettingSectionHeader(
                        title: "Playback Settings",
                        color: customColors.textColor,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: horizontalPadding,
                      ),
                      child: ToggleSettingTile(
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
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: horizontalPadding,
                      ),
                      child: ToggleSettingTile(
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
                    ),
                    SizedBox(height: 20),
                    Divider(color: customColors.labelColor.withOpacity(0.2)),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: horizontalPadding,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SettingSectionHeader(
                            title: "Video Quality",
                            color: customColors.textColor,
                          ),
                          SizedBox(height: 15),
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
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40),
                    Divider(color: customColors.labelColor.withOpacity(0.2)),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: horizontalPadding,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SettingSectionHeader(
                            title: "Accessibility",
                            color: customColors.textColor,
                          ),
                          SizedBox(height: 10),
                          DropdownSettingTile(
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
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 40.0),
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
                      child: InkWell(
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
                                  height: 26,
                                  width: 26,
                                ),
                                SizedBox(width: 15.0),
                                PoppinsText(
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
                    Divider(color: customColors.labelColor.withOpacity(0.2)),
                    Padding(
                      padding: EdgeInsets.only(
                        left: horizontalPadding + horizontalPadding,
                        right: horizontalPadding + horizontalPadding,
                        top: horizontalPadding,
                        bottom: horizontalPadding,
                      ),
                      child: InkWell(
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
                                  height: 26,
                                  width: 26,
                                  color: customColors.rednormal,
                                ),
                                SizedBox(width: 15.0),
                                PoppinsText(
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
                    SizedBox(height: 40.0),
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
