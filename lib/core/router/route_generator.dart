import 'package:flutter/material.dart';
import 'package:thrive_client/core/router/error_page.dart';
import 'package:thrive_client/core/router/routes.dart';
import 'package:thrive_client/features/discover/presentation/pages/discover.dart';
import 'package:thrive_client/features/game_engine/domain/entities/game_entity.dart';
import 'package:thrive_client/features/game_engine/presentation/pages/main_game.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.discover:
        return MaterialPageRoute(
          builder: (_) => const Discover(),
        );
      case Routes.game:
        if (args is GameEntity) {
          return MaterialPageRoute(
            builder: (_) => MainGame(game: args),
          );
        }
        return MaterialPageRoute(
          builder: (_) => const ErrorPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const ErrorPage(
            errorMessage: "Page not found",
          ),
        );
    }
  }
}
