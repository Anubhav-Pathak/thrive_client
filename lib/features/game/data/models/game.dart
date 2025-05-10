import 'package:thrive_client/features/game/data/models/plot.dart';
import 'package:thrive_client/features/game/domain/entities/game_entity.dart';
import 'package:thrive_client/features/discover/data/models/player.dart';
import 'package:thrive_client/features/discover/data/models/story.dart';

class Game extends GameEntity {
  Game({
    required super.player,
    required super.story,
    required super.currentPlot,
  });

  factory Game.fromJson(Player player, Story story, Map<String, dynamic> json) {
    return Game(
      player: player,
      story: story,
      currentPlot: Plot.fromJson(json['currentPlot']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'player': player.toJson(),
      'story': story.toJson(),
      'currentPlot': currentPlot.toJson(),
    };
  }
}
