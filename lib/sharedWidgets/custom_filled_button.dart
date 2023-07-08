import 'package:flutter/material.dart';
import 'package:waste_management_app/constants/colors.dart';

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton({
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
                color: kPrimaryColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon != null
                      ? Icon(
                          icon,
                          color: Colors.white,
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
                      color: Colors.white,
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
