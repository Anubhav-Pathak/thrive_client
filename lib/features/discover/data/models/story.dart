import 'package:thrive_client/core/utils/constant/enums.dart';
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
      imageUrl: "",
      type: StoryType.educative,
      status: Status.inProgress,
      createdAt: DateTime.now(),
      lastPlayedAt: DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'type': type,
      'status': status,
      'createdAt': createdAt.toIso8601String(),
      'lastPlayedAt': lastPlayedAt?.toIso8601String(),
    };
  }
}
