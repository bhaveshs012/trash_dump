import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:waste_management_app/screens/login/controller/login_controller.dart';
import 'package:waste_management_app/screens/login/views/components/phone_input_field.dart';
import 'package:waste_management_app/screens/login/views/enter_otp.dart';
import 'package:waste_management_app/sharedWidgets/custom_filled_button.dart';

class LoginWithPhone extends StatelessWidget {
  LoginWithPhone({super.key});

  final formKey = GlobalKey<FormState>();
  final loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Login With Phone',
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
                        'assets/images/loginScreen/login_with_phone.svg',
                        height: 250,
                        width: 250,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 55,
                  ),
                  Text(
                    'Enter your Phone Number',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  PhoneInputField(),
                  SizedBox(
                    height: 35,
                  ),
                  CustomFilledButton(
                      title: 'Send OTP',
                      onPressed: () {
                        loginController.checkPhoneNumber();
                        if (loginController.isPhoneNumberValid.value) {
                          loginController.loginWithPhoneNumber();
                        }
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
