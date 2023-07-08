import 'package:flutter/material.dart';
import 'package:waste_management_app/constants/colors.dart';
import 'package:waste_management_app/constants/fonts.dart';

class ContactSupportTile extends StatelessWidget {
  const ContactSupportTile({
    super.key,
    required this.contactHandle,
    required this.icon,
  });
  final String contactHandle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: kPrimaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.all(10),
          child: Icon(
            icon,
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: Text(
            contactHandle,
            style: kSubtitleStyle.copyWith(
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
