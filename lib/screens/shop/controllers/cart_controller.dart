import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waste_management_app/constants/api.dart';
import 'package:waste_management_app/constants/colors.dart';
import 'package:waste_management_app/screens/login/repository/auth_repository.dart';
import 'package:waste_management_app/screens/shop/models/cart_item_model.dart';
import 'package:waste_management_app/screens/shop/repository/shop_repository.dart';
import 'package:waste_management_app/sharedWidgets/bottom_navbar.dart';

class CartController extends GetxController {
  //* VARIABLES:
  RxBool isLoading = false.obs;
  RxBool isAddressLoading = false.obs;
  RxInt totalPrice = 0.obs;
  RxList<CartItemModel> cartItems = RxList<CartItemModel>([]);
  RxList<String> deliveryAddresses = RxList<String>([]);
  RxInt selectedDeliveryAddressIndex = (-1).obs;

  //* Text Editing Controllers (For Adding New Delivery Address):
  final addressLine1TextController = TextEditingController();
  final addressLine2TextController = TextEditingController();
  final cityTextController = TextEditingController();
  final pinCodeTextController = TextEditingController();
  final landMarkTextController = TextEditingController();

  //* Text Editing Controllers (For Contact Details):
  final contactNameTextController = TextEditingController();
  final contactNumberTextController = TextEditingController();

  //* Form Keys
  final addressFormKey = GlobalKey<FormState>();

  //* METHODS:

  //* -------- INIT METHOD --------
  @override
  void onReady() {
    super.onReady();
    loadDeliveryAddresses();
  }

  //* -------- CART RELATED METHODS --------
  void addCartItem(CartItemModel cartItem) {
    if (cartItems.any((element) => element.id == cartItem.id)) {
      cartItems.forEach((element) {
        if (element.id == cartItem.id) {
          element.quantity++;
          element.totalPrice = element.quantity * element.price;
        }
      });
    } else {
      cartItems.add(cartItem);
    }
    totalPrice.value = totalPrice.value + cartItem.price * cartItem.quantity;
  }

  void removeCartItem(int id) {
    cartItems.removeWhere((element) => element.id == id);
    calculateTotalPrice();
  }

  void clearCart() {
    cartItems.clear();
  }

  void calculateTotalPrice() {
    totalPrice.value = 0;
    cartItems.forEach((cartItem) {
      totalPrice.value += cartItem.totalPrice;
    });
  }

  void incrementQuantity(int id) {
    cartItems.forEach((element) {
      if (element.id == id) {
        element.quantity++;
        element.totalPrice = element.quantity * element.price;
      }
    });

    calculateTotalPrice();
  }

  void decrementQuantity(int id) {
    cartItems.forEach((element) {
      if (element.id == id) {
        if (element.quantity > 1) {
          element.quantity--;
          element.totalPrice = element.quantity * element.price;
        }
      }
    });

    calculateTotalPrice();
  }

  bool allFieldsValidated() {
    if (contactNameTextController.text.isNotEmpty &&
        contactNumberTextController.text.isNotEmpty &&
        selectedDeliveryAddressIndex.value != -1) {
      return true;
    } else {
      return false;
    }
  }

  void placeOrder() async {
    if (allFieldsValidated()) {
      isLoading.value = true;
      ApiResponse apiResponse = await ShopRepository.instance.placeOrder(
        uid: AuthRepository.instance.firebaseUser.value!.uid,
        contactName: contactNameTextController.text,
        contactNumber: contactNumberTextController.text,
        deliveryAddress:
            deliveryAddresses.elementAt(selectedDeliveryAddressIndex.value),
        paymentOption: 'Cash on Delivery',
        items: cartItems,
      );
      if (apiResponse.message == ApiMessage.success) {
        log("This fucking works: Order placed");
        isLoading.value = false;
        clearCart();
        Get.snackbar(
          'Success',
          'Order has been placed',
          colorText: Colors.white,
          backgroundColor: kPrimaryColor,
          margin: const EdgeInsets.all(16.0),
        );
        Get.offAll(
          () => BottomNavBar(
            initailIndex: 2,
          ),
        );
      } else {
        Get.snackbar(
          'Error',
          'Something went wrong',
          colorText: Colors.white,
          backgroundColor: Colors.redAccent,
          margin: const EdgeInsets.all(16.0),
        );
      }
    } else {
      Get.snackbar(
        'Error',
        'Please fill all the fields',
        colorText: Colors.white,
        backgroundColor: Colors.redAccent,
        margin: const EdgeInsets.all(16.0),
      );
    }
  }

  //* ------ DELIVERY ADDRESS STORAGE RELATED FUNCTIONS --------
  void storeDeliveryAddress() async {
    if (addressFormKey.currentState!.validate()) {
      String address =
          '${addressLine1TextController.text}, ${addressLine2TextController.text}, ${cityTextController.text}, ${pinCodeTextController.text}, ${landMarkTextController.text}';
      deliveryAddresses.add(address);
      final addressBox = await SharedPreferences.getInstance();
      addressBox.setStringList('addresses', deliveryAddresses);
      clearAddressTextControllers();
      Get.back();
    }
  }

  void loadDeliveryAddresses() async {
    isAddressLoading.value = true;
    final addressBox = await SharedPreferences.getInstance();
    final List<String>? storedDeliveryAddresses =
        addressBox.getStringList('addresses');
    if (storedDeliveryAddresses != null) {
      deliveryAddresses.addAll(storedDeliveryAddresses);
    }
    isAddressLoading.value = false;
  }

  void clearAddressTextControllers() {
    addressLine1TextController.clear();
    addressLine2TextController.clear();
    cityTextController.clear();
    pinCodeTextController.clear();
    landMarkTextController.clear();
  }
}
