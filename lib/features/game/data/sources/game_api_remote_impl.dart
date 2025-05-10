import 'dart:convert';

import 'package:thrive_client/core/utils/constant/urls.dart';
import 'package:thrive_client/features/discover/data/models/player.dart';
import 'package:thrive_client/features/game/data/models/choice.dart';
import 'package:thrive_client/features/game/data/models/game.dart';
import 'package:thrive_client/features/game/data/models/plot.dart';
import 'package:thrive_client/features/game/data/sources/game_api.dart';
import 'package:thrive_client/features/discover/data/models/story.dart';

import 'package:http/http.dart' as http;

class GameApiRemote implements IGameApi {
  String gameBaseUrl = '$baseUrl/game';

  @override
  Future<Plot> makeDecision(Player player, Story story, Choice decision) async {
    final response = await http.post(
      Uri.parse('$gameBaseUrl/next'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'playerId': player.id,
        'storyId': story.id,
        'choiceId': decision.id,
      }),
    );

    if (response.statusCode == 200) {
      final json = const JsonDecoder().convert(response.body);
      return Plot.fromJson(json["data"]);
    } else {
      throw Exception('Failed to load story');
    }
  }

  @override
  Future<Plot> goBack(Player player, Story story) async {
    final response = await http.post(
      Uri.parse('$gameBaseUrl/previous'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'playerId': player.id,
        'storyId': story.id,
      }),
    );
    if (response.statusCode == 200) {
      final json = const JsonDecoder().convert(response.body);
      return Plot.fromJson(json["data"]);
    } else {
      throw Exception('Failed to load story');
    }
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
