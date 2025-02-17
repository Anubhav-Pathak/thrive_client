import 'package:thrive_client/features/game_engine/data/models/plot.dart';
import 'package:thrive_client/features/discover/data/models/player.dart';
import 'package:thrive_client/features/discover/data/models/story.dart';

class GameEntity {
  Player player;
  Story story;
  Plot currentPlot;

  GameEntity({
    required this.player,
    required this.story,
    required this.currentPlot,
  });
}
