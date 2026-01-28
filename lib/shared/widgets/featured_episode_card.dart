// featured_episode_card.dart
// ignore_for_file: deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/extensions/theme_extension.dart';
import '../../../core/theme/app_scalar.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';
import '../../features/voteforstartup/domain/models/startup_model.dart';
import 'guestloginwidget.dart';

class FeaturedEpisodeCard extends StatefulWidget {
  final StartupModel? startupModel;
  final Future<void> Function()? onVotePressed;

  const FeaturedEpisodeCard({
    required this.startupModel,
    super.key,
    required this.onVotePressed,
  });

  @override
  State<FeaturedEpisodeCard> createState() => _FeaturedEpisodeCardState();
}

class _FeaturedEpisodeCardState extends State<FeaturedEpisodeCard> {
  bool isSaved = false;
  double sliderValue = 40;
  bool _isVoting = false;
  bool? _optimisticLiked;

  final List<String> tags = ['Clean Tech', 'Energy Storage', 'Sustainability'];
  final List<String> twotags = ['B2B', 'Hardware'];

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
            widget.startupModel!.startupTitle,
            fontSize: PoppinsFontSizeVariant.size22,
            fontWeight: PoppinsFontWeightVariant.medium,
            color: customColors.textColor,
          ),
          SizedBox(height: AppScaler.scaleHeight(context, 2)),
          PoppinsText(
            context,
            widget.startupModel!.startupSubTitle,
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
              SizedBox(
                width:
                    (MediaQuery.of(context).size.width -
                        (2 * horizontalPadding) -
                        10) /
                    2,
                child: OutlinedButton.icon(
                  onPressed: _isVoting
                      ? null
                      : () async {
                          if (GuestHelper.isGuest) {
                            GuestHelper.checkGuest(context);
                            return;
                          }

                          if (widget.onVotePressed != null) {
                            final current =
                                _optimisticLiked ??
                                widget.startupModel!.isLikedByUser ??
                                false;

                            setState(() {
                              _isVoting = true;
                              _optimisticLiked = !current;
                            });

                            try {
                              await widget.onVotePressed!();
                            } catch (e) {
                              setState(() => _optimisticLiked = current);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Vote failed: ${e.toString()}'),
                                ),
                              );
                            } finally {
                              setState(() => _isVoting = false);
                            }
                          }
                        },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color:
                          (_optimisticLiked ??
                              widget.startupModel!.isLikedByUser ??
                              false)
                          ? Colors.red
                          : customColors.greyColor,
                      width: AppScaler.scaleSize(context, 2),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12),
                    backgroundColor:
                        (_optimisticLiked ??
                            widget.startupModel!.isLikedByUser ??
                            false)
                        ? Colors.red.withOpacity(0.1)
                        : Colors.transparent,
                  ),
                  icon: _isVoting
                      ? SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.red,
                            ),
                          ),
                        )
                      : Icon(
                          (_optimisticLiked ??
                                  widget.startupModel!.isLikedByUser ??
                                  false)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          size: 24,
                          color:
                              (_optimisticLiked ??
                                  widget.startupModel!.isLikedByUser ??
                                  false)
                              ? Colors.red
                              : customColors.textColor,
                        ),
                  label: _isVoting
                      ? PoppinsText(
                          context,
                          'Voting...',
                          fontSize: PoppinsFontSizeVariant.size16,
                          fontWeight: PoppinsFontWeightVariant.medium,
                          color: Colors.red,
                        )
                      : PoppinsText(
                          context,
                          (_optimisticLiked ??
                                  widget.startupModel!.isLikedByUser ??
                                  false)
                              ? 'Voted'
                              : 'Vote',
                          fontSize: PoppinsFontSizeVariant.size16,
                          fontWeight: PoppinsFontWeightVariant.medium,
                          color:
                              (_optimisticLiked ??
                                  widget.startupModel!.isLikedByUser ??
                                  false)
                              ? Colors.red
                              : AppColors.wDark,
                        ),
                ),
              ),
            ],
          ),

          SizedBox(height: AppScaler.scaleHeight(context, 35)),

          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: customColors.textColor.withOpacity(0.2),
                width: 1,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade200,
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: CachedNetworkImage(
                    imageUrl: widget.startupModel!.founderPictureUrl.isNotEmpty
                        ? widget.startupModel!.founderPictureUrl
                        : 'https://mis.ihc.gov.pk/img/no-video.jpg',
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        LoadingWidget(color: AppColors.buttoncolor.first),
                    errorWidget: (context, url, error) => const Center(
                      child: Icon(Icons.person, size: 35, color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(width: AppScaler.scaleSize(context, 20)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PoppinsText(
                      context,
                      widget.startupModel!.founderName,
                      fontSize: PoppinsFontSizeVariant.size16,
                      fontWeight: PoppinsFontWeightVariant.regular,
                      color: customColors.textColor,
                    ),
                    SizedBox(height: AppScaler.scaleHeight(context, 5)),
                    SizedBox(
                      width: AppScaler.scaleSize(context, 280),
                      child: PoppinsText(
                        context,
                        widget.startupModel!.founderTitle,
                        fontSize: PoppinsFontSizeVariant.size12,
                        fontWeight: PoppinsFontWeightVariant.regular,
                        color: customColors.textColor.withOpacity(0.5),
                        maxLines: 2,
                        textOverflow: TextOverflow.clip,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: AppScaler.scaleHeight(context, 25)),

          PoppinsText(
            context,
            'Company Information',
            fontSize: PoppinsFontSizeVariant.size16,
            fontWeight: PoppinsFontWeightVariant.regular,
            color: customColors.textColor,
          ),
          SizedBox(height: AppScaler.scaleHeight(context, 10)),

          _CompanyInfoRow(
            label: "Founder",
            value: widget.startupModel!.founderName,
            customColors: customColors,
          ),
          _CompanyInfoRow(
            label: "Founded",
            value: widget.startupModel!.founded,
            customColors: customColors,
          ),
          _CompanyInfoRow(
            label: "Team Size",
            value: widget.startupModel!.teamSize,
            customColors: customColors,
          ),
          _CompanyInfoRow(
            label: "Funding Stage",
            value: widget.startupModel!.fundingStage,
            customColors: customColors,
          ),
          SizedBox(height: AppScaler.scaleHeight(context, 25)),

          PoppinsText(
            context,
            'About the Startup',
            fontSize: PoppinsFontSizeVariant.size16,
            fontWeight: PoppinsFontWeightVariant.regular,
            color: customColors.textColor,
          ),
          SizedBox(height: AppScaler.scaleHeight(context, 10)),
          PoppinsText(
            context,
            widget.startupModel!.aboutStartup,
            fontSize: PoppinsFontSizeVariant.size12,
            fontWeight: PoppinsFontWeightVariant.regular,
            height: 1.8,
            color: customColors.textColor.withOpacity(0.6),
          ),

          SizedBox(height: AppScaler.scaleHeight(context, 25)),

          PoppinsText(
            context,
            'Featured Episode',
            fontSize: PoppinsFontSizeVariant.size16,
            fontWeight: PoppinsFontWeightVariant.regular,
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
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: customColors.greyColor, width: 1),
      ),
      child: Center(
        child: PoppinsText(
          context,
          label,
          fontSize: PoppinsFontSizeVariant.size12,
          fontWeight: PoppinsFontWeightVariant.regular,
          color: customColors.textColor,
        ),
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
            fontSize: PoppinsFontSizeVariant.size12,
            fontWeight: PoppinsFontWeightVariant.regular,
            color: customColors.labelColor,
          ),
          PoppinsText(
            context,
            value,
            fontSize: PoppinsFontSizeVariant.size12,
            fontWeight: PoppinsFontWeightVariant.semiBold,
            color: customColors.textColor,
          ),
        ],
      ),
    );
  }
}
