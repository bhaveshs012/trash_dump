import 'dart:convert';

class CartItemModel {
  final int price;
  final String imageUrl;
  final String name;
  final String description;
  final int id;
  final String category;
  int quantity;
  int totalPrice;
  CartItemModel({
    required this.price,
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.id,
    required this.category,
    required this.quantity,
    required this.totalPrice,
  });

  CartItemModel copyWith({
    int? price,
    String? imageUrl,
    String? name,
    String? description,
    int? id,
    String? category,
    int? quantity,
    int? totalPrice,
  }) {
    return CartItemModel(
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      name: name ?? this.name,
      description: description ?? this.description,
      id: id ?? this.id,
      category: category ?? this.category,
      quantity: quantity ?? this.quantity,
      totalPrice: totalPrice ?? this.totalPrice,
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
      'quantity': quantity,
      'total_price': totalPrice,
    };
  }

  factory CartItemModel.fromMap(Map<String, dynamic> map) {
    return CartItemModel(
      price: map['price']?.toInt() ?? 0,
      imageUrl: map['imageUrl'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      id: map['id']?.toInt() ?? 0,
      category: map['category'] ?? '',
      quantity: map['quantity']?.toInt() ?? 0,
      totalPrice: map['total_price']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartItemModel.fromJson(String source) =>
      CartItemModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CartItemModel(price: $price, imageUrl: $imageUrl, name: $name, description: $description, id: $id, category: $category, quantity: $quantity, total_price: $totalPrice)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CartItemModel &&
        other.price == price &&
        other.imageUrl == imageUrl &&
        other.name == name &&
        other.description == description &&
        other.id == id &&
        other.category == category &&
        other.quantity == quantity &&
        other.totalPrice == totalPrice;
  }

  @override
  int get hashCode {
    return price.hashCode ^
        imageUrl.hashCode ^
        name.hashCode ^
        description.hashCode ^
        id.hashCode ^
        category.hashCode ^
        quantity.hashCode ^
        totalPrice.hashCode;
  }
}
