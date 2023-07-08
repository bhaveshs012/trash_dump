import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:uicons/uicons.dart';
import 'package:waste_management_app/constants/colors.dart';
import 'package:waste_management_app/constants/fonts.dart';
import 'package:waste_management_app/screens/shop/models/cart_item_model.dart';

class CartItemTile extends StatelessWidget {
  const CartItemTile({
    super.key,
    this.onIncrement,
    this.onDecrement,
    this.onDelete,
    required this.cartItem,
  });
  final CartItemModel cartItem;
  final Function()? onIncrement;
  final Function()? onDecrement;
  final Function(BuildContext)? onDelete;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      endActionPane: ActionPane(
        // A motion is a widget used to control how the pane animates.
        motion: const ScrollMotion(),

        // All actions are defined in the children parameter.
        children: [
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            onPressed: onDelete,
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: UIcons.regularRounded.trash,
            label: 'Delete',
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 25.0),
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
                      cartItem.imageUrl,
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
                      cartItem.name,
                      style: kTitle2Style,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      cartItem.description,
                      style: kSubtitle2Style,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Rs. ${cartItem.totalPrice.toString()}',
                          style: kTitle2Style.copyWith(
                            color: kPrimaryColor,
                          ),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: onDecrement,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Icon(
                                    UIcons.regularRounded.minus_small,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              cartItem.quantity.toString(),
                              style: kTitle2Style,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: onIncrement,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Icon(
                                    UIcons.regularRounded.plus_small,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
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
      ),
    );
  }
}
