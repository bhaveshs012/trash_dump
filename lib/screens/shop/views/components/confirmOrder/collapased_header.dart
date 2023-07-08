import 'package:flutter/material.dart';
import 'package:waste_management_app/constants/colors.dart';
import 'package:waste_management_app/constants/fonts.dart';

class CollapsedHeader extends StatelessWidget {
  const CollapsedHeader({
    super.key,
    required this.stepNumber,
    required this.title,
  });
  final int stepNumber;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 15,
          backgroundColor: kPrimaryColor,
          child: Text(
            stepNumber.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Text(
            title,
            style: kTitle2Style,
          ),
        ),
      ],
    );
  }
}
