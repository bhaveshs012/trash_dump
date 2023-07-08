import 'package:flutter/material.dart';
import 'package:waste_management_app/constants/colors.dart';
import 'package:waste_management_app/constants/styles.dart';
import 'package:waste_management_app/screens/trashPickup/controllers/book_a_pickup_controller.dart';

class EnterAddressManuallyForm extends StatelessWidget {
  const EnterAddressManuallyForm({
    super.key,
    required this.bookAPickupController,
  });
  final BookAPickupController bookAPickupController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: bookAPickupController.addressFormKey,
      child: Column(
        children: [
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your address';
              }
              return null;
            },
            controller: bookAPickupController.addressLine1TextController,
            cursorColor: kPrimaryColor,
            decoration: InputDecoration(
              hintText: 'Enter Flat, House No., Building Name',
              focusedBorder: focusedBorderStyle,
              border: borderStyle,
              errorBorder: errorBorderStyle,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your address';
              }
              return null;
            },
            controller: bookAPickupController.addressLine2TextController,
            cursorColor: kPrimaryColor,
            decoration: InputDecoration(
              hintText: 'Enter Street Name, Area, Colony',
              focusedBorder: focusedBorderStyle,
              border: borderStyle,
              errorBorder: errorBorderStyle,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your address';
              }
              return null;
            },
            controller: bookAPickupController.cityTextController,
            cursorColor: kPrimaryColor,
            decoration: InputDecoration(
              hintText: 'Enter City',
              focusedBorder: focusedBorderStyle,
              border: borderStyle,
              errorBorder: errorBorderStyle,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your address';
              }
              return null;
            },
            controller: bookAPickupController.pinCodeTextController,
            cursorColor: kPrimaryColor,
            decoration: InputDecoration(
              hintText: 'Enter Pincode',
              focusedBorder: focusedBorderStyle,
              border: borderStyle,
              errorBorder: errorBorderStyle,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your address';
              }
              return null;
            },
            controller: bookAPickupController.landMarkTextController,
            cursorColor: kPrimaryColor,
            decoration: InputDecoration(
              hintText: 'Enter Landmark',
              focusedBorder: focusedBorderStyle,
              border: borderStyle,
              errorBorder: errorBorderStyle,
            ),
          ),
          SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
