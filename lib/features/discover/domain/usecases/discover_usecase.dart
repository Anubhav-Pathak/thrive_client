import 'package:dartz/dartz.dart';
import 'package:thrive_client/core/utils/usecases/usecase.dart';
import 'package:thrive_client/features/discover/data/models/discover.dart';
import 'package:thrive_client/features/discover/data/models/player.dart';
import 'package:thrive_client/features/discover/data/models/story.dart';
import 'package:thrive_client/features/discover/domain/repositories/discover_repository.dart';
import 'package:thrive_client/features/game/data/models/game.dart';

class DiscoverUsecase {
  final IDiscoverRepository discoverRepository;

  DiscoverUsecase(
    this.discoverRepository,
  );
}

class InitDiscoverUseCase extends DiscoverUsecase implements UseCase {
  InitDiscoverUseCase(
    super.discoverRepository,
  );

  @override
  Future<Either<String, Discover>> call(params) {
    final (player, category) = params as (Player, String?);
    return discoverRepository.initDiscover(player, category);
  }
}

class LoadGameUseCase extends DiscoverUsecase implements UseCase {
  LoadGameUseCase(
    super.discoverRepository,
  );

  @override
  Future<Either<String, Game>> call(params) {
    final (player, story) = params as (Player, Story);
    return discoverRepository.loadGame(player, story);
  }
}
