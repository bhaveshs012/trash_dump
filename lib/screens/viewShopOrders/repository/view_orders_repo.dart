import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:waste_management_app/constants/api.dart';
import 'package:waste_management_app/constants/firebase_collections.dart';
import 'package:waste_management_app/screens/viewShopOrders/model/user_order_model.dart';

class ViewShopOrdersRepository {
  static final instance = ViewShopOrdersRepository._();
  ViewShopOrdersRepository._();

  Future<ApiResponse> getCurrentUserOrders({required String uid}) async {
    try {
      QuerySnapshot popularItemsSnapshot = await FirebaseFirestore.instance
          .collection(FirebaseCollections.ORDERS)
          .where('user_id', isEqualTo: uid)
          .get();
      final data = popularItemsSnapshot.docs.map((doc) => doc.data()).toList();
      log(data.toString());
      List<UserOrderModel> userOrders = <UserOrderModel>[];
      userOrders = UserOrderModel.helper.fromMapArray(data);
      return ApiResponse(
        message: ApiMessage.success,
        data: userOrders,
      );
    } catch (e) {
      log(e.toString());
      return ApiResponse(
        message: ApiMessage.somethingWantWrongError,
        data: [],
      );
    }
  }
}
