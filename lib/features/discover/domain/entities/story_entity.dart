import 'package:thrive_client/core/utils/constant/enums.dart';

abstract class StoryEntity {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final StoryType type;
  final Status status;
  final DateTime createdAt;
  final DateTime? lastPlayedAt;

  StoryEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.type,
    required this.status,
    required this.createdAt,
    required this.lastPlayedAt,
  });
}
