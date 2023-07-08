import 'package:flutter/material.dart';
import 'package:uicons/uicons.dart';
import 'package:waste_management_app/constants/colors.dart';
import 'package:waste_management_app/constants/fonts.dart';

class ShopItemCard extends StatelessWidget {
  const ShopItemCard({
    super.key,
    required this.title,
    required this.price,
    required this.description,
    required this.imageUrl,
    this.onAddToCart,
  });
  final String title;
  final int price;
  final String description;
  final String imageUrl;
  final Function()? onAddToCart;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 10,
      ),
      width: 250,
      constraints: BoxConstraints(
        maxWidth: 250,
        maxHeight: 400,
      ),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: kTitle3Style,
            softWrap: true,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            description,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            softWrap: true,
            style: kSubtitle2Style,
          ),
          Spacer(),
          Row(
            children: [
              Text('Rs ${price.toString()}',
                  style: kTitle2Style.copyWith(
                    color: kPrimaryColor,
                  )),
              Spacer(),
              GestureDetector(
                onTap: onAddToCart,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: kSecondaryColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Icon(
                    UIcons.regularRounded.plus_small,
                    size: 25,
                    color: kPrimaryColor,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
