//* OTP Text Field
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:uicons/uicons.dart';
import 'package:waste_management_app/constants/colors.dart';

const focusedBorderColor = kPrimaryColor;
const fillColor = Colors.white;
const borderColor = kTertiaryTextColor;

final defaultPinTheme = PinTheme(
  width: 56,
  height: 56,
  textStyle: const TextStyle(
    fontSize: 22,
    color: kPrimaryTextColor,
  ),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(19),
    border: Border.all(color: borderColor),
  ),
);

//* TextField Decorations
final focusedBorderStyle = OutlineInputBorder(
  borderSide: BorderSide(
    width: 2,
    color: kPrimaryColor,
  ),
  borderRadius: BorderRadius.circular(10),
);

final borderStyle = OutlineInputBorder(
  borderSide: BorderSide(color: kPrimaryColor, width: 2),
  borderRadius: BorderRadius.circular(10),
);

final errorBorderStyle = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.red, width: 2),
  borderRadius: BorderRadius.circular(10),
);

final expandableTheme = ExpandableThemeData(
  expandIcon: UIcons.regularRounded.angle_small_down,
  iconColor: kPrimaryColor,
);
