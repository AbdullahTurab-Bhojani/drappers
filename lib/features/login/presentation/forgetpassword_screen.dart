import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/extensions/theme_extension.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';
import '../../../shared/widgets/textfield_new.dart';

class ForgetpasswordScreen extends StatefulWidget {
  ForgetpasswordScreen({super.key});

  @override
  State<ForgetpasswordScreen> createState() => _ForgetpasswordScreenState();
}

class _ForgetpasswordScreenState extends State<ForgetpasswordScreen> {
  final _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  bool isPhone = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;

    return Scaffold(
      body:
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.images.screensbg.path),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 20,right: 20,top: 70),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    context.go('/login');
                  },
                  child: Image.asset(
                  Assets.images.backicon.path
                )
                ),
                SizedBox(height: 40),
                PoppinsText(
                  "Forget Password?",
                  fontSize: PoppinsFontSizeVariant.size24,
                  fontWeight: PoppinsFontWeightVariant.semiBold,
                  color: customColors.textColor,
                ),
                SizedBox(height: 4),
                PoppinsText(
                  'Don’t worry, this happens.',
                  fontSize: PoppinsFontSizeVariant.size16,
                  fontWeight: PoppinsFontWeightVariant.regular,
                  color: customColors.textColor,
                ),
                SizedBox(height: 36),
                PoppinsText(
                  'Receive Code Via phone or email',
                  fontSize: PoppinsFontSizeVariant.size16,
                  fontWeight: PoppinsFontWeightVariant.regular,
                  color: customColors.textColor,
                ),
                SizedBox(height: 24),
                Container(
                  width: MediaQuery.of(context).size.width - 40,
                  child: Column(
                    children: [
                      RadioTileWidget(
                        selected: isPhone,
                        title: "Enter Your Email ",
                        subtitle: "jo********@gmail.co|",
                        onTap: () {
                          setState(() {
                            isPhone = true;
                          });
                        },
                      ),
                        
                      RadioTileWidget(
                        selected: !isPhone,
                        title: "Enter Phone ",
                        subtitle: "03xxxxxxx59",
                        onTap: () {
                          setState(() {
                            isPhone = false;
                          });
                        },
                      ),
                 SizedBox(height: 24),
                        AppButton(onPressed: () {
                context.goNamed(AppRoutes.verfiicationcodeScreen.name);
              }, title: "Send Code"),
                
                        
                    ],
                  ),
                ),
              ],
                        ),
            ),
          ),

         
    );
  }
}

class RadioTileWidget extends StatelessWidget {
  final bool selected;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  RadioTileWidget({
    super.key,
    required this.selected,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        margin: EdgeInsets.only(bottom: 14),
        decoration: BoxDecoration(
          color: Color(0xFF101317),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Transform.scale(
              scale: 1.3,
              child: Radio(
                value: true,
                groupValue: selected,
                onChanged: (_) => onTap(),
                activeColor: Colors.blue,
              ),
            ),
            // SizedBox(width: 8),
            Container(width: 0.5, height: 24, color: Colors.white),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PoppinsText(
                  title,
                  fontSize: PoppinsFontSizeVariant.size12,
                  color: AppColors.bGrey,
                  fontWeight: PoppinsFontWeightVariant.regular,
                ),
                PoppinsText(
                  subtitle,
                  fontSize: PoppinsFontSizeVariant.size16,
                  fontWeight: PoppinsFontWeightVariant.regular,
                  color: customColors.textColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
