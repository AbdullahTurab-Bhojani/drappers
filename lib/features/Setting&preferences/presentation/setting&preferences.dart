import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/extensions/theme_extension.dart';
import '../../../../drappers.dart'; // Assuming PoppinsText, PoppinsFontSizeVariant, etc., are defined here
import '../../../../gen/assets.gen.dart';
import '../../../../shared/widgets/app_bar/main_app_bar.dart';

// 🔥 Global strings class removed as requested.

class SettingpreferencesScreen extends StatefulWidget {
  const SettingpreferencesScreen({super.key});

  @override
  State<SettingpreferencesScreen> createState() =>
      _SettingpreferencesScreenState();
}

class _SettingpreferencesScreenState extends State<SettingpreferencesScreen> {
  // State variables for toggles
  bool _autoplayNextEpisode = true;
  bool _autoplayNextPreview = false;

  // State variables for dropdowns
  String _streamingQuality = 'Auto';
  String _subtitlesLanguage = 'Off';

  final List<String> _qualityOptions = ['Auto', '1440p', '1080p', '720p'];
  final List<String> _subtitleOptions = ['Off', 'English', 'Spanish', 'French'];

  // Helper widget for section headers
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

  // Helper widget for settings items with descriptions
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

    // Define your gradient colors for switches (These are constant and not part of customColors)
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
              // 🔥 Hardcoded Title
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

                    // 1. Autoplay Next Episode Toggle
                    _buildSettingItem(
                      title: Row(
                        children: [
                          Icon(
                            Icons.play_arrow,
                            color: customColors.textColor,
                            size: 24,
                          ),
                          const SizedBox(width: 8.0),
                          PoppinsText(
                            // 🔥 Hardcoded Title
                            "Autoplay Next Episode",
                            fontSize: PoppinsFontSizeVariant.size16,
                            fontWeight: PoppinsFontWeightVariant.regular,
                            color: customColors.textColor,
                          ),
                        ],
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(left: 32.0),
                        child: PoppinsText(
                          // 🔥 Hardcoded Subtitle
                          "Automatically play the next episode",
                          fontSize: PoppinsFontSizeVariant.size14,
                          fontWeight: PoppinsFontWeightVariant.regular,
                          color: customColors.subtextColor,
                        ),
                      ),
                      trailing: Switch(
                        value: _autoplayNextEpisode,
                        onChanged: (bool value) {
                          setState(() {
                            _autoplayNextEpisode = value;
                          });
                        },
                        activeColor: gradientEndColor,
                        activeTrackColor: gradientStartColor.withOpacity(0.5),
                      ),
                    ),

                    // 2. Autoplay Next Preview Toggle
                    _buildSettingItem(
                      title: Row(
                        children: [
                          Icon(
                            Icons.play_arrow,
                            color: customColors.textColor,
                            size: 24,
                          ),
                          const SizedBox(width: 8.0),
                          PoppinsText(
                            // 🔥 Hardcoded Title
                            "Autoplay Next Preview",
                            fontSize: PoppinsFontSizeVariant.size16,
                            fontWeight: PoppinsFontWeightVariant.regular,
                            color: customColors.textColor,
                          ),
                        ],
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(left: 32.0),
                        child: PoppinsText(
                          // 🔥 Hardcoded Subtitle
                          "Play previews when browsing",
                          fontSize: PoppinsFontSizeVariant.size14,
                          fontWeight: PoppinsFontWeightVariant.regular,
                          color: customColors.subtextColor,
                        ),
                      ),
                      trailing: Switch(
                        value: _autoplayNextPreview,
                        onChanged: (bool value) {
                          setState(() {
                            _autoplayNextPreview = value;
                          });
                        },
                        activeColor: gradientEndColor,
                        activeTrackColor: gradientStartColor.withOpacity(0.5),
                      ),
                    ),

                    // --- Video Quality ---
                    _buildSectionHeader(
                      // 🔥 Hardcoded Title
                      "Video Quality",
                      customColors.textColor!,
                    ),

                    // 3. Streaming Quality Dropdown
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
                              const SizedBox(width: 8.0),
                              PoppinsText(
                                // 🔥 Hardcoded Title
                                "Streaming Quality",
                                fontSize: PoppinsFontSizeVariant.size16,
                                fontWeight: PoppinsFontWeightVariant.regular,
                                color: customColors.textColor,
                              ),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          PoppinsText(
                            // 🔥 Hardcoded Subtitle
                            "Choose video quality for streaming",
                            fontSize: PoppinsFontSizeVariant.size14,
                            fontWeight: PoppinsFontWeightVariant.regular,
                            color: customColors.subtextColor,
                          ),
                          const SizedBox(height: 8.0),

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

                    // --- Accessibility ---
                    _buildSectionHeader(
                      // 🔥 Hardcoded Title
                      "Accessibility",
                      customColors.textColor!,
                    ),

                    // 4. Subtitles & Captions Dropdown
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
                              const SizedBox(width: 8.0),
                              PoppinsText(
                                // 🔥 Hardcoded Title
                                "Subtitles & Captions",
                                fontSize: PoppinsFontSizeVariant.size16,
                                fontWeight: PoppinsFontWeightVariant.regular,
                                color: customColors.textColor,
                              ),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          PoppinsText(
                            // 🔥 Hardcoded Subtitle
                            "Default subtitle language",
                            fontSize: PoppinsFontSizeVariant.size14,
                            fontWeight: PoppinsFontWeightVariant.regular,
                            color: customColors.subtextColor,
                          ),
                          const SizedBox(height: 8.0),

                          DropdownButtonFormField<String>(
                            value: _subtitlesLanguage,
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

                    // --- Divider ---
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Divider(
                        color: customColors.subtextColor,
                        thickness: 1,
                        height: 1,
                      ),
                    ),

                    // --- Delete Account Button ---
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        horizontalPadding,
                        20.0,
                        horizontalPadding,
                        20.0,
                      ),
                      child: InkWell(
                        onTap: () {
                          context.goNamed(AppRoutes.deleteAccountScreen.name);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.delete_forever,
                                  color: Colors.red,
                                  size: 24,
                                ),
                                const SizedBox(width: 10.0),
                                PoppinsText(
                                  // 🔥 Hardcoded Button Text
                                  "Delete or Deactivate Account",
                                  fontSize: PoppinsFontSizeVariant.size16,
                                  fontWeight: PoppinsFontWeightVariant.semiBold,
                                  color: Colors.red,
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.red,
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
