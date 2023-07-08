import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waste_management_app/constants/styles.dart';
import 'package:waste_management_app/screens/shop/controllers/cart_controller.dart';
import 'package:waste_management_app/screens/shop/views/components/confirmOrder/expanded_contact_number.dart';
import 'package:waste_management_app/sharedWidgets/top_header_with_back.dart';
import 'package:waste_management_app/screens/shop/views/components/confirmOrder/collapased_header.dart';
import 'package:waste_management_app/screens/shop/views/components/confirmOrder/expanded_delivery.dart';
import 'package:waste_management_app/screens/shop/views/components/confirmOrder/expanded_item_review.dart';
import 'package:waste_management_app/screens/shop/views/components/confirmOrder/expanded_payment.dart';
import 'package:waste_management_app/sharedWidgets/custom_filled_button.dart';

class ConfirmOrderScreen extends StatelessWidget {
  const ConfirmOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                TopHeaderWithBackButton(
                  title: 'Confirm Order',
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    ExpandablePanel(
                      theme: expandableTheme,
                      header: CollapsedHeader(
                        stepNumber: 1,
                        title: 'Set a Contact Number',
                      ),
                      collapsed: Container(),
                      expanded: Padding(
                        padding: const EdgeInsets.only(
                          top: 16,
                          bottom: 16,
                        ),
                        child: ExpandedContactNumberForm(),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    ExpandablePanel(
                      theme: expandableTheme,
                      header: CollapsedHeader(
                        stepNumber: 2,
                        title: 'Select A Delivery Address',
                      ),
                      collapsed: Container(),
                      expanded: Padding(
                        padding: const EdgeInsets.only(
                          top: 16,
                          bottom: 16,
                        ),
                        child: ExpandedDeliveryAddressPanel(),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    ExpandablePanel(
                      theme: expandableTheme,
                      header: CollapsedHeader(
                        stepNumber: 3,
                        title: 'Select A Payment Method',
                      ),
                      collapsed: Container(),
                      expanded: Padding(
                        padding: const EdgeInsets.only(
                          top: 16,
                          bottom: 16,
                        ),
                        child: ExpandedPaymentMethodPanel(),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    ExpandablePanel(
                      theme: expandableTheme,
                      header: CollapsedHeader(
                        stepNumber: 4,
                        title: 'Review Items and Delivery',
                      ),
                      collapsed: Container(),
                      expanded: Padding(
                        padding: const EdgeInsets.only(
                          top: 16,
                          bottom: 16,
                        ),
                        child: ExpandedItemReviewPanel(),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    CustomFilledButton(
                      title: 'Confirm Order',
                      onPressed: () {
                        Get.find<CartController>().placeOrder();
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
