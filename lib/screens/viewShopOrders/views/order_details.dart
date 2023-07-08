import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uicons/uicons.dart';
import 'package:waste_management_app/constants/colors.dart';
import 'package:waste_management_app/constants/fonts.dart';
import 'package:waste_management_app/screens/viewShopOrders/model/user_order_model.dart';
import 'package:waste_management_app/screens/viewShopOrders/views/components/order_item_tile.dart';
import 'package:waste_management_app/screens/viewShopOrders/views/track_shop_order.dart';
import 'package:waste_management_app/sharedWidgets/custom_filled_button.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({super.key, required this.userOrder});
  final UserOrderModel userOrder;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => Get.back(),
                child: Icon(
                  UIcons.regularRounded.angle_small_left,
                  color: kPrimaryColor,
                  size: 30,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              RichText(
                  text: TextSpan(
                text: 'Order ID: ',
                style: kTitle2Style.copyWith(
                    color: kSecondaryTextColor, fontFamily: 'Poppins'),
                children: [
                  TextSpan(
                    text: userOrder.id,
                    style: kTitle2Style.copyWith(
                      color: kPrimaryColor,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              )),
              SizedBox(
                height: 10.0,
              ),
              RichText(
                  text: TextSpan(
                text: 'Order Placed on: ',
                style: kTitle2Style.copyWith(
                    color: kSecondaryTextColor, fontFamily: 'Poppins'),
                children: [
                  TextSpan(
                    text:
                        '${userOrder.timestamp.toDate().day < 10 ? '0${userOrder.timestamp.toDate().day}' : userOrder.timestamp.toDate().day}-${userOrder.timestamp.toDate().month < 10 ? '0${userOrder.timestamp.toDate().month}' : userOrder.timestamp.toDate().month}-${userOrder.timestamp.toDate().year}',
                    style: kTitle2Style.copyWith(
                      color: kPrimaryColor,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              )),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 25.0,
                    backgroundColor: kSecondaryColor,
                    child: Icon(
                      UIcons.regularRounded.location_alt,
                      color: kPrimaryColor,
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ship To:',
                        style: kTitle2Style.copyWith(
                          color: kSecondaryTextColor,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userOrder.contactName,
                              style: kTitle2LessEmphasis,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              userOrder.deliveryAddress,
                              style: kTitle2LessEmphasis,
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              CustomFilledButton(
                title: 'Track Order',
                onPressed: () {
                  Get.to(() => TrackShopOrderScreen(
                        userOrder: userOrder,
                  ));
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Items: ',
                style: kTitle2Style.copyWith(
                  color: kSecondaryTextColor,
                  fontFamily: 'Poppins',
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.only(bottom: 16.0),
                    physics: BouncingScrollPhysics(),
                    itemCount: userOrder.items.length,
                    itemBuilder: (context, index) {
                      return OrderItemTile(
                        orderItem: userOrder.items[index],
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
