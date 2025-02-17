import 'package:dartz/dartz.dart';
import 'package:thrive_client/features/game_engine/data/models/game.dart';
import 'package:thrive_client/features/discover/data/models/player.dart';
import 'package:thrive_client/features/discover/data/models/story.dart';

abstract class IGameEngineRepository {
  Future<Either<String, Game>> initGame(Player player, Story story);
}
