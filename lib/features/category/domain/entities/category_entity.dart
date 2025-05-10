import 'package:flutter/widgets.dart';

class CategoryEntity {
  final String id;
  final String name;
  final String description;
  final Icon icon;
  final String imagePath;

  const CategoryEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
    required this.imagePath,
  });
}
