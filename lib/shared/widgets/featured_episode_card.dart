// featured_episode_card.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/extensions/theme_extension.dart';
import '../../../core/theme/app_scalar.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';
import 'guestloginwidget.dart';

class FeaturedEpisodeCard extends StatefulWidget {
  const FeaturedEpisodeCard({super.key});

  @override
  State<FeaturedEpisodeCard> createState() => _FeaturedEpisodeCardState();
}

class _FeaturedEpisodeCardState extends State<FeaturedEpisodeCard> {
  bool isSaved = false;
  bool isVoted = false;
  double sliderValue = 40;

  final List<String> tags = ['Clean Tech', 'Energy Storage', 'Sustainability'];
  final List<String> twotags = ['B2B', 'Hardware'];

  final List<Map<String, String>> companyInfo = [
    {'label': 'Founded', 'value': '2022'},
    {'label': 'Team Size', 'value': '12 Employees'},
    {'label': 'Funding Stage', 'value': 'Series A'},
    {'label': 'Website', 'value': 'https://lost-lab.info'},
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;
    double horizontalPadding = 16.0;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: AppScaler.scaleHeight(context, 16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PoppinsText(
            context,
            'Echo Tech Solutions',
            fontSize: PoppinsFontSizeVariant.size22,
            fontWeight: PoppinsFontWeightVariant.medium,
            color: customColors.textColor,
          ),
          SizedBox(height: AppScaler.scaleHeight(context, 2)),
          PoppinsText(
            context,
            'Sustainable energy Revolution',
            fontSize: PoppinsFontSizeVariant.size16,
            fontWeight: PoppinsFontWeightVariant.regular,
            color: customColors.textColor,
          ),
          SizedBox(height: AppScaler.scaleHeight(context, 16)),

          SizedBox(
            height: AppScaler.scaleHeight(context, 35),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tags.length,
              itemBuilder: (context, index) {
                return _TagChip(label: tags[index], customColors: customColors);
              },
            ),
          ),
          SizedBox(height: AppScaler.scaleHeight(context, 10)),
          SizedBox(
            height: AppScaler.scaleHeight(context, 35),
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
          SizedBox(height: AppScaler.scaleHeight(context, 30)),

          AppButton(
            prefixIcon: Image.asset(
              Assets.images.playstrokeicon.path,
              width: AppScaler.scaleSize(context, 20),
              height: AppScaler.scaleHeight(context, 20),
            ),
            onPressed: () {
              context.pushNamed(AppRoutes.videoScreen.name);
            },
            title: "Watch Episode",
          ),
          SizedBox(height: AppScaler.scaleHeight(context, 10)),

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
                  onPressed: () {
                    if (GuestHelper.isGuest) {
                      GuestHelper.checkGuest(context);
                      return;
                    }
                    setState(() {
                      isSaved = !isSaved;
                    });
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: customColors.greyColor,
                      width: AppScaler.scaleSize(context, 2),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12),
                    backgroundColor: Colors.transparent,
                  ),
                  icon: Icon(
                    isSaved ? Icons.bookmark : Icons.bookmark_border,
                    size: AppScaler.scaleFont(context, 24),
                    color: AppColors.wDark,
                  ),
                  label: PoppinsText(
                    context,
                    isSaved ? 'Saved' : 'Save',
                    fontSize: PoppinsFontSizeVariant.size16,
                    fontWeight: PoppinsFontWeightVariant.medium,
                    color: AppColors.wDark,
                  ),
                ),
              ),

              SizedBox(width: AppScaler.scaleSize(context, 10)),

              SizedBox(
                width:
                    (MediaQuery.of(context).size.width -
                        (2 * horizontalPadding) -
                        10) /
                    2,
                child: OutlinedButton.icon(
                  onPressed: () {
                    if (GuestHelper.isGuest) {
                      GuestHelper.checkGuest(context);
                      return;
                    }
                    setState(() {
                      isVoted = !isVoted;
                    });
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: customColors.greyColor,
                      width: AppScaler.scaleSize(context, 2),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12),
                    backgroundColor: Colors.transparent,
                  ),
                  icon: Icon(
                    isVoted ? Icons.favorite : Icons.favorite_border,
                    size: 24,
                    color: isVoted ? Colors.red : customColors.textColor,
                  ),
                  label: PoppinsText(
                    context,
                    isVoted ? 'Voted' : 'Vote',
                    fontSize: PoppinsFontSizeVariant.size16,
                    fontWeight: PoppinsFontWeightVariant.medium,
                    color: AppColors.wDark,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: AppScaler.scaleHeight(context, 30)),

          ...companyInfo.map(
            (info) => _CompanyInfoRow(
              label: info['label']!,
              value: info['value']!,
              customColors: customColors,
            ),
          ),
          SizedBox(height: AppScaler.scaleHeight(context, 25)),

          PoppinsText(
            context,
            'About the Startup',
            fontSize: PoppinsFontSizeVariant.size20,
            fontWeight: PoppinsFontWeightVariant.medium,
            color: customColors.textColor,
          ),
          SizedBox(height: AppScaler.scaleHeight(context, 10)),
          PoppinsText(
            context,
            'Simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s...',
            fontSize: PoppinsFontSizeVariant.size14,
            fontWeight: PoppinsFontWeightVariant.regular,
            color: customColors.labelColor,
          ),

          SizedBox(height: AppScaler.scaleHeight(context, 25)),

          PoppinsText(
            context,
            'Featured Episode',
            fontSize: PoppinsFontSizeVariant.size20,
            fontWeight: PoppinsFontWeightVariant.medium,
            color: customColors.textColor,
          ),
          SizedBox(height: AppScaler.scaleHeight(context, 15)),

          _FeaturedEpisodeVideoCard(sliderValue: sliderValue),
        ],
      ),
    );
  }
}

