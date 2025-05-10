import 'package:thrive_client/features/game/domain/entities/game_entity.dart';

abstract class GameState {
  final GameEntity? game;
  final bool isTextFinished;

  const GameState({
    this.game,
    this.isTextFinished = false,
  });
}

class GameInitial extends GameState {
  GameInitial({required GameEntity game}) : super(game: game, isTextFinished: false);
}

class GameLoading extends GameState {
  GameLoading({super.game, super.isTextFinished = false});
}

class GameLoaded extends GameState {
  const GameLoaded({super.game, super.isTextFinished = false});
}

class GameError extends GameState {
  final String message;
  GameError(this.message, {super.game, super.isTextFinished = false});
}
