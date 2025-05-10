import 'package:thrive_client/features/auth/domain/entities/user_entity.dart';

class User extends UserEntity {
  User({
    required super.uid,
    required super.email,
    required super.name,
    required super.profile,
    String? age,
    String? gender,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uid: json['uid'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      profile: json['profile'] as String,
      age: json['age'] as String?,
      gender: json['gender'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'profile': profile,
    };
  }
}
