import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:uicons/uicons.dart';
import 'package:waste_management_app/constants/colors.dart';
import 'package:waste_management_app/constants/fonts.dart';

class ExpandedPaymentMethodPanel extends StatelessWidget {
  const ExpandedPaymentMethodPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GFCheckbox(
          activeBgColor: kPrimaryColor,
          size: 20.0,
          type: GFCheckboxType.circle,
          onChanged: (value) {
            log(value.toString());
          },
          value: true,
          activeIcon: Icon(
            UIcons.regularRounded.check,
            color: Colors.white,
            size: 10,
          ),
          inactiveIcon: null,
        ),
        SizedBox(
          width: 15,
        ),
        Container(
          decoration: BoxDecoration(
            color: kPrimaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.all(10),
          child: Icon(
            UIcons.regularRounded.money,
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: Text(
            'Cash On Delivery',
            style: kSubtitleStyle.copyWith(
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
