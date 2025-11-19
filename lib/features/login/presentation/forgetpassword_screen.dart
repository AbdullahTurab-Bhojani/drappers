import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../drappers.dart';
import '../../../gen/assets.gen.dart';

class ForgetpasswordScreen extends StatefulWidget {
  const ForgetpasswordScreen({super.key});

  @override
  State<ForgetpasswordScreen> createState() => _ForgetpasswordScreenState();
}

class _ForgetpasswordScreenState extends State<ForgetpasswordScreen> {
  @override
  Widget build(BuildContext context) {
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
                Text(
                  "Forget Password?",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4),
                Text(
                  'Don’t worry, this happens.',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 36),
                Text(
                  'Receive Code Via phone or email',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 24),
                Container(
                  width: MediaQuery.of(context).size.width - 40,
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      hintText: "Enter your email or phone",
                      hintStyle: TextStyle(color: Colors.white70),
                      fillColor: Color(0xFF101317),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 18,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 24),
                Container(
                  width: MediaQuery.of(context).size.width - 40,
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      hintText: "Enter your email or phone",
                      hintStyle: TextStyle(color: Colors.white70),
                      fillColor: Color(0xFF101317),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 18,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
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