class _FeaturedEpisodeVideoCard extends StatelessWidget {
  final double sliderValue;
  const _FeaturedEpisodeVideoCard({required this.sliderValue});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: AppScaler.scaleSize(context, 122),
          height: AppScaler.scaleHeight(context, 200),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.images.documentaries4.path),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        SizedBox(width: AppScaler.scaleSize(context, 12)),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PoppinsText(
                context,
                "Finale – Meet The Drapers Season 07 (2025)",
                fontSize: PoppinsFontSizeVariant.size16,
                fontWeight: PoppinsFontWeightVariant.medium,
                maxLines: 2,
                textOverflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: AppScaler.scaleHeight(context, 20)),
              PoppinsText(
                context,
                "Meet the Drapers returns to SHACK15 for an electrifying TikTok Global episode, spotlighting visionary startups from across the world. Judges evaluate innovations in connectivity, accessibility, and education.",
                fontSize: PoppinsFontSizeVariant.size14,
                fontWeight: PoppinsFontWeightVariant.regular,
                color: Colors.grey,
                maxLines: 2,
                textOverflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: AppScaler.scaleHeight(context, 20)),

              Row(
                children: [
                  Expanded(
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight: 3,
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 0,
                        ),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 0),
                      ),
                      child: Slider(
                        activeColor: Color(0xFF0072FF),
                        inactiveColor: Color(0xFF00002A),
                        value: sliderValue,
                        min: 0,
                        max: 100,
                        onChanged: (v) {},
                      ),
                    ),
                  ),
                  SizedBox(width: AppScaler.scaleSize(context, 8)),
                  PoppinsText(
                    context,
                    '-12:34',
                    fontSize: PoppinsFontSizeVariant.size10,
                    fontWeight: PoppinsFontWeightVariant.regular,
                    color: customColors.textColor,
                  ),
                ],
              ),
              SizedBox(height: AppScaler.scaleHeight(context, 20)),

              AppButton(
                onPressed: () {
                  context.pushNamed(AppRoutes.videoScreen.name);
                },
                title: 'Watch Episode',
                buttonSize: Size(
                  double.infinity,
                  AppScaler.scaleHeight(context, 40),
                ),
                prefixIcon: Image.asset(
                  Assets.images.playstrokeicon.path,
                  width: AppScaler.scaleSize(context, 14),
                  height: AppScaler.scaleHeight(context, 14),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TagChip extends StatelessWidget {
  final String label;
  final AppCustomColors customColors;
  const _TagChip({required this.label, required this.customColors});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: customColors.greyColor, width: 1),
      ),
      child: PoppinsText(
        context,
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
      padding: EdgeInsets.symmetric(
        vertical: AppScaler.scaleHeight(context, 6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PoppinsText(
            context,
            '$label:',
            fontSize: PoppinsFontSizeVariant.size14,
            fontWeight: PoppinsFontWeightVariant.regular,
            color: customColors.labelColor,
          ),
          PoppinsText(
            context,
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
