import 'package:dartz/dartz.dart';
import 'package:thrive_client/features/discover/data/models/discover.dart';
import 'package:thrive_client/features/discover/data/models/player.dart';
import 'package:thrive_client/features/discover/data/models/story.dart';
import 'package:thrive_client/features/discover/data/sources/discover_api.dart';
import 'package:thrive_client/features/discover/domain/repositories/discover_repository.dart';
import 'package:thrive_client/features/game/data/models/game.dart';

class DiscoverRepository implements IDiscoverRepository {
  final IDiscoverApi discoverApi;

  DiscoverRepository(this.discoverApi);

  @override
  Future<Either<String, Discover>> initDiscover(Player player, String? category) async {
    try {
      final result = await discoverApi.init(player, category);
      return Right(result);
    } catch (e) {
      return Left('Error occurred: $e');
    }
  }

  @override
  Future<Either<String, Game>> loadGame(Player player, Story story) async {
    try {
      final result = await discoverApi.loadGame(player, story);
      return Right(result);
    } catch (e) {
      return Left('Error occurred: $e');
    }
  }
}
