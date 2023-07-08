import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uicons/uicons.dart';
import 'package:waste_management_app/constants/colors.dart';
import 'package:waste_management_app/constants/fonts.dart';
import 'package:waste_management_app/constants/styles.dart';
import 'package:waste_management_app/screens/shop/controllers/cart_controller.dart';
import 'package:waste_management_app/sharedWidgets/custom_filled_button.dart';

class AddNewAddressFormDialog extends StatelessWidget {
  AddNewAddressFormDialog({super.key});
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.5,
        ),
        child: Form(
          key: cartController.addressFormKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Spacer(),
                    Text(
                      'Add New Address',
                      style: kTitle2Style,
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Icon(
                        UIcons.regularRounded.cross_small,
                        size: 20,
                        color: Color(0xffEB455F),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: cartController.addressLine1TextController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                  cursorColor: kPrimaryColor,
                  decoration: InputDecoration(
                    hintText: 'Enter Flat, House No., Building Name',
                    focusedBorder: focusedBorderStyle,
                    border: borderStyle,
                    errorBorder: errorBorderStyle,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: cartController.addressLine2TextController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                  cursorColor: kPrimaryColor,
                  decoration: InputDecoration(
                    hintText: 'Enter Street Name, Area, Colony',
                    focusedBorder: focusedBorderStyle,
                    border: borderStyle,
                    errorBorder: errorBorderStyle,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: cartController.cityTextController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                  cursorColor: kPrimaryColor,
                  decoration: InputDecoration(
                    hintText: 'Enter City',
                    focusedBorder: focusedBorderStyle,
                    border: borderStyle,
                    errorBorder: errorBorderStyle,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: cartController.pinCodeTextController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                  cursorColor: kPrimaryColor,
                  decoration: InputDecoration(
                    hintText: 'Enter Pincode',
                    focusedBorder: focusedBorderStyle,
                    border: borderStyle,
                    errorBorder: errorBorderStyle,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: cartController.landMarkTextController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                  cursorColor: kPrimaryColor,
                  decoration: InputDecoration(
                    hintText: 'Enter Landmark',
                    focusedBorder: focusedBorderStyle,
                    border: borderStyle,
                    errorBorder: errorBorderStyle,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomFilledButton(
                  title: 'Add Address',
                  onPressed: () {
                    Get.find<CartController>().storeDeliveryAddress();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
