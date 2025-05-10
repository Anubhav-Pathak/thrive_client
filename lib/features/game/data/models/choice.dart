import 'package:thrive_client/features/game/data/models/plot.dart';
import 'package:thrive_client/features/game/domain/entities/choice_entity.dart';

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
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
