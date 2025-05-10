import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thrive_client/features/game/domain/entities/game_entity.dart';
import 'package:thrive_client/features/game/presentation/bloc/game_cubit.dart';
import 'package:thrive_client/features/game/presentation/widgets/game_view.dart';

class GamePage extends StatelessWidget {
  const GamePage({
    super.key,
    required this.game,
  });

  final GameEntity game;

  @override
  Widget build(BuildContext context) {
    void onPressMenu() {
      // TODO: Implement onPressMenu
    }

    void onTapHint() {
      // TODO: Implement onTapHint
    }

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GameCubit(game: game),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(game.story.title),
          actions: [
            IconButton(
              icon: const Icon(Icons.menu_rounded),
              onPressed: onPressMenu,
            ),
          ],
        ),
        body: GameView(game: game),
        floatingActionButton: FloatingActionButton(
          onPressed: onTapHint,
          child: Icon(
            Icons.question_mark_outlined,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
      ),
    );
  }
}
