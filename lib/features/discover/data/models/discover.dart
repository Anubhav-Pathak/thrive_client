import 'package:thrive_client/features/discover/data/models/player.dart';
import 'package:thrive_client/features/discover/data/models/story.dart';
import 'package:thrive_client/features/discover/domain/entities/discover_entity.dart';

class Discover extends DiscoverEntity {
  Discover({
    required super.player,
    required super.stories,
  });

  factory Discover.fromJson(Player player, Map<String, dynamic> json) {
    return Discover(
      player: player,
      stories: (json['stories'] as List).map((story) => Story.fromJson(story)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'player': player.toJson(),
      'stories': stories.map((story) => story.toJson()).toList(),
    };
  }
}
