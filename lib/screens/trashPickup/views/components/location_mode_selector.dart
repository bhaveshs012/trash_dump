import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waste_management_app/constants/colors.dart';
import 'package:waste_management_app/screens/trashPickup/controllers/book_a_pickup_controller.dart';

class LocationModeSelector extends StatelessWidget {
  const LocationModeSelector({
    super.key,
    required this.bookAPickupController,
  });

  final BookAPickupController bookAPickupController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                bookAPickupController.locationSelectionMode.value = 0;
                bookAPickupController.setPickupLocationAutomatically();
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: bookAPickupController.locationSelectionMode.value == 0
                      ? kPrimaryColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color:
                        bookAPickupController.locationSelectionMode.value == 0
                            ? kPrimaryColor
                            : kTertiaryTextColor,
                    width: 2.0,
                  ),
                ),
                child: Text(
                  'Use Current Location',
                  style: TextStyle(
                      color:
                          bookAPickupController.locationSelectionMode.value == 0
                              ? Colors.white
                              : Colors.black),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                bookAPickupController.locationSelectionMode.value = 1;
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: bookAPickupController.locationSelectionMode.value == 1
                      ? kPrimaryColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color:
                        bookAPickupController.locationSelectionMode.value == 1
                            ? kPrimaryColor
                            : kTertiaryTextColor,
                    width: 2.0,
                  ),
                ),
                child: Text(
                  'Enter Location Manually',
                  style: TextStyle(
                      color:
                          bookAPickupController.locationSelectionMode.value == 1
                              ? Colors.white
                              : Colors.black),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
