import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/extensions/theme_extension.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';
import '../../../shared/widgets/textfield_new.dart';

class ForgetpasswordScreen extends StatefulWidget {
  const ForgetpasswordScreen({super.key});

  @override
  State<ForgetpasswordScreen> createState() => _ForgetpasswordScreenState();
}

class _ForgetpasswordScreenState extends State<ForgetpasswordScreen> {
  final _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();


  @override
  Widget build(BuildContext context) {
     final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.images.screensbg.path),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Positioned(
            top: 80,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    context.go('/login');
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.color101317,
                    ),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                ),
                SizedBox(height: 40),
                PoppinsText(
                  "Forget Password?",
                  // style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  fontSize: PoppinsFontSizeVariant.size24,
                  fontWeight: PoppinsFontWeightVariant.semiBold,
                  color: customColors.textColor,

                ),
                SizedBox(height: 4),
                PoppinsText(
                  'Don’t worry, this happens.',
                  // style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                   fontSize: PoppinsFontSizeVariant.size16,
                  fontWeight: PoppinsFontWeightVariant.regular,
                  color: customColors.textColor,

                ),
                SizedBox(height: 36),
                PoppinsText(
                  'Receive Code Via phone or email',
                  // style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                   fontSize: PoppinsFontSizeVariant.size16,
                  fontWeight: PoppinsFontWeightVariant.regular,
                  color: customColors.textColor,

                ),
                SizedBox(height: 24),
                Container(
                  width: MediaQuery.of(context).size.width - 40,
                  child: NewTextField(
                      controller: _emailController,
                      labelText: "Enter your Email Address or Phone*",
                      hintText: "Enter your email",
                      filledColor: AppColors.tfield,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Email required";
                        }
                        if (!value.contains("@")) return "Enter valid email";
                        return null;
                      },
                    ),
                ),
                SizedBox(height: 24),
                Container(
                  width: MediaQuery.of(context).size.width - 40,
                  child: NewTextField(
                    
                      controller: _phoneController,
                      labelText: "Phone Number",
                      hintText: "03XXXXXXXXX",
                      filledColor: AppColors.tfield,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Phone number required";
                        }  
                        if (value.length < 11) return "Enter valid phone";
                        return null;
                      },
                    ),
                ),

                SizedBox(height: 24),
                Container(
                  width: MediaQuery.of(context).size.width - 40,
                  height: 52,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF1FCFFF), 
                        Color(0xFF0063FF), 
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(40),
                      onTap: () {
                        print("Send Code pressed");
                      },
                      child: GestureDetector(
                        onTap: () {
                          context.goNamed(AppRoutes.verfiicationcodeScreen.name);
                        },
                        child: Center(
                          child: Text(
                            "Send Code",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
}
