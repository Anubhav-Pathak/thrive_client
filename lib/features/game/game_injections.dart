import 'package:thrive_client/core/utils/injections.dart';
import 'package:thrive_client/features/game/data/repositories/game_repository_impl.dart';
import 'package:thrive_client/features/game/data/sources/game_api_local_impl.dart';
import 'package:thrive_client/features/game/domain/usecases/game_usecase.dart';

initGameInjections() {
  locator.registerSingleton<GameApiLocal>(
    GameApiLocal(),
  );
  locator.registerSingleton<GameRepository>(
    GameRepository(
      locator<GameApiLocal>(),
    ),
  );
  locator.registerSingleton<MakeDecisionUseCase>(
    MakeDecisionUseCase(
      locator<GameRepository>(),
    ),
  );
  locator.registerSingleton<GoBackUseCase>(
    GoBackUseCase(
      locator<GameRepository>(),
    ),
  );
}
