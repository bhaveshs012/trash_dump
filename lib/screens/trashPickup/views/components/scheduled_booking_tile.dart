import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:uicons/uicons.dart';
import 'package:waste_management_app/constants/colors.dart';
import 'package:waste_management_app/constants/fonts.dart';
import 'package:waste_management_app/screens/trashPickup/model/scheduled_pickup_model.dart';
import 'package:waste_management_app/screens/trashPickup/views/track_pickup_booking.dart';

class ScheduledBookingTile extends StatelessWidget {
  const ScheduledBookingTile({
    super.key,
    this.onCancel,
    required this.scheduledPickup,
  });

  final ScheduledPickupModel scheduledPickup;
  final Function()? onCancel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Get.to(() => TrackPickupBookingScreen(
            pickupBooking: scheduledPickup,
          )),
      contentPadding: EdgeInsets.zero,
      leading: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          UIcons.regularRounded.calendar,
          size: 22,
          color: Colors.white,
        ),
      ),
      title: Text(
        'Booking ID: ${scheduledPickup.id}',
        style: kTitle3Style,
      ),
      subtitle: Text(
        '${scheduledPickup.selectedDate.toDate().day.toString()}-${scheduledPickup.selectedDate.toDate().month.toString()}-${scheduledPickup.selectedDate.toDate().year.toString()} at ${DateFormat('hh:mm a').format(scheduledPickup.selectedDate.toDate())}',
        style: kSubtitleStyle,
      ),
      trailing: GestureDetector(
        onTap: onCancel,
        child: CircleAvatar(
          backgroundColor: Color(0xffFFF2F2),
          child: Icon(
            UIcons.regularRounded.cross_small,
            size: 20,
            color: Color(0xffEB455F),
          ),
        ),
      ),
    );
  }
}
