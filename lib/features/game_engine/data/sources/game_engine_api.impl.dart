import 'dart:convert';

import 'package:thrive_client/core/utils/constant/urls.dart';
import 'package:thrive_client/features/game_engine/data/models/choice.dart';
import 'package:thrive_client/features/game_engine/data/models/game.dart';
import 'package:thrive_client/features/game_engine/data/models/plot.dart';
import 'package:thrive_client/features/game_engine/data/sources/game_engine_api.dart';
import 'package:thrive_client/features/discover/data/models/player.dart';
import 'package:thrive_client/features/discover/data/models/story.dart';

import 'package:http/http.dart' as http;

class GameEngineApi implements IGameEngineApi {
  String gameBaseUrl = '$baseUrl/game';

  @override
  Future<Game> init(Player player, Story story) async {
    final body = json.encode({
      'player_id': player.id,
      'story_id': story.id,
    });
    try {
      final response = await http.post(
        Uri.parse('$gameBaseUrl/init'),
        body: body,
      );
      if (response.statusCode == 200) {
        final plotData = const JsonDecoder().convert(response.body);
        return Game(
          player: player,
          story: story,
          currentPlot: Plot.fromJson(plotData['current_plot']),
        );
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      throw Exception('Unexpected error occurred: $e');
    }
  }

  @override
  Future<Story> makeDecision(Choice decision) {
    // TODO: implement makeDecision
    throw UnimplementedError();
  }

  @override
  Future<Story> goBack() {
    // TODO: implement goBack
    throw UnimplementedError();
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
