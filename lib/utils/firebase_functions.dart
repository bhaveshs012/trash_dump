import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:waste_management_app/constants/firebase_collections.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFunctions {
  static FirebaseFunctions get instance => FirebaseFunctions();

  //* ------------------- AUTHENTICATION FUNCTIONS: ---------------------

  Future<void> createUserDocumentWithEmailAndPassword(
      {required String name,
      required String email,
      required String password,
      required String uid}) async {
    await FirebaseFirestore.instance
        .collection(FirebaseCollections.USERS)
        .doc(uid)
        .set({
      'name': name,
      'email': email,
      'password': password,
      'uid': uid,
      'phoneNumber': null
    });
  }

  Future<void> createUserWithPhoneNumber(
      {required String name,
      required String phoneNumber,
      required String uid}) async {
    await FirebaseFirestore.instance
        .collection(FirebaseCollections.USERS)
        .doc(phoneNumber)
        .set({
      'name': name,
      'phoneNumber': phoneNumber,
      'uid': uid,
      'email': null
    });
  }

  Future<bool> checkIfPhoneNumberExists(String phoneNumber) async {
    bool exists = false;
    await FirebaseFirestore.instance
        .collection(FirebaseCollections.USERS)
        .doc(phoneNumber)
        .get()
        .then((value) {
      if (value.exists) {
        log("User exists");
        exists = true;
      } else {
        log("User does not exist");
      }
    });
    return exists;
  }

  //* ------------------- TRASH PICKUP FUNCTIONS: ---------------------
  Future<void> createPickupBooking(
      {required DateTime selectedDate,
      required TimeOfDay selectedTimeSlot,
      required List<String> selectedWasteTypes,
      required String pickUpAddress,
      required LatLng selectedLocation,
      required String contactName,
      required String contactNumber,
      required String instructions,
      required String uid}) async {
    await FirebaseFirestore.instance
        .collection(FirebaseCollections.PICKUP_BOOKINGS)
        .add({
      'selectedDate': selectedDate,
      'selectedTimeSlotString': DateFormat('hh:mm a').format(selectedDate),
      'selectedWasteTypes': selectedWasteTypes,
      // TODO: ADD TIMESTAMP FOR TIMESLOT
      'pickUpAddress': pickUpAddress,
      'selectedLocation':
          GeoPoint(selectedLocation.latitude, selectedLocation.longitude),
      'instructions': instructions,
      'contactName': contactName,
      'contactNumber': contactNumber,
      'status': '0',
      'user_id': uid,
      'pickupPartner': {
        'partner_name': '',
        'partner_contact': '',
      }
    }).then((value) => {
              log('Pickup Booking Created'),
              FirebaseFirestore.instance
                  .collection(FirebaseCollections.PICKUP_BOOKINGS)
                  .doc(value.id)
                  .update({'id': value.id})
            });
  }

  //* ------------------- SUBMIT FEEDBACK FUNCTIONS: ---------------------

  Future<void> submitFeedback(
      {required String subject,
      required String feedback,
      required String uid}) async {
    await FirebaseFirestore.instance
        .collection(FirebaseCollections.FEEDBACK)
        .add({
      'subject': subject,
      'feedback': feedback,
      'user_id': uid,
    });
  }

  // //* ----------------------- SHOP RELATED FUNCTIONS: -----------------------
  // Future<void> setupInitialStore({required List<ShopItemModel> shopItems}) async{
  //   await FirebaseFirestore.instance
  //       .collection(FirebaseCollections.SHOP_ITEMS)
  //       .get()
  //       .then((value) {
  //     if (value.docs.isEmpty) {
  //       shopItems.forEach((element) async {
  //         await FirebaseFirestore.instance
  //             .collection(FirebaseCollections.SHOP_ITEMS)
  //             .add({
  //           'name': element.name,
  //           'description': element.description,
  //           'imageUrl': element.imageUrl,
  //           'price': element.price,
  //           'category': element.category,
  //           'id': element.id,
  //         });
  //       });
  //     }
  //   });
  // }

  Future<String> getUserName({required String uid}) async {
    String name = '';
    await FirebaseFirestore.instance
        .collection(FirebaseCollections.USERS)
        .doc(uid)
        .get()
        .then((value) {
      if (value.exists) {
        name = value.data()!['name'];
      }
    });
    return name;
  }
}
