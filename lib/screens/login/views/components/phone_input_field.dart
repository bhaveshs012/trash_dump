import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:waste_management_app/constants/colors.dart';
import 'package:waste_management_app/screens/login/controller/login_controller.dart';

class PhoneInputField extends StatelessWidget {
  const PhoneInputField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<LoginController>(
        init: LoginController(),
        builder: (controller) {
          return Row(
            children: [
              Expanded(
                child: Container(
                  margin: controller.isPhoneNumberValid.value
                      ? EdgeInsets.zero
                      : EdgeInsets.only(
                          bottom: 28,
                        ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 15,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: kPrimaryColor,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '+91',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 5,
                child: TextFormField(
                  controller: controller.phoneNumberController,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your phone number';
                    } else if (value.length != 10) {
                      return 'Please enter a valid phone number';
                    }
                    return null;
                  },
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                  cursorColor: kPrimaryColor,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 20,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Enter Your Number',
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.normal,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: kPrimaryColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red[300]!,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    errorStyle: TextStyle(
                      color: Colors.red[300],
                      fontSize: 14,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: kPrimaryColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red[300]!,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
