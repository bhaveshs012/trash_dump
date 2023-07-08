import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:uicons/uicons.dart';
import 'package:waste_management_app/constants/colors.dart';
import 'package:waste_management_app/constants/fonts.dart';
import 'package:waste_management_app/screens/shop/data/order_satuses.dart';
import 'package:waste_management_app/screens/viewShopOrders/model/user_order_model.dart';

class TrackShopOrderScreen extends StatelessWidget {
  const TrackShopOrderScreen({super.key, required this.userOrder});
  final UserOrderModel userOrder;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.45,
            child: Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(
                      19.0750,
                      72.9988,
                    ),
                    zoom: userOrder.deliveryPartner.partnerName == ''
                        ? 11.4746
                        : 10.4746,
                  ),
                  markers: userOrder.deliveryPartner.partnerName == ''
                      ? {
                          Marker(
                            markerId: const MarkerId('Your Location'),
                            position: LatLng(
                              19.0750,
                              72.9988,
                            ),
                            infoWindow:
                                const InfoWindow(title: 'Your Location'),
                          ),
                        }
                      : {
                          Marker(
                            markerId: const MarkerId('Shop Location'),
                            position: LatLng(
                              19.0760,
                              72.8777,
                            ),
                            infoWindow:
                                const InfoWindow(title: 'Shop Location'),
                          ),
                          Marker(
                            markerId: const MarkerId('Your Location'),
                            position: LatLng(
                              19.0750,
                              72.9988,
                            ),
                            infoWindow:
                                const InfoWindow(title: 'Your Location'),
                          ),
                        },
                ),
                Positioned(
                  top: 40,
                  left: 16,
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        UIcons.regularRounded.angle_small_left,
                        color: Colors.black,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Order ID:',
                        style: kTitle2LessEmphasis,
                      ),
                      Text(
                        userOrder.id,
                        style: kTitle2Style.copyWith(
                          color: kPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //* Different Statuses: Pickup Booked, Pickup Accepted, Guy on the way, Pickup Completed
                  StepProgressIndicator(
                    totalSteps: 4,
                    currentStep: int.parse(userOrder.status) + 1,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    size: 125,
                    selectedColor: kPrimaryColor,
                    unselectedColor: Colors.black12,
                    customStep: (index, color, _) => color == kPrimaryColor
                        ? Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: color,
                                child: Icon(
                                  UIcons.boldRounded.check,
                                  size: 15,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                orderStatuses[index],
                                style: kSubtitle3Style,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: color,
                                child: Icon(
                                  UIcons.boldRounded.cross,
                                  size: 15,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                orderStatuses[index],
                                style: kSubtitle3Style,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                  ),
                  Spacer(),
                  Visibility(
                    visible: userOrder.deliveryPartner.partnerName != '',
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      isThreeLine: true,
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundColor: kPrimaryColor,
                        child: Icon(
                          UIcons.boldRounded.user,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      title: Text(
                        'Delivery Partner',
                        style: kTitle3Style,
                      ),
                      subtitle: Text(
                        '${userOrder.deliveryPartner.partnerName}\n${userOrder.deliveryPartner.partnerContact}',
                        style: kSubtitleStyle,
                      ),
                      trailing: CircleAvatar(
                        radius: 25,
                        backgroundColor: kPrimaryColor,
                        child: Icon(
                          UIcons.regularRounded.phone_call,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
