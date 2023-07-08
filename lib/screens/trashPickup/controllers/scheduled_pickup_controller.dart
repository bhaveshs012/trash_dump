import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waste_management_app/constants/api.dart';
import 'package:waste_management_app/screens/login/repository/auth_repository.dart';
import 'package:waste_management_app/screens/trashPickup/model/scheduled_pickup_model.dart';
import 'package:waste_management_app/screens/trashPickup/repository/trash_pickup_repo.dart';

class ScheduledPickupController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<ScheduledPickupModel> scheduledPickups =
      RxList<ScheduledPickupModel>([]);

  @override
  void onInit() {
    super.onInit();
    fetchAllScheduledPickups();
  }

  void fetchAllScheduledPickups() async {
    isLoading.value = true;
    ApiResponse apiResponse = await TrashPickupRepository.instance
        .getScheduledPickups(
            Get.find<AuthRepository>().firebaseUser.value!.uid);
    if (apiResponse.message == ApiMessage.success) {
      scheduledPickups.value = apiResponse.data;
    } else if (apiResponse.message == ApiMessage.somethingWantWrongError) {
      Get.snackbar(
        'Error',
        'Something went wrong while fetching scheduled pickups',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
    isLoading.value = false;
  }
}
