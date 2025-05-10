import 'dart:convert';

import 'package:thrive_client/core/utils/constant/urls.dart';
import 'package:thrive_client/features/discover/data/models/discover.dart';
import 'package:thrive_client/features/discover/data/models/player.dart';
import 'package:thrive_client/features/discover/data/models/story.dart';
import 'package:thrive_client/features/game/data/models/game.dart';
import 'package:thrive_client/features/discover/data/sources/discover_api.dart';

import 'package:http/http.dart' as http;

class DiscoverApiRemote implements IDiscoverApi {
  String discoverBaseUrl = '$baseUrl/discover';

  @override
  Future<Discover> init(Player player, String? category) async {
    try {
      final response = await http.post(
        Uri.parse('$discoverBaseUrl/init?category=$category'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'playerId': player.id,
        }),
      );
      if (response.statusCode == 200) {
        final json = const JsonDecoder().convert(response.body);
        final discoverData = Discover.fromJson(player, json["data"]);
        return discoverData;
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      throw Exception('Unexpected error occurred: $e');
    }
  }

  @override
  Future<Game> loadGame(Player player, Story story) async {
    final response = await http.post(
      Uri.parse('$discoverBaseUrl/game/${story.id}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'playerId': player.id,
      }),
    );
    if (response.statusCode == 200) {
      final json = const JsonDecoder().convert(response.body);
      final gameData = Game.fromJson(player, story, json);
      return gameData;
    } else {
      throw Exception(response.body);
    }
  }
}
