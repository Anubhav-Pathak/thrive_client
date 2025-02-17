import 'package:dartz/dartz.dart';
import 'package:thrive_client/core/utils/usecases/usecase.dart';
import 'package:thrive_client/features/game_engine/domain/entities/game_entity.dart';
import 'package:thrive_client/features/game_engine/domain/repositories/game_engine_repository.dart';

class GameEngineUsecase extends UseCase {
  final IGameEngineRepository _gameEngineRepository;

  GameEngineUsecase(
    this._gameEngineRepository,
  );

  @override
  Future<Either<String, GameEntity>> call(params) {
    return _gameEngineRepository.initGame(params.player, params.story);
  }
}
