import 'package:flutter/material.dart';
import '../../../../core/extensions/theme_extension.dart';
import '../../../../drappers.dart'; // Assuming PoppinsText, PoppinsFontSizeVariant, etc., are defined here
import '../../../../gen/assets.gen.dart';
import '../../../../shared/widgets/app_bar/main_app_bar.dart';

// --- Placeholder for Global Text/Strings ---
// NOTE: Replace this with your actual global text retrieval method (e.g., AppLocalizations).
class _GlobalStrings {
  final String screenTitle = "Settings & Preferences";
  final String playbackSettingsTitle = "Playback Settings";
  final String autoplayEpisodeTitle = "Autoplay Next Episode";
  final String autoplayEpisodeSubtitle = "Automatically play the next episode";
  final String autoplayPreviewTitle = "Autoplay Next Preview";
  final String autoplayPreviewSubtitle = "Play previews when browsing";
  final String videoQualityTitle = "Video Quality";
  final String streamingQualityTitle = "Streaming Quality";
  final String streamingQualitySubtitle = "Choose video quality for streaming";
  final String accessibilityTitle = "Accessibility";
  final String subtitlesTitle = "Subtitles & Captions";
  final String subtitlesSubtitle = "Default subtitle language";
  final String deleteAccountButton = "Delete or Deactivate Account";
}

final _settingsStrings = _GlobalStrings();
// -------------------------------------------------------------------------------------------------

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

    // Assume customColors.lightGray is available, otherwise use a default dark color
    final Color dropdownBackgroundColor =
        customColors.lightGray ?? const Color(0xFF1E2135);

    final Color contentBackgroundColor =
        customColors.regular ?? const Color(0xFF2C2F4D);
    final Color textColor = customColors.textColor!;
    const double horizontalPadding = 20.0;

    // Define your gradient colors for switches
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
              title: _settingsStrings.screenTitle,
              centerTitle: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // --- Playback Settings ---
                    _buildSectionHeader(
                      _settingsStrings.playbackSettingsTitle,
                      textColor,
                    ),

                    // 1. Autoplay Next Episode Toggle
                    _buildSettingItem(
                      title: Row(
                        children: [
                          Icon(Icons.play_arrow, color: textColor, size: 24),
                          const SizedBox(width: 8.0),
                          PoppinsText(
                            _settingsStrings.autoplayEpisodeTitle,
                            fontSize: PoppinsFontSizeVariant.size16,
                            fontWeight: PoppinsFontWeightVariant.regular,
                            color: textColor,
                          ),
                        ],
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(left: 32.0),
                        child: PoppinsText(
                          _settingsStrings.autoplayEpisodeSubtitle,
                          fontSize: PoppinsFontSizeVariant.size14,
                          fontWeight: PoppinsFontWeightVariant.regular,
                          color: Colors.white70,
                        ),
                      ),
                      trailing: Switch(
                        value: _autoplayNextEpisode,
                        onChanged: (bool value) {
                          setState(() {
                            _autoplayNextEpisode = value;
                          });
                        },
                        // Applying gradient colors to switch
                        activeColor: gradientEndColor,
                        activeTrackColor: gradientStartColor.withOpacity(0.5),
                      ),
                    ),

                    // 2. Autoplay Next Preview Toggle
                    _buildSettingItem(
                      title: Row(
                        children: [
                          Icon(Icons.play_arrow, color: textColor, size: 24),
                          const SizedBox(width: 8.0),
                          PoppinsText(
                            _settingsStrings.autoplayPreviewTitle,
                            fontSize: PoppinsFontSizeVariant.size16,
                            fontWeight: PoppinsFontWeightVariant.regular,
                            color: textColor,
                          ),
                        ],
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(left: 32.0),
                        child: PoppinsText(
                          _settingsStrings.autoplayPreviewSubtitle,
                          fontSize: PoppinsFontSizeVariant.size14,
                          fontWeight: PoppinsFontWeightVariant.regular,
                          color: Colors.white70,
                        ),
                      ),
                      trailing: Switch(
                        value: _autoplayNextPreview,
                        onChanged: (bool value) {
                          setState(() {
                            _autoplayNextPreview = value;
                          });
                        },
                        // Applying gradient colors to switch
                        activeColor: gradientEndColor,
                        activeTrackColor: gradientStartColor.withOpacity(0.5),
                      ),
                    ),

                    // --- Video Quality ---
                    _buildSectionHeader(
                      _settingsStrings.videoQualityTitle,
                      textColor,
                    ),

                    // 3. Streaming Quality Dropdown (Column structure for title/subtitle/dropdown is maintained)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: horizontalPadding,
                        vertical: 8.0,
                      ),
                      child: Column(
                        // This is the required Column wrapper
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.hd, color: textColor, size: 24),
                              const SizedBox(width: 8.0),
                              PoppinsText(
                                _settingsStrings.streamingQualityTitle,
                                fontSize: PoppinsFontSizeVariant.size16,
                                fontWeight: PoppinsFontWeightVariant.regular,
                                color: textColor,
                              ),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          PoppinsText(
                            _settingsStrings.streamingQualitySubtitle,
                            fontSize: PoppinsFontSizeVariant.size14,
                            fontWeight: PoppinsFontWeightVariant.regular,
                            color: Colors.white70,
                          ),
                          const SizedBox(height: 8.0),

                          DropdownButtonFormField<String>(
                            value: _streamingQuality,
                            // 🔥 Use dropdownBackgroundColor (customColors.lightGray)
                            dropdownColor: dropdownBackgroundColor,
                            style: TextStyle(color: textColor, fontSize: 16.0),
                            decoration: InputDecoration(
                              filled: true,
                              // 🔥 Use dropdownBackgroundColor (customColors.lightGray)
                              fillColor: dropdownBackgroundColor,
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
                              color: textColor,
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
                                      color: textColor,
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
                      _settingsStrings.accessibilityTitle,
                      textColor,
                    ),

                    // 4. Subtitles & Captions Dropdown (Column structure for title/subtitle/dropdown is maintained)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: horizontalPadding,
                        vertical: 8.0,
                      ),
                      child: Column(
                        // This is the required Column wrapper
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.closed_caption,
                                color: textColor,
                                size: 24,
                              ),
                              const SizedBox(width: 8.0),
                              PoppinsText(
                                _settingsStrings.subtitlesTitle,
                                fontSize: PoppinsFontSizeVariant.size16,
                                fontWeight: PoppinsFontWeightVariant.regular,
                                color: textColor,
                              ),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          PoppinsText(
                            _settingsStrings.subtitlesSubtitle,
                            fontSize: PoppinsFontSizeVariant.size14,
                            fontWeight: PoppinsFontWeightVariant.regular,
                            color: Colors.white70,
                          ),
                          const SizedBox(height: 8.0),

                          DropdownButtonFormField<String>(
                            value: _subtitlesLanguage,
                            // 🔥 Use dropdownBackgroundColor (customColors.lightGray)
                            dropdownColor: dropdownBackgroundColor,
                            style: TextStyle(color: textColor, fontSize: 16.0),
                            decoration: InputDecoration(
                              filled: true,
                              // 🔥 Use dropdownBackgroundColor (customColors.lightGray)
                              fillColor: dropdownBackgroundColor,
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
                              color: textColor,
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
                                      color: textColor,
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
                        color: Colors.white12,
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
                          // Handle account deletion logic
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
                                  _settingsStrings.deleteAccountButton,
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
