import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waste_management_app/constants/api.dart';
import 'package:waste_management_app/screens/login/repository/auth_repository.dart';
import 'package:waste_management_app/screens/viewShopOrders/model/user_order_model.dart';
import 'package:waste_management_app/screens/viewShopOrders/repository/view_orders_repo.dart';

class ViewShopOrdersController extends GetxController {
  //* Variables
  RxBool isLoading = false.obs;
  RxList<UserOrderModel> userOrders = <UserOrderModel>[].obs;

  //* Init
  @override
  void onReady() {
    super.onReady();
    getCurrentUserOrders();
  }

  //* Functions:
  void getCurrentUserOrders() async {
    ApiResponse apiResponse =
        await ViewShopOrdersRepository.instance.getCurrentUserOrders(
      uid: AuthRepository.instance.firebaseUser.value!.uid,
    );
    if (apiResponse.message == ApiMessage.success) {
      userOrders.value = apiResponse.data;
    } else {
      Get.snackbar(
        'Error',
        apiResponse.message.toString(),
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }
  }
}
