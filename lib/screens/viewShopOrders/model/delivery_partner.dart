import 'dart:convert';

class DeliveryPartnerModel {
  final String partnerName;
  final String partnerContact;
  DeliveryPartnerModel({
    required this.partnerName,
    required this.partnerContact,
  });

  DeliveryPartnerModel copyWith({
    String? partnerName,
    String? partnerContact,
  }) {
    return DeliveryPartnerModel(
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

  factory DeliveryPartnerModel.fromMap(Map<String, dynamic> map) {
    return DeliveryPartnerModel(
      partnerName: map['partner_name'] ?? '',
      partnerContact: map['partner_contact'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DeliveryPartnerModel.fromJson(String source) => DeliveryPartnerModel.fromMap(json.decode(source));

  @override
  String toString() => 'DeliveryPartnerModel(partner_name: $partnerName, partner_contact: $partnerContact)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is DeliveryPartnerModel &&
      other.partnerName == partnerName &&
      other.partnerContact == partnerContact;
  }

  @override
  int get hashCode => partnerName.hashCode ^ partnerContact.hashCode;
}