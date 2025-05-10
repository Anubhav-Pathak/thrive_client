import 'package:thrive_client/features/discover/domain/entities/discover_entity.dart';
import 'package:thrive_client/features/game/domain/entities/game_entity.dart';

abstract class DiscoverState {
  final DiscoverEntity? discover;
  const DiscoverState({this.discover});
}

class DiscoverInitial extends DiscoverState {
  DiscoverInitial({super.discover});
}

class DiscoverLoading extends DiscoverState {
  DiscoverLoading({super.discover});
}

class DiscoverGameLoading extends DiscoverState {
  DiscoverGameLoading({super.discover});
}

class DiscoverLoaded extends DiscoverState {
  DiscoverLoaded({super.discover});
}

class DiscoverGameLoaded extends DiscoverState {
  final GameEntity data;
  DiscoverGameLoaded(this.data);
}

class DiscoverError extends DiscoverState {
  final String message;
  DiscoverError(this.message);
}
