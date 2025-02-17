import 'package:get_it/get_it.dart';
import 'package:thrive_client/features/game_engine/game_engine_injections.dart';

final locator = GetIt.instance;

Future<void> initInjections() async {
  await initGameEngineInjections();
}
