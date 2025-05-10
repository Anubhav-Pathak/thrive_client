import 'package:thrive_client/features/discover/data/models/discover.dart';
import 'package:thrive_client/features/discover/data/models/player.dart';
import 'package:thrive_client/features/discover/data/models/story.dart';
import 'package:thrive_client/features/game/data/models/game.dart';

abstract class IDiscoverApi {
  Future<Discover> init(Player player, String? category);
  Future<Game> loadGame(Player player, Story story);
}
