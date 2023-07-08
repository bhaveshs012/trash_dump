import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waste_management_app/utils/firebase_functions.dart';

class ProfileController extends GetxController {
  //* Variables:

  //* Text Editing Controllers: (For Feedback Form)
  final subjectTextController = TextEditingController();
  final feedbackTextController = TextEditingController();

  //* Form Keys:
  final feedbackFormKey = GlobalKey<FormState>();

  //* ------------------- FUNCTIONS: ---------------------

  void submitFeedback(
      {required String uid,
      required String subject,
      required String feedback}) async {
    if (feedbackFormKey.currentState!.validate()) {
      await FirebaseFunctions.instance
          .submitFeedback(uid: uid, subject: subject, feedback: feedback);
      Get.back();
    }
  }
}
