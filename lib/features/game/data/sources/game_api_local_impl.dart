import 'dart:convert';
import 'dart:math';

import 'package:thrive_client/features/discover/data/models/player.dart';
import 'package:thrive_client/features/game/data/models/choice.dart';
import 'package:thrive_client/features/game/data/models/game.dart';
import 'package:thrive_client/features/game/data/models/plot.dart';
import 'package:thrive_client/features/game/data/sources/game_api.dart';
import 'package:thrive_client/features/discover/data/models/story.dart';

import 'package:flutter/services.dart' show rootBundle;

class GameApiLocal implements IGameApi {
  @override
  Future<Plot> makeDecision(Player player, Story story, Choice decision) async {
    final String response = await rootBundle.loadString('assets/data/plots.json');
    final json = const JsonDecoder().convert(response);
    final random = Random();
    final randomIndex = random.nextInt(json.length);
    return Plot.fromJson(json[randomIndex]);
  }

  @override
  Future<Plot> goBack(Player player, Story story) async {
    final String response = await rootBundle.loadString('assets/data/plots.json');
    final json = const JsonDecoder().convert(response);
    final random = Random();
    final randomIndex = random.nextInt(json.length);
    return Plot.fromJson(json[randomIndex]);
  }

  @override
  Future<Game> restart() {
    // TODO: implement restart
    throw UnimplementedError();
  }

  @override
  void exit() {
    // TODO: implement exit
    throw UnimplementedError();
  }
}
