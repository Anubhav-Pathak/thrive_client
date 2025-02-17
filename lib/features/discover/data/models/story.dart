import 'package:thrive_client/features/discover/domain/entities/story_entity.dart';

class Story extends StoryEntity {
  Story({
    required super.id,
    required super.title,
    required super.description,
    required super.imageUrl,
    required super.type,
    required super.status,
    required super.createdAt,
    required super.lastPlayedAt,
  });

  factory Story.fromJson(Map<String, dynamic> json) {
    return Story(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      imageUrl: json['image_url'],
      type: json['type'],
      status: json['status'],
      createdAt: DateTime.parse(json['created_at']),
      lastPlayedAt: json['last_played_at'] != null
          ? DateTime.parse(json['last_played_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'image_url': imageUrl,
      'type': type,
      'status': status,
      'created_at': createdAt.toIso8601String(),
      'last_played_at': lastPlayedAt?.toIso8601String(),
    };
  }
}
