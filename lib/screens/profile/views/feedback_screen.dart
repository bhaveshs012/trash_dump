import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waste_management_app/constants/colors.dart';
import 'package:waste_management_app/constants/fonts.dart';
import 'package:waste_management_app/constants/styles.dart';
import 'package:waste_management_app/screens/login/repository/auth_repository.dart';
import 'package:waste_management_app/screens/profile/controllers/profile_controller.dart';
import 'package:waste_management_app/sharedWidgets/custom_filled_button.dart';
import 'package:waste_management_app/sharedWidgets/top_header_with_back.dart';

class FeedbackScreen extends StatelessWidget {
  FeedbackScreen({super.key});
  final profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Form(
                key: profileController.feedbackFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TopHeaderWithBackButton(
                      title: 'Feedback',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'We would greatly appreciate it if you could take a few minutes to share your thoughts and suggestions regarding our app. Your feedback will enable us to understand what we\'re doing right and identify areas where we can make improvements.',
                      style: kSubtitleStyle,
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    TextFormField(
                      controller: profileController.subjectTextController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter subject';
                        }
                        return null;
                      },
                      cursorColor: kPrimaryColor,
                      decoration: InputDecoration(
                        hintText: 'Enter subject here',
                        focusedBorder: focusedBorderStyle,
                        border: borderStyle,
                        errorBorder: errorBorderStyle,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: profileController.feedbackTextController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your feedback';
                        }
                        return null;
                      },
                      cursorColor: kPrimaryColor,
                      maxLines: null,
                      minLines: 8,
                      decoration: InputDecoration(
                        hintText: 'Enter Feedback here',
                        focusedBorder: focusedBorderStyle,
                        border: borderStyle,
                        errorBorder: errorBorderStyle,
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    CustomFilledButton(
                      title: 'Submit Feedback',
                      onPressed: () {
                        profileController.submitFeedback(
                            uid:
                                AuthRepository.instance.firebaseUser.value!.uid,
                            subject:
                                profileController.subjectTextController.text,
                            feedback:
                                profileController.feedbackTextController.text);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
