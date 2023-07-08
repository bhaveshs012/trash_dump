import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waste_management_app/screens/login/views/login_screen.dart';
import 'package:waste_management_app/screens/signup/views/signup_screen.dart';
import 'package:waste_management_app/sharedWidgets/custom_bordered_button.dart';
import 'package:waste_management_app/sharedWidgets/custom_filled_button.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

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
                    'Welcome',
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
                  'assets/images/loginScreen/login_landing.png',
                  height: 350,
                  width: 350,
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    'Let\'s clean our homes with',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Center(
                  child: Text(
                    'TrashDump',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomFilledButton(
                  title: 'LOGIN',
                  onPressed: () {
                    Get.to(() => LoginScreen());
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CustomBorderedButton(
                  title: 'SIGN UP',
                  onPressed: () {
                    Get.to(() => SignUpScreen());
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
