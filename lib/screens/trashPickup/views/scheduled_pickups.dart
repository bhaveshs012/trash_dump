import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uicons/uicons.dart';
import 'package:waste_management_app/constants/colors.dart';
import 'package:waste_management_app/constants/fonts.dart';
import 'package:waste_management_app/sharedWidgets/top_header_with_back.dart';
import 'package:waste_management_app/screens/trashPickup/controllers/scheduled_pickup_controller.dart';
import 'package:waste_management_app/screens/trashPickup/views/book_a_pickup.dart';
import 'package:waste_management_app/screens/trashPickup/views/components/scheduled_booking_tile.dart';

class ScheduledPickupScreen extends StatelessWidget {
  const ScheduledPickupScreen({super.key, required this.backButtonVisible});
  final bool backButtonVisible;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: () {
          Get.to(
            () => BookTrashPickupScreen(),
            transition: Transition.zoom,
          );
        },
        child: Icon(
          UIcons.regularRounded.calendar_plus,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GetX<ScheduledPickupController>(
              init: ScheduledPickupController(),
              builder: (controller) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    backButtonVisible
                        ? TopHeaderWithBackButton(title: 'Scheduled Pickups')
                        : Center(
                            child: Text(
                              'Scheduled Pickups',
                              style: kTitle2Style.copyWith(color: Colors.black),
                            ),
                          ),
                    const SizedBox(
                      height: 20,
                    ),
                    controller.isLoading.value
                        ? Center(
                            child: CircularProgressIndicator(
                              color: kPrimaryColor,
                            ),
                          )
                        : controller.scheduledPickups.isEmpty
                            ? Center(
                                child: Text(
                                  'No scheduled pickups',
                                  style: kSubtitleStyle,
                                ),
                              )
                            : Expanded(
                                child: ListView.builder(
                                    itemCount:
                                        controller.scheduledPickups.length,
                                    itemBuilder: (context, index) {
                                      return ScheduledBookingTile(
                                        scheduledPickup:
                                            controller.scheduledPickups[index],
                                        onCancel: () {},
                                      );
                                    }),
                              )
                  ],
                );
              }),
        ),
      ),
    );
  }
}
