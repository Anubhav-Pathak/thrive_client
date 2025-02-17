import 'package:thrive_client/features/discover/domain/entities/player_entity.dart';

class Player extends PlayerEntity {
  Player({
    required super.id,
    required super.name,
    required super.avatar,
  });

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      id: json['id'],
      name: json['name'],
      avatar: json['avatar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'avatar': avatar,
    };
  }
}
