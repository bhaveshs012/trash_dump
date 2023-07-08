import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waste_management_app/screens/login/repository/auth_repository.dart';

class SignUpController extends GetxController {
  //* Form Key
  final signUpFormKey = GlobalKey<FormState>();

  //* Text Editing Controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  //* Functions:
  void signUp()  {
    if (signUpFormKey.currentState!.validate()) {
      AuthRepository.instance.signUpWithEmailAndPassword(
          name: nameController.text,
          email: emailController.text,
          password: passwordController.text);
    }
  }
}
