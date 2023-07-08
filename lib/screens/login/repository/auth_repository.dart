import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:waste_management_app/landing_screen.dart';
import 'package:waste_management_app/screens/login/views/enter_name.dart';
import 'package:waste_management_app/screens/login/views/enter_otp.dart';
import 'package:waste_management_app/sharedWidgets/bottom_navbar.dart';
import 'package:waste_management_app/utils/firebase_functions.dart';

class AuthRepository extends GetxController {
  static AuthRepository get instance => Get.find();

  //* Variables:
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.authStateChanges());
    ever(firebaseUser, _setInitialRoute);
    super.onReady();
  }

  _setInitialRoute(User? user) {
    if (user == null) {
      Get.offAll(const LandingScreen());
    } else {
      Future.delayed(
        const Duration(
          seconds: 2,
        ),
      );
      Get.offAll(const BottomNavBar(
        initailIndex: 0,
      ));
    }
  }

  //* Functions:

  //* ------- WITH EMAIL AND PASSWORD: --------------------
  void signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      if (e == 'user-not-found') {
        Get.snackbar(
          'Error',
          'No user found for that email.',
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
        );
      } else if (e == 'wrong-password') {
        Get.snackbar(
          'Error',
          'Incorrect password.',
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          'Error',
          e.toString(),
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
        );
      }
    }
  }

  void signUpWithEmailAndPassword(
      {required String name,
      required String email,
      required String password}) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        value.user!.updateDisplayName(name);
        await FirebaseFunctions.instance.createUserDocumentWithEmailAndPassword(
          name: name,
          email: email,
          password: password,
          uid: value.user!.uid,
        );
      });
    } catch (e) {
      if (e == 'weak-password') {
        Get.snackbar(
          'Error',
          'The password provided is too weak.',
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
        );
      } else if (e == 'email-already-in-use') {
        Get.snackbar(
          'Error',
          'The account already exists for that email.',
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          'Error',
          e.toString(),
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
        );
      }
    }
  }

  //* ------------------- WITH PHONE NUMBER: -----------------------
  void signInWithPhoneNumber({required String phoneNumber}) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: "+91 $phoneNumber",
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            Get.snackbar(
              'Error',
              'The provided phone number is not valid.',
              backgroundColor: Colors.redAccent,
              colorText: Colors.white,
            );
          } else {
            Get.snackbar(
              'Error',
              e.toString(),
              backgroundColor: Colors.redAccent,
              colorText: Colors.white,
            );
          }
        },
        codeSent: (String verificationId, int? resendToken) {
          this.verificationId.value = verificationId;
          Get.to(() => EnterOtpScreen());
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          this.verificationId.value = verificationId;
        },
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }
  }

  void verifyOtp({required String phoneNumber, required String smsCode}) async {
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId.value,
        smsCode: smsCode,
      );
      final userCredential = await _auth.signInWithCredential(credential);
      bool userExists =
          await FirebaseFunctions.instance.checkIfPhoneNumberExists(
        phoneNumber,
      );
      if (userExists == false) {
        Get.to(() => EnterNameScreen());
      }
    } catch (e) {
      if (e == 'invalid-verification-code') {
        Get.snackbar(
          'Error',
          'The verification code is invalid.',
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          'Error',
          e.toString(),
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
        );
      }
    }
  }

  void signInWithGoogle() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        FirebaseFunctions.instance.createUserDocumentWithEmailAndPassword(
          name: userCredential.user!.displayName.toString(),
          email: userCredential.user!.email.toString(),
          password: '',
          uid: userCredential.user!.uid,
        );
        log(userCredential.user!.displayName.toString());
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          // handle the error here
          Get.snackbar(
            'Error',
            e.toString(),
            backgroundColor: Colors.redAccent,
            colorText: Colors.white,
          );
        } else if (e.code == 'invalid-credential') {
          // handle the error here
          Get.snackbar(
            'Error',
            e.toString(),
            backgroundColor: Colors.redAccent,
            colorText: Colors.white,
          );
        }
      } catch (e) {
        // handle the error here
        Get.snackbar(
          'Error',
          e.toString(),
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
        );
      }
    }
  }

  //* ------ LOGOUT: --------------------
  void signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }
  }
}
