import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_scalar.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';
import '../../../shared/widgets/app_bar/main_app_bar.dart';
import '../../../shared/widgets/guestloginwidget.dart';
import '../../../shared/widgets/popupmenuitem/popupmenu_widget.dart';

class Documentriescard extends StatefulWidget {
  const Documentriescard({super.key});

  @override
  State<Documentriescard> createState() => _DocumentriescardState();
}

class _DocumentriescardState extends State<Documentriescard> {
  @override
  Widget build(BuildContext context) {
    List<String> documentries = [
      Assets.images.documentriesimage1.path,
      Assets.images.documentriesimage2.path,
      Assets.images.documentriesimage3.path,
      Assets.images.documentriesimage4.path,
      Assets.images.documentriesimage5.path,
      Assets.images.documentriesimage6.path,
    ];

    final screenWidth = MediaQuery.of(context).size.width;

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
          children: [
            AppMainBar(
              leading: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    left: AppScaler.scaleSize(context, 20),
                  ),
                  child: Image.asset(
                    "assets/images/backicon.png",
                    width: AppScaler.scaleSize(context, 20),
                    height: AppScaler.scaleHeight(context, 20),
                  ),
                ),
              ),
              title: "Documentries",
              centerTitle: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: [
                Padding(
                  padding: EdgeInsets.only(
                    right: AppScaler.scaleSize(context, 16),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      if (GuestHelper.isGuest) {
                        GuestHelper.checkGuest(context);
                        return;
                      }
                      context.pushNamed('searchscreen');
                    },
                    child: Image.asset(
                      Assets.images.searchstokeicon.path,
                      width: AppScaler.scaleSize(context, 20),
                      height: AppScaler.scaleHeight(context, 20),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: AppScaler.scaleHeight(context, 30)),

            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: AppScaler.scaleSize(context, 12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GridView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: AppScaler.scaleSize(context, 10),
                        mainAxisSpacing: AppScaler.scaleHeight(context, 10),
                        childAspectRatio:
                            (screenWidth / 3) /
                            AppScaler.scaleHeight(context, 200),
                      ),
                      itemCount: documentries.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            context.pushNamed(AppRoutes.contentDetail.name);
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              AppScaler.scaleSize(context, 12),
                            ),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.asset(
                                  documentries[index],
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                  top: AppScaler.scaleHeight(context, 4),
                                  right: AppScaler.scaleSize(context, 4),
                                  child: PopupmenuWidget(showSaveIcon: false),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: AppScaler.scaleHeight(context, 20)),

                    PoppinsText(
                      context,
                      "More like this",
                      fontSize: PoppinsFontSizeVariant.size16,
                      fontWeight: PoppinsFontWeightVariant.medium,
                    ),
                    SizedBox(height: AppScaler.scaleHeight(context, 20)),

                    GridView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: AppScaler.scaleSize(context, 10),
                        mainAxisSpacing: AppScaler.scaleHeight(context, 10),
                        childAspectRatio:
                            (screenWidth / 3) /
                            AppScaler.scaleHeight(context, 200),
                      ),
                      itemCount: documentries.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            context.pushNamed(AppRoutes.contentDetail.name);
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              AppScaler.scaleSize(context, 12),
                            ),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.asset(
                                  documentries[index],
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                  top: AppScaler.scaleHeight(context, 4),
                                  right: AppScaler.scaleSize(context, 4),
                                  child: PopupmenuWidget(showSaveIcon: false),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),

                    SizedBox(height: AppScaler.scaleHeight(context, 30)),
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
