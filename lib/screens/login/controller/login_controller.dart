import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waste_management_app/screens/login/repository/auth_repository.dart';
import 'package:waste_management_app/utils/firebase_functions.dart';

class LoginController extends GetxController {
  //* Phone Number
  var isPhoneNumberValid = true.obs;
  final phoneNumberController = TextEditingController();

  void checkPhoneNumber() {
    if (phoneNumberController.text.length == 10) {
      isPhoneNumberValid.value = true;
    } else {
      isPhoneNumberValid.value = false;
    }
    update();
  }

  //* OTP
  final otpPinController = TextEditingController();
  final otpFocusNode = FocusNode();
  final otpFormKey = GlobalKey<FormState>();
  final nameTextController = TextEditingController();
  final nameFormKey = GlobalKey<FormState>();

  //* Email
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final emailFormKey = GlobalKey<FormState>();

  //* FUNCTIONS:

  //* ------- WITH EMAIL ID: --------------------
  void loginWithEmailAndPassword() {
    if (emailFormKey.currentState!.validate()) {
      AuthRepository.instance.signInWithEmailAndPassword(
          email: emailTextController.text,
          password: passwordTextController.text);
    }
  }

  //* ------- WITH PHONE NUMBER: --------------------
  void loginWithPhoneNumber() {
    AuthRepository.instance.signInWithPhoneNumber(
      phoneNumber: phoneNumberController.text,
    );
  }

  void createUserWithPhoneNumber(
      {required String name,
      required String phoneNumber,
      required String uid}) {
    FirebaseFunctions.instance.createUserWithPhoneNumber(
        name: name, phoneNumber: phoneNumber, uid: uid);
        nameTextController.clear();
        phoneNumberController.clear();
        otpPinController.clear();
  }

  void verifyOtp() {
    if (otpFormKey.currentState!.validate()) {
      AuthRepository.instance.verifyOtp(
        phoneNumber: phoneNumberController.text,
        smsCode: otpPinController.text,
      );
    }
  }

  void signInWithGoogle() {
    AuthRepository.instance.signInWithGoogle();
  }
}
