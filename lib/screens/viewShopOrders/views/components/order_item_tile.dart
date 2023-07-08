import 'package:flutter/material.dart';
import 'package:waste_management_app/constants/colors.dart';
import 'package:waste_management_app/constants/fonts.dart';
import 'package:waste_management_app/screens/viewShopOrders/model/user_order_model.dart';

class OrderItemTile extends StatelessWidget {
  const OrderItemTile({super.key, required this.orderItem});

  final Item orderItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: SizedBox(
        height: 150,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: SizedBox(
                height: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  child: Image.network(
                    orderItem.imageUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    orderItem.name,
                    style: kTitle2Style,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    orderItem.description,
                    style: kSubtitle2Style,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rs. ${orderItem.totalPrice.toString()}',
                        style: kTitle2Style.copyWith(
                          color: kPrimaryColor,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Qty: ',
                            style: kTitle2Style,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            orderItem.quantity.toString(),
                            style: kTitle2Style,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}
