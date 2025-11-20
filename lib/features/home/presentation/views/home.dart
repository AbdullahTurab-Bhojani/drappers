import 'package:flutter/material.dart';
import '../../../../drappers.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../shared/widgets/app_bar/main_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(Assets.images.screensbg.path, fit: BoxFit.cover),
          ),
          Column(
            children: [
              AppMainBar(
                width: 285,
                leadingText: "Welcome Back John!",
                title: "",
                centerTitle: false,
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: [
                  Image.asset(
                    Assets.images.searchicon.path,
                    color: Colors.white,
                  ),
                  SizedBox(width: 16),
                  Image.asset(
                    Assets.images.notificationsicon.path,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                ],
              ),
              SizedBox(height: 30),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 45,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 10),
                          shrinkWrap: true,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1,
                                ),
                              ),
                              child: Center(child: PoppinsText('data')),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
