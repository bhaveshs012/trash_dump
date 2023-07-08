import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waste_management_app/constants/colors.dart';
import 'package:waste_management_app/constants/fonts.dart';
import 'package:waste_management_app/screens/shop/controllers/cart_controller.dart';
import 'package:waste_management_app/screens/shop/views/components/cart_item_tile.dart';
import 'package:waste_management_app/sharedWidgets/top_header_with_back.dart';
import 'package:waste_management_app/screens/shop/views/confirm_order.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 16,
            left: 16,
            right: 16,
          ),
          child: GetX<CartController>(
              init: CartController(),
              builder: (controller) {
                return Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TopHeaderWithBackButton(
                          title: 'My Cart',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Items added to your cart will appear here. You can add or remove items from here. Swipe left to remove an item from your cart.',
                          style: kSubtitleStyle,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: controller.cartItems.isEmpty
                              ? Center(
                                  child: Text(
                                    'Your cart is empty.',
                                    textAlign: TextAlign.center,
                                    style: kTitleStyle.copyWith(
                                      color: kPrimaryColor,
                                      fontSize: 20,
                                    ),
                                  ),
                                )
                              : ListView.builder(
                                  padding: EdgeInsets.only(bottom: 75),
                                  physics: BouncingScrollPhysics(),
                                  itemCount: controller.cartItems.length,
                                  itemBuilder: (context, index) {
                                    return CartItemTile(
                                      cartItem: controller.cartItems[index],
                                      onIncrement: () =>
                                          controller.incrementQuantity(
                                              controller.cartItems[index].id),
                                      onDecrement: () =>
                                          controller.decrementQuantity(
                                              controller.cartItems[index].id),
                                      onDelete: (context) =>
                                          controller.removeCartItem(
                                              controller.cartItems[index].id),
                                    );
                                  }),
                        )
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 16,
                        ),
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text('Total: ', style: kTitle2Style),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  controller.totalPrice.value.toString(),
                                  style: kTitleStyle.copyWith(
                                    color: kPrimaryColor,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: controller.cartItems.isEmpty
                                    ? null
                                    : () => Get.to(
                                        () => const ConfirmOrderScreen()),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 16,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: controller.cartItems.isEmpty
                                        ? Colors.grey
                                        : kPrimaryColor,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        'Checkout',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
