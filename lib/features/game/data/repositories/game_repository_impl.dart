import 'package:dartz/dartz.dart';
import 'package:thrive_client/features/discover/data/models/player.dart';
import 'package:thrive_client/features/discover/data/models/story.dart';
import 'package:thrive_client/features/game/data/models/choice.dart';
import 'package:thrive_client/features/game/data/models/plot.dart';
import 'package:thrive_client/features/game/data/sources/game_api.dart';
import 'package:thrive_client/features/game/domain/repositories/game_repository.dart';

class GameRepository implements IGameRepository {
  final IGameApi gameEngineApi;

  GameRepository(this.gameEngineApi);

  @override
  Future<Either<String, Plot>> makeDecision(Player player, Story story, Choice choice) async {
    try {
      final result = await gameEngineApi.makeDecision(player, story, choice);
      return Right(result);
    } catch (e) {
      return Left('Error occurred: $e');
    }
  }

  @override
  Future<Either<String, Plot>> goBack(Player player, Story story) async {
    try {
      final result = await gameEngineApi.goBack(player, story);
      return Right(result);
    } catch (e) {
      return Left('Error occurred: $e');
    }
  }
}
