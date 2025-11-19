import 'package:flutter/material.dart';

import '../../../../core/extensions/theme_extension.dart';
import '../../../../drappers.dart';
import '../../../../shared/widgets/text_form_field_widget.dart';
import '../../../../shared/widgets/textfield_new.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // Key for form validation
  final _formKey = GlobalKey<FormState>();

  // State variables for form fields and checkbox
  String? _fullName, _email, _phone, _password, _confirmPassword;
  String? _receiveMethod = 'Email'; // Default radio selection
  bool _agreedToTerms = false;
  bool _showPassword = false;
  bool _showConfirmPassword = false;

  // Added TextEditingControllers to correctly manage input focus and state for persistence
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<AppCustomColors>()!;

    return Scaffold(
      // Set background color to the main dark color
      backgroundColor: customColors.dark,

      // Use a Stack to place the pattern/gradient behind the content
      body: Stack(
        children: [
          // 1. Background Pattern/Gradient (Representing the dark, subtle background)
          Container(decoration: BoxDecoration(color: customColors.dark)),

          // 2. Main Scrollable Content
          SafeArea(
            child: SingleChildScrollView(
              // Reduced overall padding
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 30.0,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // --- Header: Logo and Title ---
                    Center(
                      child: Column(
                        children: [
                          // Placeholder for the "dtv" logo image
                          Image.network(
                            'https://placehold.co/80x40/000000/FFFFFF/png?text=dtv',
                            height: 40,
                            errorBuilder: (context, error, stackTrace) =>
                                const Text(
                                  'dtv',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28, // Slightly reduced
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins', // Added Poppins
                                  ),
                                ),
                          ),
                          SizedBox(height: 15), // Reduced spacing
                          Text(
                            "Get Started with Draper",
                            style: TextStyle(
                              color: customColors.textColor,
                              fontSize: 20, // Reduced size
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins', // Added Poppins
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 25), // Reduced spacing
                    // --- Form Fields ---
                    // --- FORM FIELDS ---
                    SizedBox(height: 25),

                    // Full Name
                    NewTextField(
                      controller: _fullNameController,
                      labelText: "Full Name",
                      hintText: "Enter your full name",
                      filledColor: AppColors.tfield,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Full name required";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15),

                    // Email Address
                    NewTextField(
                      controller: _emailController,
                      labelText: "Email Address",
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
                    SizedBox(height: 15),

                    // Phone Number
                    NewTextField(
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
                    SizedBox(height: 15),

                    SizedBox(height: 8), // Reduced spacing
                    // --- Radio Buttons (Receive Code Via) ---
                    Padding(
                      padding: EdgeInsets.only(left: 4.0),
                      child: Text(
                        "Receive Code Via",
                        style: TextStyle(
                          color: customColors.textColor,
                          fontSize: 13,
                          fontFamily: 'Poppins',
                        ), // Reduced size
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: _buildRadioTile(
                            title: 'Email Address',
                            value: 'Email',
                            groupValue: _receiveMethod,
                            onChanged: (value) {
                              setState(() {
                                _receiveMethod = value;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: _buildRadioTile(
                            title: 'Phone Number',
                            value: 'Phone',
                            groupValue: _receiveMethod,
                            onChanged: (value) {
                              setState(() {
                                _receiveMethod = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10), // Reduced spacing
                    // --- Terms and Conditions Checkbox ---
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: _agreedToTerms,
                          onChanged: (bool? newValue) {
                            setState(() {
                              _agreedToTerms = newValue ?? false;
                            });
                          },
                          activeColor: customColors.light,
                          checkColor: Colors.white,
                          side: BorderSide(
                            color: customColors.light,
                            width: 1.5,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: RichText(
                              text: TextSpan(
                                text: 'I agree to the ',
                                style: TextStyle(
                                  color: customColors.textColor,
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                ), // Reduced size
                                children: [
                                  TextSpan(
                                    text: 'Terms & Conditions',
                                    style: TextStyle(
                                      color: customColors.lightest,
                                      decoration: TextDecoration.underline,
                                      fontFamily: 'Poppins',
                                    ),
                                    // onTap functionality would be here
                                  ),
                                  const TextSpan(
                                    text: ' and ',
                                    style: TextStyle(fontFamily: 'Poppins'),
                                  ),
                                  TextSpan(
                                    text: 'Privacy Policy.',
                                    style: TextStyle(
                                      color: customColors.dark,
                                      decoration: TextDecoration.underline,
                                      fontFamily: 'Poppins',
                                    ),
                                    // onTap functionality would be here
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20), // Reduced spacing
                    // --- Primary Action Button (Gradient) ---
                    AppButton(onPressed: () {}, title: "Create Account"),

                    const SizedBox(height: 25), // Reduced spacing
                    // --- OR Divider ---
                    Row(
                      children: [
                        Expanded(child: Divider(color: customColors.textColor)),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            "or",
                            style: TextStyle(
                              color: customColors.textColor,
                              fontSize: 15,
                              fontFamily: 'Poppins',
                            ),
                          ), // Reduced size
                        ),
                        Expanded(child: Divider(color: customColors.textColor)),
                      ],
                    ),

                    const SizedBox(height: 25), // Reduced spacing
                    // --- Social Sign-In Buttons ---
                    Row(
                      children: [
                        Expanded(
                          child: _buildSocialButton(
                            label: "Google",
                            icon: 'G', // Placeholder for Google Icon
                            onPressed: () {},
                          ),
                        ),
                        const SizedBox(width: 10), // Reduced spacing
                        Expanded(
                          child: _buildSocialButton(
                            label: "Apple",
                            icon: '', // Placeholder for Apple Icon
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRadioTile({
    required String title,
    required String value,
    required String? groupValue,
    required ValueChanged<String?> onChanged,
  }) {
    const Color inputFieldColor = Color(0xFF17244D);
    const Color textColor = Colors.white;
    const Color primaryBlue = Color(0xFF1E88E5);

    // Custom container to hold the radio button and text, simulating the background box
    return Container(
      // Reduced margin
      margin: const EdgeInsets.only(right: 8, top: 8),
      // Reduced vertical padding
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
      decoration: BoxDecoration(
        color: inputFieldColor,
        borderRadius: BorderRadius.circular(10), // Reduced radius
        border: Border.all(
          color: groupValue == value ? primaryBlue : Colors.transparent,
          width: 2,
        ),
      ),
      child: InkWell(
        onTap: () => onChanged(value),
        child: Row(
          children: [
            SizedBox(
              height: 20, // Reduced height for the radio button
              width: 20, // Reduced width for the radio button
              child: Radio<String>(
                value: value,
                groupValue: groupValue,
                onChanged: onChanged,
                activeColor: primaryBlue,
                fillColor: MaterialStateProperty.resolveWith<Color>((
                  Set<MaterialState> states,
                ) {
                  if (states.contains(MaterialState.selected)) {
                    return primaryBlue;
                  }
                  return Colors.white54; // Unselected color
                }),
              ),
            ),
            Flexible(
              child: Text(
                title,
                // Reduced size and added Poppins
                style: const TextStyle(
                  color: textColor,
                  fontSize: 13,
                  fontFamily: 'Poppins',
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method for social sign-in buttons
  Widget _buildSocialButton({
    required String label,
    required String icon,
    required VoidCallback onPressed,
  }) {
    const Color inputFieldColor = Color(0xFF17244D);
    const Color textColor = Colors.white;

    return Container(
      height: 45, // Reduced button height
      decoration: BoxDecoration(
        color: inputFieldColor,
        borderRadius: BorderRadius.circular(10), // Reduced radius
        border: Border.all(color: Colors.white10),
      ),
      child: InkWell(
        onTap: onPressed,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Using a simple Text for the icon, you'd replace this with an SVG or an actual icon.
              Text(
                icon,
                style: const TextStyle(
                  fontSize: 18, // Reduced size
                  color: textColor,
                  fontFamily: 'Poppins', // Added Poppins
                ),
              ),
              const SizedBox(width: 6), // Reduced spacing
              Text(
                label,
                style: const TextStyle(
                  color: textColor,
                  fontSize: 15, // Reduced size
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins', // Added Poppins
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Simple form submission function placeholder
  void _submitForm() {
    if (_formKey.currentState!.validate() && _agreedToTerms) {
      _formKey.currentState!.save();
      // Logic for signing up the user would go here
      print('Form Submitted:');
      print('Name: $_fullName');
      print('Email: $_email');
      print('Phone: $_phone');
      print('Receive Code Via: $_receiveMethod');
    } else if (!_agreedToTerms) {
      print('Error: Must agree to terms.');
    }
  }
}
