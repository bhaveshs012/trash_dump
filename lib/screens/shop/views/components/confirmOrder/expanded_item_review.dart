import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:waste_management_app/constants/colors.dart';
import 'package:waste_management_app/constants/fonts.dart';
import 'package:waste_management_app/screens/shop/controllers/cart_controller.dart';
import 'package:waste_management_app/screens/shop/views/components/cart_item_tile.dart';

class ExpandedItemReviewPanel extends StatelessWidget {
  ExpandedItemReviewPanel({super.key});

  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Estimated Delivery Date:',
          style: kTitle3Style,
        ),
        Text(
          DateFormat('EEEE, dd MMMM yyyy')
              .format(DateTime.now().add(Duration(days: 5))),
          style: kTitle3Style.copyWith(
            color: kPrimaryColor,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: cartController.cartItems.length,
              itemBuilder: (context, index) {
                return CartItemTile(
                  cartItem: cartController.cartItems[index],
                  onIncrement: () => cartController
                      .incrementQuantity(cartController.cartItems[index].id),
                  onDecrement: () => cartController
                      .decrementQuantity(cartController.cartItems[index].id),
                  onDelete: (context) => cartController
                      .removeCartItem(cartController.cartItems[index].id),
                );
              }),
        ),
      ],
    );
  }
}
