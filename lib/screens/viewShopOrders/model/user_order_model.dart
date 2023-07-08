import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:waste_management_app/screens/viewShopOrders/model/delivery_partner.dart';
import 'package:waste_management_app/utils/helper_model.dart';

class UserOrderModel {
  final String userId;
  final String deliveryAddress;
  final String paymentOption;
  final List<Item> items;
  final String id;
  final Timestamp timestamp;
  final String contactName;
  final String contactNumber;
  final String status;
  final DeliveryPartnerModel deliveryPartner;
  UserOrderModel(
    {
    required this.id,
    required this.userId,
    required this.deliveryAddress,
    required this.paymentOption,
    required this.items,
    required this.timestamp,
    required this.contactName,
    required this.contactNumber,
    required this.status,
    required this.deliveryPartner,
  });
  static final helper = HelperModel(
    ((map) => UserOrderModel.fromMap(map)),
  );

  UserOrderModel copyWith({
    String? userId,
    String? deliveryAddress,
    String? paymentOption,
    String? id,
    List<Item>? items,
    Timestamp? timestamp,
    String? contactName,
    String? contactNumber,
    String? status,
    DeliveryPartnerModel? deliveryPartner,
  }) {
    return UserOrderModel(
      deliveryPartner: deliveryPartner ?? this.deliveryPartner,
      userId: userId ?? this.userId,
      id: id ?? this.id,
      deliveryAddress: deliveryAddress ?? this.deliveryAddress,
      paymentOption: paymentOption ?? this.paymentOption,
      items: items ?? this.items,
      timestamp: timestamp ?? this.timestamp,
      contactName: contactName ?? this.contactName,
      contactNumber: contactNumber ?? this.contactNumber,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': userId,
      'deliveryAddress': deliveryAddress,
      'paymentOption': paymentOption,
      'items': items.map((x) => x.toMap()).toList(),
      'timestamp': timestamp,
      'contactName': contactName,
      'contactNumber': contactNumber,
      'status': status,
      'delivery_partner': deliveryPartner.toMap() 
    };
  }

  factory UserOrderModel.fromMap(Map<String, dynamic> map) {
    return UserOrderModel(
      deliveryPartner: DeliveryPartnerModel.fromMap(map['delivery_partner']),
      userId: map['user_id'] ?? '',
      id: map['id'] ?? '',
      deliveryAddress: map['deliveryAddress'] ?? '',
      paymentOption: map['paymentOption'] ?? '',
      items: List<Item>.from(map['items']?.map((x) => Item.fromMap(x))),
      timestamp: map['timestamp'] ?? '',
      contactName: map['contactName'] ?? '',
      contactNumber: map['contactNumber'] ?? '',
      status: map['status'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserOrderModel.fromJson(String source) =>
      UserOrderModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserOrderModel(id: $id, user_id: $userId, deliveryAddress: $deliveryAddress, paymentOption: $paymentOption, items: $items, timestamp: $timestamp, contactName: $contactName, contactNumber: $contactNumber, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserOrderModel &&
        other.userId == userId &&
        other.id == id &&
        other.deliveryAddress == deliveryAddress &&
        other.paymentOption == paymentOption &&
        listEquals(other.items, items) &&
        other.timestamp == timestamp &&
        other.contactName == contactName &&
        other.contactNumber == contactNumber &&
        other.status == status;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
        id.hashCode ^
        deliveryAddress.hashCode ^
        paymentOption.hashCode ^
        items.hashCode ^
        timestamp.hashCode ^
        contactName.hashCode ^
        contactNumber.hashCode ^
        status.hashCode;
  }
}

class Item {
  final int quantity;
  final int totalPrice;
  final int price;
  final String imageUrl;
  final String name;
  final String description;
  final int id;
  final String category;
  Item({
    required this.quantity,
    required this.totalPrice,
    required this.price,
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.id,
    required this.category,
  });
  static final helper = HelperModel(
    ((map) => Item.fromMap(map)),
  );

  Item copyWith({
    int? quantity,
    int? totalPrice,
    int? price,
    String? imageUrl,
    String? name,
    String? description,
    int? id,
    String? category,
  }) {
    return Item(
      quantity: quantity ?? this.quantity,
      totalPrice: totalPrice ?? this.totalPrice,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      name: name ?? this.name,
      description: description ?? this.description,
      id: id ?? this.id,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'quantity': quantity,
      'total_price': totalPrice,
      'price': price,
      'imageUrl': imageUrl,
      'name': name,
      'description': description,
      'id': id,
      'category': category,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      quantity: map['quantity']?.toInt() ?? 0,
      totalPrice: map['total_price']?.toInt() ?? 0,
      price: map['price']?.toInt() ?? 0,
      imageUrl: map['imageUrl'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      id: map['id']?.toInt() ?? 0,
      category: map['category'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Item(quantity: $quantity, total_price: $totalPrice, price: $price, imageUrl: $imageUrl, name: $name, description: $description, id: $id, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Item &&
        other.quantity == quantity &&
        other.totalPrice == totalPrice &&
        other.price == price &&
        other.imageUrl == imageUrl &&
        other.name == name &&
        other.description == description &&
        other.id == id &&
        other.category == category;
  }

  @override
  int get hashCode {
    return quantity.hashCode ^
        totalPrice.hashCode ^
        price.hashCode ^
        imageUrl.hashCode ^
        name.hashCode ^
        description.hashCode ^
        id.hashCode ^
        category.hashCode;
  }
}
