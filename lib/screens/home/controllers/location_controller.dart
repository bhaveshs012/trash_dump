import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationController extends GetxController {
  RxString userAddress = ''.obs;
  Rx<LatLng> userLatLng = LatLng(13.5, 135.5).obs;
  GoogleMapController? mapController;

  @override
  void onClose() {
    mapController!.dispose();
    super.dispose();
  }

  Future<bool> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar('Error', 'Location services are disabled.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar('Error', 'Location services are disabled.',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Get.snackbar('Error', 'Location services are permanently denied.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      return false;
    }
    return true;
  }

  Future<void> getCurrentPosition() async {
    final hasPermission = await handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      userLatLng.value = LatLng(position.latitude, position.longitude);
      log('User Position: ${userLatLng.value}');
      getUserAddress();
      goToUserPosition();
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> goToUserPosition() async {
    mapController!.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: userLatLng.value,
        zoom: 18.0,
      ),
    ));
  }

  Future<void> getUserAddress() async {
    final hasPermission = await handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      final List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      final Placemark place = placemarks[0];
      userAddress.value =
          '${place.name}, ${place.locality}, ${place.administrativeArea}, '
          '${place.country}, ${place.postalCode}';
      log('User Address: ${userAddress.value}');
    }).catchError((e) {
      debugPrint(e);
    });
  }
}
