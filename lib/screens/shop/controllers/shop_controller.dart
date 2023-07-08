import 'dart:developer';

import 'package:get/get.dart';
import 'package:waste_management_app/constants/api.dart';
import 'package:waste_management_app/screens/shop/models/shop_item_model.dart';
import 'package:waste_management_app/screens/shop/repository/shop_repository.dart';

class ShopController extends GetxController {
  //* VARIABLES:
  RxList<ShopItemModel> mostPopularItems = RxList<ShopItemModel>([]);
  RxList<ShopItemModel> itemsTrendingThisWeek = RxList<ShopItemModel>([]);
  RxInt selectedCategoryIndex = (-1).obs;

  RxBool isLoading = false.obs;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    fetchPopularItems();
    log('Hello');
  }

  //* FUNCTIONS:

  void fetchPopularItems() async {
    isLoading.value = true;
    ApiResponse apiResponse = await ShopRepository.instance.fetchPopularItems();
    if (apiResponse.message == ApiMessage.success) {
      log("This fucking Works: Items Fetched");
      mostPopularItems.addAll(apiResponse.data);
      itemsTrendingThisWeek.addAll(apiResponse.data);
    }
    isLoading.value = false;
  }
}
