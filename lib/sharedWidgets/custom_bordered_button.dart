import 'package:flutter/material.dart';
import 'package:waste_management_app/constants/colors.dart';

class CustomBorderedButton extends StatelessWidget {
  const CustomBorderedButton({
    super.key,
    required this.title,
    this.onPressed,
    this.icon,
  });
  final String title;
  final Function()? onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: onPressed,
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 8,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: kPrimaryColor,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon != null
                      ? Icon(
                          icon,
                          color: kPrimaryColor,
                        )
                      : SizedBox(),
                  icon != null
                      ? SizedBox(
                          width: 10,
                        )
                      : SizedBox(),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
