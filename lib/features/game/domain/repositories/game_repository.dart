import 'package:dartz/dartz.dart';
import 'package:thrive_client/features/discover/data/models/player.dart';
import 'package:thrive_client/features/discover/data/models/story.dart';
import 'package:thrive_client/features/game/data/models/choice.dart';
import 'package:thrive_client/features/game/data/models/plot.dart';

abstract class IGameRepository {
  Future<Either<String, Plot>> makeDecision(Player player, Story story, Choice choice);
  Future<Either<String, Plot>> goBack(Player player, Story story);
}
