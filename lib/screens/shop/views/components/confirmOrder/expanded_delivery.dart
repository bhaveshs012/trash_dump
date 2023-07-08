import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uicons/uicons.dart';
import 'package:waste_management_app/constants/colors.dart';
import 'package:waste_management_app/constants/fonts.dart';
import 'package:waste_management_app/screens/shop/controllers/cart_controller.dart';
import 'package:waste_management_app/screens/shop/views/components/add_new_address_form._dialog.dart';
import 'package:waste_management_app/screens/shop/views/components/confirmOrder/delivery_address_tile.dart';

class ExpandedDeliveryAddressPanel extends StatelessWidget {
  const ExpandedDeliveryAddressPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetX<CartController>(
        init: CartController(),
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: controller.isAddressLoading.value
                    ? Center(
                        child: CircularProgressIndicator(
                          color: kPrimaryColor,
                        ),
                      )
                    : controller.deliveryAddresses.isEmpty
                        ? Text(
                            'No Delivery Address Found',
                            style: kSubtitleStyle,
                          )
                        : ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemCount: controller.deliveryAddresses.length,
                            itemBuilder: (context, index) {
                              return DeliveryAddressTile(
                                
                                index: index,
                              );
                            }),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AddNewAddressFormDialog(),
                  );
                },
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: kPrimaryColor,
                      child: Icon(
                        UIcons.regularRounded.plus_small,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Add New Address',
                      style: kSubtitleStyle.copyWith(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
