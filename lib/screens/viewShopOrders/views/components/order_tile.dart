import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waste_management_app/constants/colors.dart';
import 'package:waste_management_app/constants/fonts.dart';
import 'package:waste_management_app/screens/viewShopOrders/model/user_order_model.dart';
import 'package:waste_management_app/screens/viewShopOrders/views/order_details.dart';

class OrderTile extends StatelessWidget {
  const OrderTile({
    super.key,
    required this.userOrder,
  });
  final UserOrderModel userOrder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => OrderDetailScreen(
            userOrder: userOrder,
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10.0),
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order ID: ${userOrder.id}',
              style: kTitle2Style,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Order Placed on: ${userOrder.timestamp.toDate().day < 10 ? '0${userOrder.timestamp.toDate().day}' : userOrder.timestamp.toDate().day}-${userOrder.timestamp.toDate().month < 10 ? '0${userOrder.timestamp.toDate().month}' : userOrder.timestamp.toDate().month}-${userOrder.timestamp.toDate().year} ',
              style: kSubtitleStyle.copyWith(
                color: kSecondaryTextColor,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Items: ',
              style: kTitle3Style,
            ),
            SizedBox(
              height: 10.0,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount:
                  userOrder.items.length > 2 ? 3 : userOrder.items.length,
              itemBuilder: (context, index) {
                return userOrder.items.length > 2
                    ? index == 2
                        ? Text(
                            'and ${userOrder.items.length - 2} more items',
                            style: kSubtitle2Style,
                          )
                        : Text(
                            '${userOrder.items[index].name} x ${userOrder.items[index].quantity}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: kSubtitleStyle.copyWith(
                              color: kSecondaryTextColor,
                            ),
                          )
                    : Text(
                        '${userOrder.items[index].name} x ${userOrder.items[index].quantity}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: kSubtitleStyle.copyWith(
                          color: kSecondaryTextColor,
                        ),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
