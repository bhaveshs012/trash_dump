import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waste_management_app/constants/colors.dart';
import 'package:waste_management_app/screens/trashPickup/controllers/book_a_pickup_controller.dart';
import 'package:waste_management_app/screens/trashPickup/data/time_slots.dart';

class TimeSlotSelecter extends StatelessWidget {
  const TimeSlotSelecter({
    super.key,
    required this.bookAPickupController,
  });

  final BookAPickupController bookAPickupController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 100,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: timeSlots.length,
          itemBuilder: (context, index) {
            return Obx(
              () => GestureDetector(
                  onTap: () {
                    bookAPickupController.selectedTimeSlot.value = index;
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color:
                          bookAPickupController.selectedTimeSlot.value == index
                              ? kPrimaryColor
                              : Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: bookAPickupController.selectedTimeSlot.value ==
                                index
                            ? kPrimaryColor
                            : kTertiaryTextColor,
                        width: 2.0,
                      ),
                    ),
                    child: Text(
                      timeSlots[index].format(context),
                      style: TextStyle(
                        color: bookAPickupController.selectedTimeSlot.value ==
                                index
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  )),
            );
          }),
    );
  }
}
