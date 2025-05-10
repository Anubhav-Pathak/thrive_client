import 'package:flutter/widgets.dart';
import '../../domain/entities/category_entity.dart';

class Category extends CategoryEntity {
  const Category({
    required super.id,
    required super.name,
    required super.description,
    required super.icon,
    required super.imagePath,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      icon: Icon(IconData(json['icon'], fontFamily: 'MaterialIcons')),
      imagePath: json['imagePath'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'icon': icon.icon?.codePoint,
      'imagePath': imagePath,
    };
  }
}
