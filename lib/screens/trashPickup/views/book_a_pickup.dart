import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uicons/uicons.dart';
import 'package:waste_management_app/constants/colors.dart';
import 'package:waste_management_app/constants/fonts.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:waste_management_app/screens/trashPickup/controllers/book_a_pickup_controller.dart';
import 'package:waste_management_app/screens/trashPickup/views/components/contact_information_form.dart';
import 'package:waste_management_app/screens/trashPickup/views/components/location_mode_selector.dart';
import 'package:waste_management_app/screens/trashPickup/views/components/manual_address_form.dart';
import 'package:waste_management_app/screens/trashPickup/views/components/time_slot_selector.dart';
import 'package:waste_management_app/screens/trashPickup/views/components/waste_types_selector.dart';
import 'package:waste_management_app/sharedWidgets/custom_filled_button.dart';

class BookTrashPickupScreen extends StatelessWidget {
  BookTrashPickupScreen({super.key});
  final bookAPickupController = Get.put(BookAPickupController());

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
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Icon(
                        UIcons.regularRounded.angle_small_left,
                        color: kPrimaryColor,
                        size: 30,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'Schedule a Trash Pickup',
                      style: kTitle2Style.copyWith(color: Colors.black),
                    ),
                    Spacer(),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Fill up the details to schedule your trash pickup. We will send a truck to your location to pick up your trash.',
                  style: kSubtitleStyle,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Select Date and Time',
                  style: kTitle2Style,
                ),
                const SizedBox(
                  height: 10,
                ),
                DatePicker(
                  DateTime.now(),
                  height: 100,
                  initialSelectedDate: DateTime.now(),
                  selectionColor: kPrimaryColor,
                  selectedTextColor: Colors.white,
                  onDateChange: (date) {
                    // New date selected
                    bookAPickupController.selectedDate.value = date;
                    log('Selected date: $date');
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TimeSlotSelecter(bookAPickupController: bookAPickupController),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Select Waste Types',
                  style: kTitle2Style,
                ),
                const SizedBox(
                  height: 10,
                ),
                WasteTypesSelector(
                    bookAPickupController: bookAPickupController),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Select Location',
                  style: kTitle2Style,
                ),
                const SizedBox(
                  height: 10,
                ),
                LocationModeSelector(
                    bookAPickupController: bookAPickupController),
                const SizedBox(
                  height: 20,
                ),
                Obx(
                  () => Visibility(
                    visible:
                        bookAPickupController.locationSelectionMode.value == 1,
                    child: EnterAddressManuallyForm(
                        bookAPickupController: bookAPickupController),
                  ),
                ),
                Text(
                  'Special Instructions',
                  style: kTitle2Style,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  maxLines: 5,
                  cursorColor: kPrimaryColor,
                  controller: bookAPickupController.instructionsTextController,
                  decoration: InputDecoration(
                    hintText: 'E.g. Landmark, etc.',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: kPrimaryColor,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: kPrimaryColor,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ContactInformationForm(
                  bookAPickupController: bookAPickupController,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomFilledButton(
                    title: 'Schedule Pickup',
                    onPressed: () {
                      bookAPickupController.createAPickupBooking();
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
