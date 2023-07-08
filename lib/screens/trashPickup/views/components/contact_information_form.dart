import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:waste_management_app/constants/colors.dart';
import 'package:waste_management_app/constants/fonts.dart';
import 'package:waste_management_app/screens/trashPickup/controllers/book_a_pickup_controller.dart';

class ContactInformationForm extends StatelessWidget {
  const ContactInformationForm({
    super.key,
    required this.bookAPickupController,
  });

  final BookAPickupController bookAPickupController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact Information',
          style: kTitle2Style,
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          cursorColor: kPrimaryColor,
          controller: bookAPickupController.contactNameTextController,
          decoration: InputDecoration(
            hintText: 'Enter Contact Name',
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: kPrimaryColor,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: kPrimaryColor,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          cursorColor: kPrimaryColor,
          controller: bookAPickupController.contactNumberTextController,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(10),
          ],
          decoration: InputDecoration(
            hintText: 'Enter Contact Number',
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: kPrimaryColor,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: kPrimaryColor,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
