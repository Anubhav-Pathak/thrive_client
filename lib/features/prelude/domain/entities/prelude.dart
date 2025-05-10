import 'package:thrive_client/features/discover/domain/entities/story_entity.dart';

class PreludeEntity extends StoryEntity {
  PreludeEntity({
    required super.id,
    required super.title,
    required super.description,
    required super.imageUrl,
    required super.type,
    required super.status,
    required super.createdAt,
    required super.lastPlayedAt,
    required this.prelude,
  });

  final String prelude;
}
