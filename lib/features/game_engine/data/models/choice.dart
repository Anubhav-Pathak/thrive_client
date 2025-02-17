import 'package:thrive_client/features/game_engine/data/models/plot.dart';
import 'package:thrive_client/features/game_engine/domain/entities/choice_entity.dart';

class Choice extends ChoiceEntity {
  Choice({
    required super.id,
    required super.name,
    Plot? nextPlot,
  }) {
    this.nextPlot = nextPlot;
  }

  @override
  factory Choice.fromJson(Map<String, dynamic> json) {
    return Choice(
      id: json['id'],
      name: json['name'],
      nextPlot:
          json['nextPlot'] != null ? Plot.fromJson(json['nextPlot']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'nextPlot': nextPlot?.toJson(),
    };
  }
}
