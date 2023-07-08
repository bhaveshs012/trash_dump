import 'dart:convert';

import 'package:waste_management_app/utils/helper_model.dart';

class ShopItemModel {
  final int price;
  final String imageUrl;
  final String name;
  final String description;
  final int id;
  final String category;
  ShopItemModel({
    required this.price,
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.id,
    required this.category,
  });
  static final helper = HelperModel(
    ((map) => ShopItemModel.fromMap(map)),
  );
  

  ShopItemModel copyWith({
    int? price,
    String? imageUrl,
    String? name,
    String? description,
    int? id,
    String? category,
  }) {
    return ShopItemModel(
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
      'price': price,
      'imageUrl': imageUrl,
      'name': name,
      'description': description,
      'id': id,
      'category': category,
    };
  }

  factory ShopItemModel.fromMap(Map<String, dynamic> map) {
    return ShopItemModel(
      price: map['price']?.toInt() ?? 0,
      imageUrl: map['imageUrl'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      id: map['id']?.toInt() ?? 0,
      category: map['category'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ShopItemModel.fromJson(String source) => ShopItemModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ShopItemModel(price: $price, imageUrl: $imageUrl, name: $name, description: $description, id: $id, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ShopItemModel &&
      other.price == price &&
      other.imageUrl == imageUrl &&
      other.name == name &&
      other.description == description &&
      other.id == id &&
      other.category == category;
  }

  @override
  int get hashCode {
    return price.hashCode ^
      imageUrl.hashCode ^
      name.hashCode ^
      description.hashCode ^
      id.hashCode ^
      category.hashCode;
  }
}