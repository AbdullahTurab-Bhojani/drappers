// ignore_for_file: deprecated_member_use, sized_box_for_whitespace, unused_element, unused_field, unused_local_variable

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_scalar.dart';
import '../../../../core/extensions/theme_extension.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../shared/widgets/popupmenuitem/popupmenu_widget.dart';
import '../../drappers.dart';
import 'guestloginwidget.dart';

class FullscreenImageScreen extends StatefulWidget {
  final String imagePath;
  final String title;

  const FullscreenImageScreen({
    super.key,
    required this.imagePath,
    required this.title,
  });

  @override
  State<FullscreenImageScreen> createState() => _FullscreenImageScreenState();
}

class _FullscreenImageScreenState extends State<FullscreenImageScreen> {
  bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;

    return Center(
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.35),
              blurRadius: 30,
              spreadRadius: 4,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: SizedBox(
            width: AppScaler.scaleSize(context, 400),
            height: AppScaler.scaleHeight(context, 450),
            child: Stack(
              children: [
                Image.asset(
                  widget.imagePath,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
                Container(color: Colors.black.withOpacity(0.18)),
                Positioned(
                  top: AppScaler.scaleHeight(context, 16),
                  left: AppScaler.scaleSize(context, 14),
                  right: AppScaler.scaleSize(context, 14),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.title,
                          style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: AppScaler.scaleSize(context, 14),
                          ),
                        ),
                      ),
                      PopupmenuWidget(showSaveIcon: false),
                    ],
                  ),
                ),

                Positioned(
                  bottom: AppScaler.scaleHeight(context, 10),
                  left: AppScaler.scaleSize(context, 12),
                  right: AppScaler.scaleSize(context, 12),
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: AppScaler.scaleHeight(context, 45),
                          child: AppButton(
                            onPressed: () {
                              context.pushNamed(AppRoutes.contentDetail.name);
                            },
                            title: 'Play',
                            prefixIcon: Image.asset(
                              Assets.images.playstrokeicon.path,
                              width: AppScaler.scaleSize(context, 15),
                              height: AppScaler.scaleHeight(context, 15),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: AppScaler.scaleSize(context, 10)),
                      Expanded(
                        child: SizedBox(
                          height: AppScaler.scaleHeight(context, 45),
                          child: AppButton(
                            onPressed: () {
                              if (GuestHelper.isGuest) {
                                GuestHelper.checkGuest(context);
                                return;
                              }
                              setState(() {
                                if (!isAdded) {
                                  isAdded = true;
                                } else {
                                  context.pushNamed(
                                    AppRoutes.contentDetail.name,
                                  );
                                }
                              });
                            },
                            title: isAdded ? 'Added' : 'Watchlist',
                            buttonGradient: [
                              AppColors.color000011,
                              AppColors.color000011,
                            ],
                            prefixIcon: isAdded
                                ? Icon(
                                    Icons.check,
                                    size: 17,
                                    color: Theme.of(
                                      context,
                                    ).extension<AppCustomColors>()!.textColor,
                                  )
                                : Image.asset(
                                    Assets.images.addicon.path,
                                    width: AppScaler.scaleSize(context, 15),
                                    height: AppScaler.scaleHeight(context, 15),
                                  ),
                            fontSize: PoppinsFontSizeVariant.size14,
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
      ),
    );
  }
}
