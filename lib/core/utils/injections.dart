import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:thrive_client/features/discover/discover_injections.dart';
import 'package:thrive_client/features/game/game_injections.dart';

final locator = GetIt.instance;

Future<void> initInjections() async {
  final globalNavigatorKey = GlobalKey<NavigatorState>();
  locator.registerSingleton<GlobalKey<NavigatorState>>(globalNavigatorKey);

  await initDiscoverInjections();
  await initGameInjections();
}
