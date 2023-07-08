import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:waste_management_app/constants/api.dart';
import 'package:waste_management_app/constants/firebase_collections.dart';
import 'package:waste_management_app/screens/trashPickup/model/scheduled_pickup_model.dart';

class TrashPickupRepository {
  static final instance = TrashPickupRepository._();
  TrashPickupRepository._();

  //* Functions:
  Future<ApiResponse> getScheduledPickups(String uid) async {
    try {
      log(uid);
      QuerySnapshot scheduledPickupsSnapshot = await FirebaseFirestore.instance
          .collection(FirebaseCollections.PICKUP_BOOKINGS)
          .where('user_id', isEqualTo: uid)
          .get();
      final data =
          scheduledPickupsSnapshot.docs.map((doc) => doc.data()).toList();
      log('Data Here: ${data.toString()}');
      List<ScheduledPickupModel> scheduledPickups = <ScheduledPickupModel>[];
      scheduledPickups = ScheduledPickupModel.helper.fromMapArray(data);
      return ApiResponse(message: ApiMessage.success, data: scheduledPickups);
    } catch (e) {
      log(e.toString());
      return ApiResponse(message: ApiMessage.somethingWantWrongError, data: []);
    }
  }
}
