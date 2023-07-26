import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:waste_management_app/constants/colors.dart';
import 'package:waste_management_app/constants/fonts.dart';
import 'package:waste_management_app/constants/styles.dart';
import 'package:waste_management_app/screens/login/controller/login_controller.dart';
import 'package:waste_management_app/sharedWidgets/custom_filled_button.dart';

class LoginWithEmail extends StatelessWidget {
  LoginWithEmail({super.key});

  final loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: loginController.emailFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Login With Email',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 35,
                      ),
                      child: SvgPicture.asset(
                        'assets/images/loginScreen/login_with_email.svg',
                        height: 250,
                        width: 250,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 55,
                  ),
                  Text(
                    'Email',
                    style: kSubtitleStyle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (!RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$")
                          .hasMatch(value!)) {
                        return 'Please enter a valid email address';
                      }
                    },
                    controller: loginController.emailTextController,
                    cursorColor: kPrimaryColor,
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                      focusedBorder: focusedBorderStyle,
                      border: borderStyle,
                      errorBorder: errorBorderStyle,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Password',
                    style: kSubtitleStyle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    controller: loginController.passwordTextController,
                    cursorColor: kPrimaryColor,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                      focusedBorder: focusedBorderStyle,
                      border: borderStyle,
                      errorBorder: errorBorderStyle,
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  CustomFilledButton(
                      title: 'Login',
                      onPressed: () {
                        loginController.loginWithEmailAndPassword();
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
