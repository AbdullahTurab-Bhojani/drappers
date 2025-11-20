import 'package:flutter/material.dart';
import '../../../../drappers.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../shared/widgets/app_bar/main_app_bar.dart';
import '../../../core/extensions/theme_extension.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(Assets.images.screensbg.path, fit: BoxFit.cover),
          ),
          Column(
            children: [
              AppMainBar(
                leadingText: "Profile",
                width: 120,
                title: "",
                centerTitle: false,
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: [
                  PoppinsText(
                    "Edit",
                    fontSize: PoppinsFontSizeVariant.size14,
                    fontWeight: PoppinsFontWeightVariant.medium,
                  ),
                  SizedBox(width: 15),
                ],
              ),
              SizedBox(height: 50,),
              Padding(
                padding: EdgeInsets.only(left: 20,right: 20),
                child: Column(
                  children: [
                    CircleAvatar(
                radius: 60,
                        // radius: isSelected ? 15 : 15,
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage(
                          'https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D',
                        ),
                      ),
              SizedBox(height: 20,),
              PoppinsText(
                'Jerry Mackson',
                fontSize: PoppinsFontSizeVariant.size22,
                fontWeight: PoppinsFontWeightVariant.medium,
                color: customColors.textColor,
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PoppinsText(
                'Liked Content',
                fontSize: PoppinsFontSizeVariant.size16,
                fontWeight: PoppinsFontWeightVariant.medium,
                color: customColors.textColor,
              ),
                AppButton(
                  buttonSize: Size(80, 25),
                  color: Colors.transparent,
                  border: true,
                        onPressed: () {
                        },
                        title: "View More",
                      ),
                ],
              )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
