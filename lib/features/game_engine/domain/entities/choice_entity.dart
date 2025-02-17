import 'package:thrive_client/features/game_engine/data/models/plot.dart';

abstract class ChoiceEntity {
  final String id;
  final String name;
  Plot? _nextPlot;

  Plot? get nextPlot => _nextPlot;
  set nextPlot(Plot? value) => _nextPlot = value;

  ChoiceEntity({required this.id, required this.name});
}
