import 'package:thrive_client/core/utils/injections.dart';
import 'package:thrive_client/features/discover/data/repositories/discover_repository.impl.dart';
import 'package:thrive_client/features/discover/data/sources/discover_api_local_impl.dart';
import 'package:thrive_client/features/discover/domain/usecases/discover_usecase.dart';

initDiscoverInjections() {
  locator.registerSingleton<DiscoverApiLocal>(
    DiscoverApiLocal(),
  );
  locator.registerSingleton<DiscoverRepository>(
    DiscoverRepository(
      locator<DiscoverApiLocal>(),
    ),
  );
  locator.registerSingleton<InitDiscoverUseCase>(
    InitDiscoverUseCase(
      locator<DiscoverRepository>(),
    ),
  );
  locator.registerSingleton<LoadGameUseCase>(
    LoadGameUseCase(
      locator<DiscoverRepository>(),
    ),
  );
}
