import 'package:flutter/material.dart';
import 'package:uicons/uicons.dart';
import 'package:waste_management_app/constants/colors.dart';
import 'package:waste_management_app/constants/fonts.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });
  final String title;
  final IconData icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        onTap: onTap,
        contentPadding: EdgeInsets.zero,
        leading: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            size: 22,
            color: Colors.white,
          ),
        ),
        title: Text(
          title,
          style: kTitle3Style,
        ),
        trailing: CircleAvatar(
          backgroundColor: kSecondaryColor,
          child: Icon(
            UIcons.regularRounded.angle_right,
            size: 20,
            color: kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
