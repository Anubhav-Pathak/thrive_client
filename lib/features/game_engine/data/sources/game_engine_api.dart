import 'package:thrive_client/features/game_engine/data/models/choice.dart';
import 'package:thrive_client/features/game_engine/data/models/game.dart';
import 'package:thrive_client/features/discover/data/models/player.dart';
import 'package:thrive_client/features/discover/data/models/story.dart';

abstract class IGameEngineApi {
  Future<Game> init(Player player, Story story);
  Future<Story> makeDecision(Choice decision);
  Future<Story> goBack();
  Future<Game> restart();
  void exit();
}
