import 'package:thrive_client/features/game_engine/data/models/choice.dart';

class PlotEntity {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final bool isLast;
  final List<Choice>? choices;
  final String? hint;
  final DateTime createdAt;

  PlotEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.isLast,
    required this.choices,
    required this.hint,
    required this.createdAt,
  });
}
