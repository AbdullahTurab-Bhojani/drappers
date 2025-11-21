import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/extensions/theme_extension.dart';
import '../../../../drappers.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../shared/widgets/app_bar/main_app_bar.dart';

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

  Widget _buildSectionHeader(String title, Color color) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 15.0),
      child: PoppinsText(
        title,
        fontSize: PoppinsFontSizeVariant.size16,
        fontWeight: PoppinsFontWeightVariant.semiBold,
        color: color,
      ),
    );
  }

  Widget _buildSettingItem({
    required Widget title,
    required Widget trailing,
    Widget? subtitle,
  }) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: 8.0,
        bottom: 8.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title,
                if (subtitle != null) const SizedBox(height: 4.0),
                if (subtitle != null) subtitle,
              ],
            ),
          ),
          trailing,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;

    const double horizontalPadding = 20.0;

    const Color gradientStartColor = Color(0xFF1FCFFF);
    const Color gradientEndColor = Color(0xFF0063FF);

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
                    _buildSectionHeader(
                      "Playback Settings",
                      customColors.textColor!,
                    ),

                    _buildSettingItem(
                      title: Row(
                        children: [
                          Icon(
                            Icons.play_arrow,
                            color: customColors.textColor,
                            size: 24,
                          ),
                          const SizedBox(width: 15.0),
                          PoppinsText(
                            "Autoplay Next Episode",
                            fontSize: PoppinsFontSizeVariant.size16,
                            fontWeight: PoppinsFontWeightVariant.medium,
                            color: customColors.textColor,
                          ),
                        ],
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: PoppinsText(
                          "Automatically play the next episode",
                          fontSize: PoppinsFontSizeVariant.size12,
                          fontWeight: PoppinsFontWeightVariant.regular,
                          color: customColors.textColor,
                        ),
                      ),
                      trailing: Switch(
                        value: _autoplayNextEpisode,
                        onChanged: (bool value) {
                          setState(() {
                            _autoplayNextEpisode = value;
                          });
                        },
                        activeColor: customColors.textColor,
                        activeTrackColor: gradientStartColor,
                      ),
                    ),

                    _buildSettingItem(
                      title: Row(
                        children: [
                          Icon(
                            Icons.play_arrow,
                            color: customColors.textColor,
                            size: 24,
                          ),
                          const SizedBox(width: 15.0),
                          PoppinsText(
                            "Autoplay Next Preview",
                            fontSize: PoppinsFontSizeVariant.size16,
                            fontWeight: PoppinsFontWeightVariant.medium,
                            color: customColors.textColor,
                          ),
                        ],
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: PoppinsText(
                          "Play previews when browsing",
                          fontSize: PoppinsFontSizeVariant.size14,
                          fontWeight: PoppinsFontWeightVariant.regular,
                          color: customColors.textColor,
                        ),
                      ),
                      trailing: Switch(
                        value: _autoplayNextPreview,
                        onChanged: (bool value) {
                          setState(() {
                            _autoplayNextPreview = value;
                          });
                        },
                        activeColor: customColors.textColor,
                        activeTrackColor: gradientStartColor,
                      ),
                    ),

                    _buildSectionHeader(
                      "Video Quality",
                      customColors.textColor!,
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: horizontalPadding,
                        vertical: 8.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.hd,
                                color: customColors.textColor,
                                size: 24,
                              ),
                              SizedBox(width: 15.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  PoppinsText(
                                    "Streaming Quality",
                                    fontSize: PoppinsFontSizeVariant.size16,
                                    fontWeight:
                                        PoppinsFontWeightVariant.regular,
                                    color: customColors.textColor,
                                  ),
                                  const SizedBox(height: 4.0),
                                  PoppinsText(
                                    "Choose video quality for streaming",
                                    fontSize: PoppinsFontSizeVariant.size12,
                                    fontWeight:
                                        PoppinsFontWeightVariant.regular,
                                    color: customColors.textColor,
                                  ),
                                ],
                              ),
                            ],
                          ),

                          const SizedBox(height: 25.0),

                          DropdownButtonFormField<String>(
                            value: _streamingQuality,
                            dropdownColor: customColors.lightGray,
                            style: TextStyle(
                              color: customColors.textColor,
                              fontSize: 16.0,
                            ),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: customColors.lightGray,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 15.0,
                                vertical: 10.0,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: customColors.textColor,
                              size: 25,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                _streamingQuality = newValue!;
                              });
                            },
                            items: _qualityOptions
                                .map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: PoppinsText(
                                      value,
                                      fontSize: PoppinsFontSizeVariant.size16,
                                      fontWeight:
                                          PoppinsFontWeightVariant.regular,
                                      color: customColors.textColor,
                                    ),
                                  );
                                })
                                .toList(),
                          ),
                        ],
                      ),
                    ),

                    _buildSectionHeader(
                      "Accessibility",
                      customColors.textColor!,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: horizontalPadding,
                        vertical: 8.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.closed_caption,
                                color: customColors.textColor,
                                size: 24,
                              ),
                              const SizedBox(width: 15.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  PoppinsText(
                                    "Subtitles & Captions",
                                    fontSize: PoppinsFontSizeVariant.size16,
                                    fontWeight: PoppinsFontWeightVariant.medium,
                                    color: customColors.textColor,
                                  ),
                                  PoppinsText(
                                    "Default subtitle language",
                                    fontSize: PoppinsFontSizeVariant.size12,
                                    fontWeight:
                                        PoppinsFontWeightVariant.regular,
                                    color: customColors.textColor,
                                  ),
                                ],
                              ),
                            ],
                          ),

                          const SizedBox(height: 25.0),

                          DropdownButtonFormField<String>(
                            value: _subtitlesLanguage,
                            dropdownColor: customColors.lightGray,
                            style: TextStyle(
                              color: customColors.textColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                            ),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: customColors.lightGray,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 15.0,
                                vertical: 10.0,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: customColors.textColor,
                              size: 25,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                _subtitlesLanguage = newValue!;
                              });
                            },
                            items: _subtitleOptions
                                .map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: PoppinsText(
                                      value,
                                      fontSize: PoppinsFontSizeVariant.size16,
                                      fontWeight:
                                          PoppinsFontWeightVariant.regular,
                                      color: customColors.textColor,
                                    ),
                                  );
                                })
                                .toList(),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
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
                                SizedBox(width: 10.0),
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
