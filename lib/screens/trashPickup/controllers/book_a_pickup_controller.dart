import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:waste_management_app/constants/colors.dart';
import 'package:waste_management_app/screens/home/controllers/location_controller.dart';
import 'package:waste_management_app/screens/login/repository/auth_repository.dart';
import 'package:waste_management_app/screens/trashPickup/data/time_slots.dart';
import 'package:waste_management_app/screens/trashPickup/data/waste_types.dart';
import 'package:waste_management_app/sharedWidgets/bottom_navbar.dart';
import 'package:waste_management_app/utils/firebase_functions.dart';

class BookAPickupController extends GetxController {
  Rx<DateTime> selectedDate = DateTime.now().obs;
  var selectedTimeSlot = 0.obs;
  var selectedWasteTypes = <int>[].obs;
  Rx<LatLng> selectedLocation = LatLng(0, 0).obs;
  var pickUpAddress = ''.obs;
  var locationSelectionMode = 3.obs;

  //* Form Keys
  final addressFormKey = GlobalKey<FormState>();

  //* TextEditing Controllers
  final instructionsTextController = TextEditingController();

  final addressLine1TextController = TextEditingController();
  final addressLine2TextController = TextEditingController();
  final cityTextController = TextEditingController();
  final pinCodeTextController = TextEditingController();
  final landMarkTextController = TextEditingController();

  final contactNameTextController = TextEditingController();
  final contactNumberTextController = TextEditingController();

  //* Functions:

  void setPickupLocationAutomatically() {
    Get.find<LocationController>().getUserAddress();
    selectedLocation.value = Get.find<LocationController>().userLatLng.value;
    pickUpAddress.value = Get.find<LocationController>().userAddress.value;
    update();
  }

  void setPickupLocationManually() async {
    pickUpAddress.value =
        '${addressLine1TextController.text}, ${addressLine2TextController.text}, ${cityTextController.text}, ${landMarkTextController.text}, ${pinCodeTextController.text}';
  }

  bool checkIfDetailsFilled() {
    return selectedWasteTypes.isNotEmpty &&
        locationSelectionMode.value != 3 &&
        pickUpAddress.value.isNotEmpty &&
        contactNameTextController.text.isNotEmpty &&
        contactNumberTextController.text.isNotEmpty;
  }

  void createAPickupBooking() async {
    if (checkIfDetailsFilled()) {
      if (contactNumberTextController.text.length != 10) {
        Get.snackbar(
          'Error',
          'Please enter a valid contact number',
          margin: const EdgeInsets.all(
            16.0,
          ),
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
        );
        return;
      } else {
        log("Details Filled");
        List<String> wasteTypes = [];
        for (int i = 0; i < selectedWasteTypes.length; i++) {
          wasteTypes.add(wasteTypesData[selectedWasteTypes[i]]);
        }
        log('Selected Date: ${selectedDate.value} \nSelected Time Slot: ${timeSlots[selectedTimeSlot.value]} \nPickup Address: $pickUpAddress \nSelected Location: ${selectedLocation.value} \nSelected Waste Types: $wasteTypes \nInstructions: ${instructionsTextController.text}');
        try {
          await FirebaseFunctions.instance.createPickupBooking(
            uid: AuthRepository.instance.firebaseUser.value!.uid,
            contactName: contactNameTextController.text,
            contactNumber: contactNumberTextController.text,
            selectedDate: selectedDate.value,
            selectedTimeSlot: timeSlots[selectedTimeSlot.value],
            pickUpAddress: pickUpAddress.value,
            selectedLocation: selectedLocation.value,
            selectedWasteTypes: wasteTypes,
            instructions: instructionsTextController.text,
          );
        } catch (e) {
          Get.snackbar(
            'Error',
            'Something went wrong',
            backgroundColor: Colors.redAccent,
            colorText: Colors.white,
          );
        }
        Get.snackbar(
          'Success',
          'Your pickup has been booked',
          backgroundColor: kPrimaryColor,
          colorText: Colors.white,
        );
        Get.offAll(
          BottomNavBar(
            initailIndex: 1,
          ),
        );
      }
    } else {
      //* Details Not Filled:
      Get.snackbar(
        'Error',
        'Please fill all the details',
        margin: const EdgeInsets.all(
          16.0,
        ),
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }
  }
}
