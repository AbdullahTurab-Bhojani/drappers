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
            AppMainBar(
              leadingIcon: Icons.arrow_back_ios,
              title: "Settings & Preferences",
              centerTitle: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // --- PLAYBACK SETTINGS ---
                    SettingSectionHeader(
                      title: "Playback Settings",
                      color: customColors.textColor!,
                    ),

                    ToggleSettingTile(
                      icon: Icons.play_arrow,
                      titleText: "Autoplay Next Episode",
                      subtitleText: "Automatically play the next episode",
                      initialValue: _autoplayNextEpisode,
                      onChanged: (value) {
                        setState(() {
                          _autoplayNextEpisode = value;
                        });
                      },
                    ),

                    ToggleSettingTile(
                      icon: Icons.play_arrow,
                      titleText: "Autoplay Next Preview",
                      subtitleText: "Play previews when browsing",
                      initialValue: _autoplayNextPreview,
                      onChanged: (value) {
                        setState(() {
                          _autoplayNextPreview = value;
                        });
                      },
                    ),

                    SettingSectionHeader(
                      title: "Video Quality",
                      color: customColors.textColor!,
                    ),

                    DropdownSettingTile(
                      icon: Icons.hd,
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

                    SettingSectionHeader(
                      title: "Accessibility",
                      color: customColors.textColor!,
                    ),

                    DropdownSettingTile(
                      icon: Icons.closed_caption,
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

                    Padding(
                      padding:  EdgeInsets.only(top: 40.0),
                      child: Divider(
                        color: customColors.labelColor.withOpacity(0.2),
                        thickness: 0.3,
                        height: 1,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        horizontalPadding,
                        20.0,
                        horizontalPadding,
                        20.0,
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
                                Icon(
                                  Icons.delete_forever,
                                  color: customColors.redlight,
                                  size: 24,
                                ),
                                const SizedBox(width: 10.0),
                                PoppinsText(
                                  "Delete or Deactivate Account",
                                  fontSize: PoppinsFontSizeVariant.size16,
                                  fontWeight: PoppinsFontWeightVariant.semiBold,
                                  color: customColors.redlight,
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
                    const SizedBox(height: 40.0),
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
