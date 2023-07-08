import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waste_management_app/constants/colors.dart';
import 'package:waste_management_app/screens/trashPickup/controllers/book_a_pickup_controller.dart';
import 'package:waste_management_app/screens/trashPickup/data/waste_types.dart';

class WasteTypesSelector extends StatelessWidget {
  const WasteTypesSelector({
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
          itemCount: wasteTypesData.length,
          itemBuilder: (context, index) {
            return Obx(
              () => GestureDetector(
                onTap: () {
                  if (bookAPickupController.selectedWasteTypes
                      .contains(index)) {
                    bookAPickupController.selectedWasteTypes.remove(index);
                  } else {
                    bookAPickupController.selectedWasteTypes.add(index);
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:
                        bookAPickupController.selectedWasteTypes.contains(index)
                            ? kPrimaryColor
                            : Colors.transparent,
                    border: Border.all(
                      color: bookAPickupController.selectedWasteTypes
                              .contains(index)
                          ? kPrimaryColor
                          : kTertiaryTextColor,
                      width: 2.0,
                    ),
                  ),
                  child: Text(
                    wasteTypesData[index],
                    style: TextStyle(
                      color: bookAPickupController.selectedWasteTypes
                              .contains(index)
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
