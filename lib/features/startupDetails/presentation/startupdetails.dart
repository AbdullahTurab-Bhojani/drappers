import 'package:flutter/material.dart';

import '../../../core/extensions/theme_extension.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';
import '../../../shared/widgets/app_bar/main_app_bar.dart';
import '../../../shared/widgets/watch_history_viewmore.dart';

class Startupdetails extends StatefulWidget {
  const Startupdetails({super.key});

  @override
  State<Startupdetails> createState() => _StartupdetailsState();
}

class _TagChip extends StatelessWidget {
  final String label;
  final AppCustomColors customColors;

  const _TagChip({required this.label, required this.customColors});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: customColors.greyColor, width: 1),
      ),
      child: PoppinsText(
        label,
        fontSize: PoppinsFontSizeVariant.size12,
        fontWeight: PoppinsFontWeightVariant.regular,
        color: customColors.textColor,
      ),
    );
  }
}

class _CompanyInfoRow extends StatelessWidget {
  final String label;
  final String value;
  final AppCustomColors customColors;

  const _CompanyInfoRow({
    required this.label,
    required this.value,
    required this.customColors,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Label (e.g., Founded)
          PoppinsText(
            '$label:',
            fontSize: PoppinsFontSizeVariant.size14,
            fontWeight: PoppinsFontWeightVariant.regular,
            color: customColors.labelColor,
          ),
          // Value (e.g., 2021)
          PoppinsText(
            value,
            fontSize: PoppinsFontSizeVariant.size14,
            fontWeight: PoppinsFontWeightVariant.medium,
            color: customColors.textColor,
          ),
        ],
      ),
    );
  }
}

