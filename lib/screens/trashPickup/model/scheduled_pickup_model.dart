import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:waste_management_app/screens/trashPickup/model/pickup_partner_model.dart';
import 'package:waste_management_app/utils/helper_model.dart';

class ScheduledPickupModel {
  final String instructions;
  final String userId;
  final String pickUpAddress;
  final String selectedTimeSlotString;
  final Timestamp selectedDate;
  final List<String> selectedWasteTypes;
  final GeoPoint selectedLocation;
  final String status;
  final String id;
  final String contactName;
  final String contactNumber;
  final PickupPartnerModel pickupPartner;
  ScheduledPickupModel({
    required this.instructions,
    required this.userId,
    required this.pickUpAddress,
    required this.selectedTimeSlotString,
    required this.selectedDate,
    required this.selectedWasteTypes,
    required this.selectedLocation,
    required this.status,
    required this.id,
    required this.contactName,
    required this.contactNumber,
    required this.pickupPartner,
  });
  static final helper = HelperModel(
    ((map) => ScheduledPickupModel.fromMap(map)),
  );
  ScheduledPickupModel copyWith({
    String? instructions,
    String? userId,
    String? pickUpAddress,
    String? selectedTimeSlotString,
    Timestamp? selectedDate,
    List<String>? selectedWasteTypes,
    GeoPoint? selectedLocation,
    String? status,
    String? id,
    String? contactName,
    String? contactNumber,
    PickupPartnerModel? pickupPartner,
  }) {
    return ScheduledPickupModel(
      instructions: instructions ?? this.instructions,
      userId: userId ?? this.userId,
      pickUpAddress: pickUpAddress ?? this.pickUpAddress,
      selectedTimeSlotString:
          selectedTimeSlotString ?? this.selectedTimeSlotString,
      selectedDate: selectedDate ?? this.selectedDate,
      selectedWasteTypes: selectedWasteTypes ?? this.selectedWasteTypes,
      selectedLocation: selectedLocation ?? this.selectedLocation,
      status: status ?? this.status,
      id: id ?? this.id,
      contactName: contactName ?? this.contactName,
      contactNumber: contactNumber ?? this.contactNumber,
      pickupPartner: pickupPartner ?? this.pickupPartner,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'instructions': instructions,
      'user_id': userId,
      'pickUpAddress': pickUpAddress,
      'selectedTimeSlotString': selectedTimeSlotString,
      'selectedDate': selectedDate,
      'selectedWasteTypes': selectedWasteTypes,
      'selectedLocation': selectedLocation,
      'status': status,
      'id': id,
      'contactName': contactName,
      'contactNumber': contactNumber,
      'pickupPartner': pickupPartner.toMap(),
    };
  }

  factory ScheduledPickupModel.fromMap(Map<String, dynamic> map) {
    return ScheduledPickupModel(
      instructions: map['instructions'] ?? '',
      userId: map['user_id'] ?? '',
      pickUpAddress: map['pickUpAddress'] ?? '',
      selectedTimeSlotString: map['selectedTimeSlotString'] ?? '',
      selectedDate: map['selectedDate'] ?? '',
      selectedWasteTypes: List<String>.from(map['selectedWasteTypes']),
      selectedLocation: map['selectedLocation'] ?? '',
      status: map['status'] ?? '',
      id: map['id'] ?? '',
      contactName: map['contactName'] ?? '',
      contactNumber: map['contactNumber'] ?? '',
      pickupPartner: PickupPartnerModel.fromMap(map['pickupPartner']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ScheduledPickupModel.fromJson(String source) =>
      ScheduledPickupModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ScheduledPickupModel(instructions: $instructions, user_id: $userId, pickUpAddress: $pickUpAddress, selectedTimeSlotString: $selectedTimeSlotString, selectedDate: $selectedDate, selectedWasteTypes: $selectedWasteTypes, selectedLocation: $selectedLocation, status: $status, id: $id, contactName: $contactName, contactNumber: $contactNumber)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ScheduledPickupModel &&
        other.instructions == instructions &&
        other.userId == userId &&
        other.pickUpAddress == pickUpAddress &&
        other.selectedTimeSlotString == selectedTimeSlotString &&
        other.selectedDate == selectedDate &&
        listEquals(other.selectedWasteTypes, selectedWasteTypes) &&
        other.selectedLocation == selectedLocation &&
        other.status == status &&
        other.id == id &&
        other.contactName == contactName &&
        other.contactNumber == contactNumber;
  }

  @override
  int get hashCode {
    return instructions.hashCode ^
        userId.hashCode ^
        pickUpAddress.hashCode ^
        selectedTimeSlotString.hashCode ^
        selectedDate.hashCode ^
        selectedWasteTypes.hashCode ^
        selectedLocation.hashCode ^
        status.hashCode ^
        id.hashCode ^
        contactName.hashCode ^
        contactNumber.hashCode;
  }
}
