import 'package:dartz/dartz.dart';
import 'package:thrive_client/core/utils/usecases/usecase.dart';
import 'package:thrive_client/features/discover/data/models/player.dart';
import 'package:thrive_client/features/discover/data/models/story.dart';
import 'package:thrive_client/features/game/data/models/choice.dart';
import 'package:thrive_client/features/game/data/models/plot.dart';
import 'package:thrive_client/features/game/domain/repositories/game_repository.dart';

class GameUsecase {
  final IGameRepository gameRepository;

  GameUsecase(
    this.gameRepository,
  );
}

class MakeDecisionUseCase extends GameUsecase implements UseCase {
  MakeDecisionUseCase(
    super.gameRepository,
  );

  @override
  Future<Either<String, Plot>> call(params) {
    final (player, story, decision) = params as (Player, Story, Choice);
    return gameRepository.makeDecision(player, story, decision);
  }
}

class GoBackUseCase extends GameUsecase implements UseCase {
  GoBackUseCase(
    super.gameRepository,
  );

  @override
  Future<Either<String, Plot>> call(params) {
    final (player, story) = params as (Player, Story);
    return gameRepository.goBack(player, story);
  }
}
