import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thrive_client/core/utils/injections.dart';
import 'package:thrive_client/features/game/domain/entities/choice_entity.dart';
import 'package:thrive_client/features/game/domain/entities/game_entity.dart';
import 'package:thrive_client/features/game/domain/usecases/game_usecase.dart';
import 'package:thrive_client/features/game/presentation/bloc/game_state.dart';

class GameCubit extends Cubit<GameState> {
  final MakeDecisionUseCase _makeDecisionUseCase = locator<MakeDecisionUseCase>();
  final GoBackUseCase _goBackUseCase = locator<GoBackUseCase>();

  GameCubit({
    required GameEntity game,
  }) : super(GameInitial(game: game));

  void makeDecision(ChoiceEntity decision) async {
    emit(GameLoading(game: state.game));

    final result = await _makeDecisionUseCase.call((
      state.game?.player,
      state.game?.story,
      decision,
    ));

    result.fold(
      (error) => emit(GameError(error)),
      (newPlot) {
        if (state.game != null) {
          emit(
            GameLoaded(
              game: GameEntity(
                player: state.game!.player,
                story: state.game!.story,
                currentPlot: newPlot,
              ),
              isTextFinished: state.isTextFinished,
            ),
          );
        } else {
          emit(GameError("Game not found"));
        }
      },
    );
  }

  void goBack() async {
    emit(GameLoading(game: state.game));

    final result = await _goBackUseCase.call((
      state.game?.player,
      state.game?.story,
    ));

    result.fold(
      (error) => emit(GameError(error)),
      (newPlot) {
        if (state.game != null) {
          emit(
            GameLoaded(
              game: GameEntity(
                player: state.game!.player,
                story: state.game!.story,
                currentPlot: newPlot,
              ),
              isTextFinished: state.isTextFinished,
            ),
          );
        } else {
          emit(GameError("Game not found"));
        }
      },
    );
  }

  void setTextFinished() {
    emit(GameLoaded(game: state.game, isTextFinished: true));
  }
}
