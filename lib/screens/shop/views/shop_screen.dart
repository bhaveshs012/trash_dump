import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uicons/uicons.dart';
import 'package:waste_management_app/constants/colors.dart';
import 'package:waste_management_app/constants/fonts.dart';
import 'package:waste_management_app/screens/shop/controllers/cart_controller.dart';
import 'package:waste_management_app/screens/shop/controllers/shop_controller.dart';
import 'package:waste_management_app/screens/shop/data/category_tile_data.dart';
import 'package:waste_management_app/screens/shop/models/cart_item_model.dart';
import 'package:waste_management_app/screens/shop/views/cart_screen.dart';
import 'package:waste_management_app/screens/shop/views/components/category_tile.dart';
import 'package:waste_management_app/screens/shop/views/components/shop_item_card.dart';

class ShopScreen extends StatelessWidget {
  ShopScreen({super.key});
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            padding: const EdgeInsets.only(
              bottom: 16.0,
            ),
            child: GetX<ShopController>(
                init: ShopController(),
                builder: (controller) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () => Get.to(() => CartScreen(),
                              transition: Transition.zoom),
                          child: Stack(
                            children: [
                              CircleAvatar(
                                backgroundColor: kSecondaryColor,
                                radius: 25,
                                child: Center(
                                  child: Icon(
                                    UIcons.regularRounded.shopping_bag,
                                    color: kPrimaryColor,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: CircleAvatar(
                                  backgroundColor: Colors.red,
                                  radius: 10,
                                  child: Text(
                                    cartController.cartItems.length.toString(),
                                    style: kSubtitleStyle.copyWith(
                                      color: Colors.white,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 55,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return CategoryTile(
                                title: shopCategories[index].title,
                                icon: shopCategories[index].icon,
                              );
                            }),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Most Popular',
                        style: kTitle2LessEmphasis,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 400,
                        child: controller.isLoading.value
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: kPrimaryColor,
                                ),
                              )
                            : ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.mostPopularItems.length,
                                itemBuilder: (context, index) {
                                  return ShopItemCard(
                                    title:
                                        controller.mostPopularItems[index].name,
                                    price: controller
                                        .mostPopularItems[index].price,
                                    description: controller
                                        .mostPopularItems[index].description,
                                    imageUrl: controller
                                        .mostPopularItems[index].imageUrl,
                                    onAddToCart: () {
                                      cartController.addCartItem(CartItemModel(
                                        price: controller
                                            .mostPopularItems[index].price,
                                        imageUrl: controller
                                            .mostPopularItems[index].imageUrl,
                                        name: controller
                                            .mostPopularItems[index].name,
                                        description: controller
                                            .mostPopularItems[index]
                                            .description,
                                        id: controller
                                            .mostPopularItems[index].id,
                                        category: controller
                                            .mostPopularItems[index].category,
                                        quantity: 1,
                                        totalPrice: controller
                                            .mostPopularItems[index].price,
                                      ));
                                    },
                                  );
                                }),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Trending This Week',
                        style: kTitle2LessEmphasis,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 400,
                        child: controller.isLoading.value
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: kPrimaryColor,
                                ),
                              )
                            : ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.mostPopularItems.length,
                                itemBuilder: (context, index) {
                                  return ShopItemCard(
                                      title: controller
                                          .mostPopularItems[index].name,
                                      price: controller
                                          .mostPopularItems[index].price,
                                      description: controller
                                          .mostPopularItems[index].description,
                                      imageUrl: controller
                                          .mostPopularItems[index].imageUrl,
                                      onAddToCart: () {
                                        cartController
                                            .addCartItem(CartItemModel(
                                          price: controller
                                              .mostPopularItems[index].price,
                                          imageUrl: controller
                                              .mostPopularItems[index].imageUrl,
                                          name: controller
                                              .mostPopularItems[index].name,
                                          description: controller
                                              .mostPopularItems[index]
                                              .description,
                                          id: controller
                                              .mostPopularItems[index].id,
                                          category: controller
                                              .mostPopularItems[index].category,
                                          quantity: 1,
                                          totalPrice: controller
                                              .mostPopularItems[index].price,
                                        ));
                                      });
                                }),
                      ),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
