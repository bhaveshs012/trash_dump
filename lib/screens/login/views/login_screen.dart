import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uicons/uicons.dart';
import 'package:waste_management_app/screens/login/views/login_with_email.dart';
import 'package:waste_management_app/screens/login/views/login_with_phone.dart';
import 'package:waste_management_app/screens/signup/views/signup_screen.dart';
import 'package:waste_management_app/sharedWidgets/custom_bordered_button.dart';
import 'package:waste_management_app/sharedWidgets/custom_filled_button.dart';

import '../controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _loginController = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Image.asset(
                  'assets/images/loginScreen/login_screen.png',
                  height: 300,
                  width: 300,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomFilledButton(
                  title: 'Login With Phone',
                  onPressed: () {
                    Get.to(() => LoginWithPhone());
                  },
                  icon: UIcons.regularRounded.mobile_notch,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomBorderedButton(
                  title: 'Login With Email',
                  onPressed: () {
                    Get.to(() => LoginWithEmail());
                  },
                  icon: UIcons.regularRounded.envelope,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: const [
                    Expanded(
                      child: Divider(
                        thickness: 2,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text("OR"),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 2,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                CustomBorderedButton(
                  title: 'Login With Google',
                  onPressed: () {
                    _loginController.signInWithGoogle();
                  },
                  icon: UIcons.brands.google,
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    //* Navigate to Sign Up Screen
                    Get.to(() => SignUpScreen());
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'Don\'t have an account? ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                      children: const [
                        TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
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
