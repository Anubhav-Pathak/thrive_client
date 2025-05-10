import 'package:thrive_client/features/game/data/models/choice.dart';
import 'package:thrive_client/features/game/domain/entities/plot_entity.dart';

class Plot extends PlotEntity {
  Plot({
    required super.id,
    required super.title,
    required super.description,
    required super.imageUrl,
    required super.isLast,
    required super.choices,
    required super.hint,
    required super.createdAt,
  });

  factory Plot.fromJson(Map<String, dynamic> json) {
    return Plot(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      isLast: json['isLast'],
      choices: json['choices'] != null ? (json['choices'] as List).map((choice) => Choice.fromJson(choice)).toList() : null,
      hint: "",
      createdAt: DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'image_url': imageUrl,
      'is_last': isLast,
      'choices': choices?.map((Choice choice) => choice.toJson()).toList(),
      'hint': hint,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
