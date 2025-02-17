import 'package:flutter/material.dart';
import 'package:thrive_client/features/game_engine/domain/entities/choice_entity.dart';
import 'package:thrive_client/features/game_engine/domain/entities/game_entity.dart';

class MainGame extends StatelessWidget {
  const MainGame({super.key, required this.game});

  final GameEntity game;

  @override
  Widget build(BuildContext context) {
    void onPressMenu() {
      // TODO: Implement onPressMenu
    }

    void onTapDecision(ChoiceEntity decision) {
      // TODO: Implement onTapDecision
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Story Title"),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu_rounded),
            onPressed: onPressMenu,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              child: const Text("Story Text"),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8),
                child: game.currentPlot.choices != null &&
                        game.currentPlot.choices!.isNotEmpty
                    ? ListView(
                        children: game.currentPlot.choices!
                            .map((ChoiceEntity decision) => ListTile(
                                  title: Text(decision.name),
                                  onTap: () => onTapDecision(decision),
                                ))
                            .toList(),
                      )
                    : const Center(
                        child: Text("You have reached the end of the story."),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
