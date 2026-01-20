import 'package:flutter/material.dart';
import '../../core/extensions/theme_extension.dart';
import '../../core/theme/app_scalar.dart';
import '../../drappers.dart';

class NotificationSectionWidget extends StatefulWidget {
  final String title;
  final List<Map<String, dynamic>> notifications;

  const NotificationSectionWidget({
    super.key,
    required this.title,
    required this.notifications,
  });

  @override
  State<NotificationSectionWidget> createState() =>
      _NotificationSectionWidgetState();
}

class _NotificationSectionWidgetState extends State<NotificationSectionWidget> {
  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<AppCustomColors>()!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppScaler.scaleSize(context, 16),
              vertical: AppScaler.scaleHeight(context, 8),
            ),
            decoration: BoxDecoration(
              color: AppColors.color1A1E24,
              borderRadius: BorderRadius.circular(40),
            ),
            child: PoppinsText(
              context,
              widget.title,
              fontSize: PoppinsFontSizeVariant.size16,
              fontWeight: PoppinsFontWeightVariant.medium,
              color: customColors.textColor,
            ),
          ),
        ),

        SizedBox(height: AppScaler.scaleHeight(context, 20)),

        ...widget.notifications.map((item) {
          return GestureDetector(
            onTap: () {
              setState(() {
                for (var i = 0; i < widget.notifications.length; i++) {
                  widget.notifications[i]['showExtra'] = false;
                }
                item['showExtra'] = true;
              });
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: item['showExtra'] != null && item['showExtra']
                    ? AppColors.color202020.withOpacity(0.5)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  top: AppScaler.scaleHeight(context, 20),
                  bottom: AppScaler.scaleHeight(context, 10),
                  left: AppScaler.scaleSize(context, 20),
                  right: AppScaler.scaleSize(context, 20),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PoppinsText(
                            context,
                            item['title'],
                            color: customColors.textColor,
                            fontSize: PoppinsFontSizeVariant.size16,
                            fontWeight: PoppinsFontWeightVariant.regular,
                          ),
                          SizedBox(height: AppScaler.scaleHeight(context, 4)),
                          PoppinsText(
                            context,
                            item['time'],
                            fontSize: PoppinsFontSizeVariant.size12,
                            fontWeight: PoppinsFontWeightVariant.regular,
                            color: customColors.textColor,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: AppScaler.scaleSize(context, 12)),
                    Container(
                      margin: EdgeInsets.only(
                        top: AppScaler.scaleHeight(context, 5),
                      ),
                      width: AppScaler.scaleSize(context, 78),
                      height: AppScaler.scaleHeight(context, 44),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: AssetImage(item['image']),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    if (item['showExtra'] != null && item['showExtra']) ...[
                      SizedBox(width: AppScaler.scaleSize(context, 12)),
                      Container(
                        margin: EdgeInsets.only(
                          top: AppScaler.scaleHeight(context, 15),
                        ),
                        child: PoppinsText(
                          context,
                          "New!",
                          fontSize: PoppinsFontSizeVariant.size12,
                          fontWeight: PoppinsFontWeightVariant.semiBold,
                          color: customColors.textColor,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}
