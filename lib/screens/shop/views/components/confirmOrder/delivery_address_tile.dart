import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:uicons/uicons.dart';
import 'package:waste_management_app/constants/colors.dart';
import 'package:waste_management_app/constants/fonts.dart';
import 'package:waste_management_app/screens/shop/controllers/cart_controller.dart';

class DeliveryAddressTile extends StatelessWidget {
  const DeliveryAddressTile({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return GetX<CartController>(
        init: CartController(),
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Row(
              children: [
                GFCheckbox(
                  activeBgColor: kPrimaryColor,
                  size: 20.0,
                  type: GFCheckboxType.circle,
                  onChanged: (value) {
                    controller.selectedDeliveryAddressIndex.value = index;
                  },
                  value: controller.selectedDeliveryAddressIndex.value == index,
                  activeIcon: Icon(
                    UIcons.regularRounded.check,
                    color: Colors.white,
                    size: 10,
                  ),
                  inactiveIcon: null,
                ),
                SizedBox(
                  width: 15,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(
                    controller.deliveryAddresses[index],
                    style: kSubtitleStyle.copyWith(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
