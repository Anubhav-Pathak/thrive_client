import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thrive_client/core/router/routes.dart';
import 'package:thrive_client/core/utils/injections.dart';
import 'package:thrive_client/features/discover/data/models/player.dart';
import 'package:thrive_client/features/discover/domain/entities/story_entity.dart';
import 'package:thrive_client/features/discover/domain/usecases/discover_usecase.dart';
import 'package:thrive_client/features/discover/presentation/bloc/discover_state.dart';

class DiscoverCubit extends Cubit<DiscoverState> {
  final InitDiscoverUseCase _initDiscoverUseCase = locator<InitDiscoverUseCase>();
  final LoadGameUseCase _loadGameUseCase = locator<LoadGameUseCase>();
  final GlobalKey<NavigatorState> _navigatorKey = locator<GlobalKey<NavigatorState>>();

  DiscoverCubit() : super(DiscoverInitial());

  void init(String? category) async {
    emit(DiscoverLoading());
    final player = Player(id: "c3ca16f0-0092-4c47-b3a8-43b84b836652", name: "Anubhav Pathak", avatar: "");
    final result = await _initDiscoverUseCase.call((player, category));
    result.fold(
      (error) => emit(DiscoverError(error)),
      (discover) => emit(DiscoverLoaded(discover: discover)),
    );
  }

  void loadGame(StoryEntity story) async {
    final player = Player(id: "c3ca16f0-0092-4c47-b3a8-43b84b836652", name: "Anubhav Pathak", avatar: "");
    final result = await _loadGameUseCase.call((player, story));
    result.fold(
      (error) => emit(DiscoverError(error)),
      (game) {
        _navigatorKey.currentState?.pushNamed(
          Routes.game,
          arguments: game,
        );
      },
    );
  }

  void quickNavigateTo(String route) {
    _navigatorKey.currentState?.pushNamed(route);
  }
}