class _StartupdetailsState extends State<Startupdetails> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;
    const double horizontalPadding = 16.0;
    final List<String> tags = [
      'Clean Tech',
      'Energy Storage',
      'Sustainability',
    ];

    final List<String> twotags = ['B2B', 'Hardware'];
    final List<Map<String, String>> companyInfo = [
      {'label': 'Founded', 'value': '2022'},
      {'label': 'Team Size', 'value': '12 Employees'},
      {'label': 'Funding Stage', 'value': 'Series A'},
      {'label': 'Website', 'value': 'https://lost-lab.info'},
    ];

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
              leading: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Image.asset(
                    "assets/images/backicon.png",
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
              title: "Startup Details",
              centerTitle: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
              // trailing: Padding(
              //   padding: const EdgeInsets.only(right: 16.0),
              //   // Using the share icon from the previous design suggestion
              //   child: Icon(Icons.send, color: customColors.textColor, size: 24),
              // ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // --- VIDEO CONTAINER ---
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: horizontalPadding,
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 215,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage(Assets.images.podcastimage1.path),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Center(
                              child: Image.asset(
                                Assets.images.playwithbgicon.path,
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              right: 10,
                              child: Image.asset(Assets.images.muteicon.path),
                            ),
                            Positioned(
                              top: 10,
                              right: 10,
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: horizontalPadding,
                        vertical: 16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PoppinsText(
                            'Echo Tech Solutions',
                            fontSize: PoppinsFontSizeVariant.size22,
                            fontWeight: PoppinsFontWeightVariant.medium,
                            color: customColors.textColor,
                          ),
                          const SizedBox(height: 2),
                          PoppinsText(
                            'Sustainable energy Revolution',
                            fontSize: PoppinsFontSizeVariant.size16,
                            fontWeight: PoppinsFontWeightVariant.regular,
                            color: customColors.textColor,
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            height: 35,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: tags.length,
                              itemBuilder: (context, index) {
                                return _TagChip(
                                  label: tags[index],
                                  customColors: customColors,
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                            height: 35,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: twotags.length,
                              itemBuilder: (context, index) {
                                return _TagChip(
                                  label: twotags[index],
                                  customColors: customColors,
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 30),
                          AppButton(onPressed: () {}, title: "Watch Episode"),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width:
                                    (MediaQuery.of(context).size.width -
                                        (2 * horizontalPadding) -
                                        10) /
                                    2,
                                child: OutlinedButton.icon(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                      color: customColors.greyColor,
                                      width: 2,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 12,
                                    ),
                                    backgroundColor: Colors.transparent,
                                  ),
                                  icon: Icon(
                                    Icons.bookmark_border,
                                    size: 24,
                                    color: customColors.textColor,
                                  ),
                                  label: PoppinsText(
                                    'Save',
                                    fontSize: PoppinsFontSizeVariant.size16,
                                    fontWeight: PoppinsFontWeightVariant.medium,
                                    color: customColors.subtextColor,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              // Vote Button
                              SizedBox(
                                width:
                                    (MediaQuery.of(context).size.width -
                                        (2 * horizontalPadding) -
                                        10) /
                                    2,
                                child: OutlinedButton.icon(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                      color: customColors.greyColor,
                                      width: 2,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 12,
                                    ),
                                    backgroundColor: Colors.transparent,
                                  ),
                                  icon: Icon(
                                    Icons.favorite_border,
                                    size: 24,
                                    color: customColors.textColor,
                                  ),
                                  label: PoppinsText(
                                    'Vote',
                                    fontSize: PoppinsFontSizeVariant.size16,
                                    fontWeight: PoppinsFontWeightVariant.medium,
                                    color: customColors.subtextColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: customColors.greyColor.withOpacity(0.3),
                                width: 1,
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage(
                                    Assets.images.guestProfile.path,
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      PoppinsText(
                                        'Jerry Mackson',
                                        fontSize: PoppinsFontSizeVariant.size18,
                                        fontWeight:
                                            PoppinsFontWeightVariant.medium,
                                        color: customColors.textColor,
                                      ),
                                      const SizedBox(height: 2),
                                      PoppinsText(
                                        'Former Tesla Engineer 8+ Years experience in Battery Technology',
                                        fontSize: PoppinsFontSizeVariant.size12,
                                        fontWeight:
                                            PoppinsFontWeightVariant.regular,
                                        color: customColors.labelColor,
                                        maxLines: 2,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          PoppinsText(
                            'Cast: Leonardo DiCaprio, Jonah Hill, Margot Robbie, Matthew... more',
                            fontSize: PoppinsFontSizeVariant.size12,
                            fontWeight: PoppinsFontWeightVariant.regular,
                            color: customColors.labelColor,
                          ),
                          PoppinsText(
                            'Director: Denis Villeneuve',
                            fontSize: PoppinsFontSizeVariant.size12,
                            fontWeight: PoppinsFontWeightVariant.regular,
                            color: customColors.labelColor,
                          ),
                          const SizedBox(height: 25),
                          PoppinsText(
                            'Company Information',
                            fontSize: PoppinsFontSizeVariant.size20,
                            fontWeight: PoppinsFontWeightVariant.medium,
                            color: customColors.textColor,
                          ),
                          const SizedBox(height: 10),
                          ...companyInfo
                              .map(
                                (info) => _CompanyInfoRow(
                                  label: info['label']!,
                                  value: info['value']!,
                                  customColors: customColors,
                                ),
                              )
                              .toList(),
                          const SizedBox(height: 25),
                          PoppinsText(
                            'About the Startup',
                            fontSize: PoppinsFontSizeVariant.size20,
                            fontWeight: PoppinsFontWeightVariant.medium,
                            color: customColors.textColor,
                          ),
                          const SizedBox(height: 10),
                          PoppinsText(
                            'simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                            fontSize: PoppinsFontSizeVariant.size14,
                            fontWeight: PoppinsFontWeightVariant.regular,
                            color: customColors.labelColor,
                          ),
                          const SizedBox(height: 25),

                          PoppinsText(
                            'Featured Episode',
                            fontSize: PoppinsFontSizeVariant.size20,
                            fontWeight: PoppinsFontWeightVariant.medium,
                            color: customColors.textColor,
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.only(bottom: 20),
                            child: IntrinsicHeight(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    width: 120,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          Assets.images.podcastimage1.path,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        PoppinsText(
                                          "podcast.title",
                                          fontSize:
                                              PoppinsFontSizeVariant.size16,
                                          fontWeight:
                                              PoppinsFontWeightVariant.medium,
                                          textOverflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(height: 20),
                                        PoppinsText(
                                          "podcast.description",
                                          fontSize:
                                              PoppinsFontSizeVariant.size14,
                                          fontWeight:
                                              PoppinsFontWeightVariant.regular,
                                          color: Colors.grey,
                                          maxLines: 2,
                                          textOverflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(height: 20),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: SliderTheme(
                                                data: SliderTheme.of(context)
                                                    .copyWith(
                                                      trackHeight: 3,
                                                      thumbShape:
                                                          RoundSliderThumbShape(
                                                            enabledThumbRadius:
                                                                0,
                                                          ),
                                                      overlayShape:
                                                          RoundSliderOverlayShape(
                                                            overlayRadius: 0,
                                                          ),
                                                    ),
                                                child: Column(),
                                              ),
                                            ),
                                            SizedBox(width: 8),
                                            PoppinsText(
                                              '-12:34',
                                              fontSize:
                                                  PoppinsFontSizeVariant.size10,
                                              fontWeight:
                                                  PoppinsFontWeightVariant
                                                      .regular,
                                              color: AppColors.wDark,
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 20),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: AppButton(
                                                onPressed: () {},
                                                title: 'Continue',
                                                buttonSize: Size(
                                                  double.infinity,
                                                  40,
                                                ),
                                                prefixIcon: Image.asset(
                                                  Assets
                                                      .images
                                                      .playstrokeicon
                                                      .path,
                                                  width: 14,
                                                  height: 14,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 20),
                                            Image.asset(
                                              Assets.images.cancelicon.path,
                                              height: 40,
                                            ),
                                          ],
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
