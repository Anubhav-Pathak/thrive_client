import 'package:thrive_client/features/discover/data/models/player.dart';
import 'package:thrive_client/features/game/data/models/choice.dart';
import 'package:thrive_client/features/game/data/models/game.dart';
import 'package:thrive_client/features/discover/data/models/story.dart';
import 'package:thrive_client/features/game/data/models/plot.dart';

abstract class IGameApi {
  Future<Plot> makeDecision(Player player, Story story, Choice decision);
  Future<Plot> goBack(Player player, Story story);
  Future<Game> restart();
  void exit();
}
