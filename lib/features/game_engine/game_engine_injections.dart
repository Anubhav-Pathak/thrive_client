import 'package:thrive_client/core/utils/injections.dart';
import 'package:thrive_client/features/game_engine/data/repositories/game_engine_repository.impl.dart';
import 'package:thrive_client/features/game_engine/data/sources/game_engine_api.impl.dart';
import 'package:thrive_client/features/game_engine/domain/usecases/game_engine_usecase.dart';

initGameEngineInjections() {
  locator.registerSingleton<GameEngineApi>(
    GameEngineApi(),
  );
  locator.registerSingleton<GameEngineRepository>(
    GameEngineRepository(
      locator<GameEngineApi>(),
    ),
  );
  locator.registerSingleton<GameEngineUsecase>(
    GameEngineUsecase(
      locator<GameEngineRepository>(),
    ),
  );
}
