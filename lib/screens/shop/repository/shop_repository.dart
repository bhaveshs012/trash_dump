import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:waste_management_app/constants/api.dart';
import 'package:waste_management_app/constants/firebase_collections.dart';
import 'package:waste_management_app/screens/shop/models/cart_item_model.dart';
import 'package:waste_management_app/screens/shop/models/shop_item_model.dart';

class ShopRepository {
  static final instance = ShopRepository._();
  ShopRepository._();

  Future<ApiResponse> fetchPopularItems() async {
    try {
      QuerySnapshot popularItemsSnapshot = await FirebaseFirestore.instance
          .collection(FirebaseCollections.SHOP_ITEMS)
          .get();
      final data = popularItemsSnapshot.docs.map((doc) => doc.data()).toList();
      List<ShopItemModel> popularItems = <ShopItemModel>[];
      popularItems = ShopItemModel.helper.fromMapArray(data);
      return ApiResponse(
        message: ApiMessage.success,
        data: popularItems,
      );
    } catch (e) {
      return ApiResponse(
        message: ApiMessage.somethingWantWrongError,
        data: [],
      );
    }
  }

  Future<ApiResponse> placeOrder(
      {required String uid,
      required String contactName,
      required String contactNumber,
      required String deliveryAddress,
      required String paymentOption,
      required List<CartItemModel> items}) async {
    try {
      await FirebaseFirestore.instance
          .collection(FirebaseCollections.ORDERS)
          .add({
        'user_id': uid,
        'deliveryAddress': deliveryAddress,
        'paymentOption': paymentOption,
        'contactName': contactName,
        'contactNumber': contactNumber,
        'items': items.map((e) => e.toMap()).toList(),
        'timestamp': DateTime.now(),
        'status': '0',
        'delivery_partner': {
          'partner_name': '',
          'partner_contact': '',
        }
      }).then((value) => {
                log('Order Created'),
                FirebaseFirestore.instance
                    .collection(FirebaseCollections.ORDERS)
                    .doc(value.id)
                    .update({'id': value.id})
              });
      return ApiResponse(
        message: ApiMessage.success,
      );
    } catch (e) {
      return ApiResponse(
        message: ApiMessage.somethingWantWrongError,
        data: [],
      );
    }
  }
}
