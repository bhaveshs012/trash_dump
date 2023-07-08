import 'package:flutter/material.dart';
import 'package:waste_management_app/constants/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/splashScreen/recycle_bin.png',
                    width: 180,
                    height: 180,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'TrashDash',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: kSecondaryTextColor,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                'assets/images/splashScreen/top_left_leaf.png',
                width: 150,
                height: 150,
                opacity: const AlwaysStoppedAnimation(.5),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                'assets/images/splashScreen/bottom_right_leaf.png',
                width: 150,
                height: 150,
                opacity: const AlwaysStoppedAnimation(.5),
              ),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: Text(
                  'Version 1.0.0',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: kSecondaryTextColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
