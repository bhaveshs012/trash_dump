import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:waste_management_app/constants/colors.dart';
import 'package:waste_management_app/constants/fonts.dart';

class HomeScreenTopRow extends StatelessWidget {
  const HomeScreenTopRow({
    super.key,
    required this.userName,
  });
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello,',
              style: kSubtitleStyle,
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              userName,
              style: kTitleStyle,
            ),
          ],
        ),
        CircleAvatar(
          radius: 30,
          backgroundColor: kSecondaryColor,
          child: SvgPicture.asset(
            'assets/images/homeScreen/profile_pic.svg',
          ),
        )
      ],
    );
  }
}
