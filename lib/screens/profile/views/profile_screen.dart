import 'package:dashed_circle/dashed_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:uicons/uicons.dart';
import 'package:waste_management_app/constants/colors.dart';
import 'package:waste_management_app/constants/fonts.dart';
import 'package:waste_management_app/screens/login/repository/auth_repository.dart';
import 'package:waste_management_app/screens/profile/views/components/profile_list_tile.dart';
import 'package:waste_management_app/screens/profile/views/contact_support_screen.dart';
import 'package:waste_management_app/screens/profile/views/faq_screen.dart';
import 'package:waste_management_app/screens/profile/views/feedback_screen.dart';
import 'package:waste_management_app/screens/trashPickup/views/scheduled_pickups.dart';
import 'package:waste_management_app/screens/viewShopOrders/views/view_all_orders.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      DashedCircle(
                        dashes: 10,
                        color: kPrimaryColor,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            backgroundColor: kSecondaryColor,
                            radius: 50,
                            child: SvgPicture.asset(
                              'assets/images/homeScreen/profile_pic.svg',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        AuthRepository
                            .instance.firebaseUser.value!.displayName!,
                        style: kTitleStyle,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Orders And Payments',
                  style: kTitle2Style.copyWith(color: Colors.black),
                ),
                const SizedBox(
                  height: 10,
                ),
                ProfileListTile(
                  title: 'My Orders',
                  icon: UIcons.regularRounded.shopping_bag,
                  onTap: () => Get.to(
                    () => ViewAllOrdersScreen(),
                    transition: Transition.zoom,
                  ),
                ),
                ProfileListTile(
                  title: 'My Bookings',
                  icon: UIcons.regularRounded.boxes,
                  onTap: () => Get.to(
                    () => ScheduledPickupScreen(
                      backButtonVisible: true,
                    ),
                    transition: Transition.zoom,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Support And Feedback',
                  style: kTitle2Style.copyWith(color: Colors.black),
                ),
                const SizedBox(
                  height: 10,
                ),
                ProfileListTile(
                  title: 'FAQs',
                  icon: UIcons.regularRounded.comment_question,
                  onTap: () => Get.to(
                    () => FAQScreen(),
                    transition: Transition.zoom,
                  ),
                ),
                ProfileListTile(
                  title: 'Contact Support',
                  icon: UIcons.regularRounded.call_history,
                  onTap: () => Get.to(
                    () => ContactSupportScreen(),
                    transition: Transition.zoom,
                  ),
                ),
                ProfileListTile(
                  title: 'Feedback',
                  icon: UIcons.regularRounded.notebook,
                  onTap: () => Get.to(
                    () => FeedbackScreen(),
                    transition: Transition.zoom,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Account Settings',
                  style: kTitle2Style.copyWith(color: Colors.black),
                ),
                const SizedBox(
                  height: 10,
                ),
                ProfileListTile(
                  title: 'Logout',
                  icon: UIcons.regularRounded.exit,
                  onTap: () {
                    AuthRepository.instance.signOut();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
