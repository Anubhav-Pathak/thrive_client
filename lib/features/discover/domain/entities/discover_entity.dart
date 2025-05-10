import 'package:thrive_client/features/discover/data/models/player.dart';
import 'package:thrive_client/features/discover/data/models/story.dart';

abstract class DiscoverEntity {
  final Player player;
  final List<Story> stories;

  DiscoverEntity({
    required this.player,
    required this.stories,
  });
}
