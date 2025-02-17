import 'package:dartz/dartz.dart';
import 'package:thrive_client/features/game_engine/data/models/game.dart';
import 'package:thrive_client/features/game_engine/data/sources/game_engine_api.dart';
import 'package:thrive_client/features/game_engine/domain/repositories/game_engine_repository.dart';
import 'package:thrive_client/features/discover/data/models/player.dart';
import 'package:thrive_client/features/discover/data/models/story.dart';

class GameEngineRepository implements IGameEngineRepository {
  final IGameEngineApi gameEngineApi;

  GameEngineRepository(this.gameEngineApi);

  @override
  Future<Either<String, Game>> initGame(Player player, Story story) async {
    try {
      final result = await gameEngineApi.init(player, story);
      return Right(result);
    } catch (e) {
      return Left('Error occurred: $e');
    }
  }
}
