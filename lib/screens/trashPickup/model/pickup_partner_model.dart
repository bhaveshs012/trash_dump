import 'dart:convert';

class PickupPartnerModel {
  final String partnerName;
  final String partnerContact;
  PickupPartnerModel({
    required this.partnerName,
    required this.partnerContact,
  });

  PickupPartnerModel copyWith({
    String? partnerName,
    String? partnerContact,
  }) {
    return PickupPartnerModel(
      partnerName: partnerName ?? this.partnerName,
      partnerContact: partnerContact ?? this.partnerContact,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'partner_name': partnerName,
      'partner_contact': partnerContact,
    };
  }

  factory PickupPartnerModel.fromMap(Map<String, dynamic> map) {
    return PickupPartnerModel(
      partnerName: map['partner_name'] ?? '',
      partnerContact: map['partner_contact'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PickupPartnerModel.fromJson(String source) =>
      PickupPartnerModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'DeliveryPartnerModel(partner_name: $partnerName, partner_contact: $partnerContact)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PickupPartnerModel &&
        other.partnerName == partnerName &&
        other.partnerContact == partnerContact;
  }

  @override
  int get hashCode => partnerName.hashCode ^ partnerContact.hashCode;
}
