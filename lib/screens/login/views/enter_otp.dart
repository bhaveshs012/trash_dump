import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:waste_management_app/screens/login/views/components/otp_input_field.dart';

class EnterOtpScreen extends StatelessWidget {
  const EnterOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Enter OTP',
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
                      'assets/images/loginScreen/enter_otp.svg',
                      height: 250,
                      width: 250,
                    ),
                  ),
                ),
                SizedBox(
                  height: 55,
                ),
                Text(
                  'Enter the OTP sent to your phone number',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: OtpInputField(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
