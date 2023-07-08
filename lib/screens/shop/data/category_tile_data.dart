import 'package:flutter/material.dart';
import 'package:uicons/uicons.dart';

class CategoryTileData {
  final String title;
  final IconData icon;

  CategoryTileData({
    required this.title,
    required this.icon,
  });
}

List<CategoryTileData> shopCategories = [
  CategoryTileData(title: 'Paper', icon: UIcons.regularRounded.document),
  CategoryTileData(title: 'Plastic', icon: UIcons.regularRounded.water_bottle),
  CategoryTileData(title: 'Glass', icon: UIcons.regularRounded.glass),
  CategoryTileData(title: 'Metal', icon: UIcons.regularRounded.settings),
];
