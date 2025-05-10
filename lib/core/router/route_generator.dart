import 'package:flutter/material.dart';
import 'package:thrive_client/core/router/error_page.dart';
import 'package:thrive_client/core/router/routes.dart';
import 'package:thrive_client/features/category/presentation/pages/category_page.dart';
import 'package:thrive_client/features/discover/presentation/pages/discover_page.dart';
import 'package:thrive_client/features/game/domain/entities/game_entity.dart';
import 'package:thrive_client/features/game/presentation/pages/game_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.discover:
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => DiscoverPage(category: args),
          );
        }
        return MaterialPageRoute(
          builder: (_) => const DiscoverPage(category: null),
        );
      case Routes.category:
        return MaterialPageRoute(
          builder: (_) => CategoryPage(),
        );
      case Routes.profile:
        return MaterialPageRoute(
          builder: (_) => const ErrorPage(
            errorMessage: "Profile page not found",
          ),
        );
      case Routes.prelude:
        return MaterialPageRoute(
          builder: (_) => const ErrorPage(
            errorMessage: "Story page not found",
          ),
        );
      case Routes.game:
        if (args is GameEntity) {
          return MaterialPageRoute(
            builder: (_) => GamePage(game: args),
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
