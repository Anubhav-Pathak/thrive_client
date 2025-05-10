import 'package:dartz/dartz.dart';
import 'package:thrive_client/features/discover/data/models/discover.dart';
import 'package:thrive_client/features/discover/data/models/player.dart';
import 'package:thrive_client/features/discover/data/models/story.dart';
import 'package:thrive_client/features/game/data/models/game.dart';

abstract class IDiscoverRepository {
  Future<Either<String, Discover>> initDiscover(Player player, String? category);
  Future<Either<String, Game>> loadGame(Player player, Story story);
}
