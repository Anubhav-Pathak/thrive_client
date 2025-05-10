import 'dart:convert';

import 'package:thrive_client/core/utils/constant/urls.dart';
import 'package:thrive_client/features/discover/data/models/discover.dart';
import 'package:thrive_client/features/discover/data/models/player.dart';
import 'package:thrive_client/features/discover/data/models/story.dart';
import 'package:thrive_client/features/game/data/models/game.dart';
import 'package:thrive_client/features/discover/data/sources/discover_api.dart';

import 'package:flutter/services.dart' show rootBundle;

class DiscoverApiLocal implements IDiscoverApi {
  String discoverBaseUrl = '$baseUrl/discover';

  @override
  Future<Discover> init(Player player, String? category) async {
    try {
      final String response = await rootBundle.loadString('assets/data/discover.json');
      final json = const JsonDecoder().convert(response);
      final discoverData = Discover.fromJson(player, json["data"]);
      return Discover(
        player: discoverData.player,
        stories: discoverData.stories,
      );
    } catch (e) {
      throw Exception('Unexpected error occurred: $e');
    }
  }

  @override
  Future<Game> loadGame(Player player, Story story) async {
    try {
      final String response = await rootBundle.loadString('assets/data/game.json');
      final json = const JsonDecoder().convert(response);
      return Game.fromJson(player, story, json["data"]);
    } catch (e) {
      throw Exception('Unexpected error occurred: $e');
    }
  }
}
