import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waste_management_app/constants/colors.dart';
import 'package:waste_management_app/constants/fonts.dart';
import 'package:waste_management_app/constants/styles.dart';
import 'package:waste_management_app/screens/login/controller/login_controller.dart';
import 'package:waste_management_app/screens/login/repository/auth_repository.dart';
import 'package:waste_management_app/sharedWidgets/custom_filled_button.dart';

class EnterNameScreen extends StatelessWidget {
  EnterNameScreen({super.key});

  final loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: Get.find<LoginController>().nameFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Enter Your Name',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Looks like you are new here! Please enter your name to continue.',
                style: kSubtitleStyle,
              ),
              SizedBox(
                height: 35,
              ),
              Text(
                'Name',
                style: kSubtitleStyle,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a name';
                  }
                },
                controller: loginController.nameTextController,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                  focusedBorder: focusedBorderStyle,
                  border: borderStyle,
                  errorBorder: errorBorderStyle,
                ),
              ),
              Spacer(),
              CustomFilledButton(
                  title: 'Continue',
                  onPressed: () {
                    loginController.createUserWithPhoneNumber(
                        name: loginController.nameTextController.text,
                        phoneNumber: loginController.phoneNumberController.text,
                        uid: AuthRepository.instance.firebaseUser.value!.uid);
                    loginController.nameTextController.clear();
                    Get.back();
                  }),
            ],
          ),
        ),
      ),
    ));
  }
}
