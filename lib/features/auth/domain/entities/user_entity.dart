class UserEntity {
  final String uid;
  final String email;
  final String name;
  final String profile;
  String? age;
  String? gender;

  UserEntity({
    required this.uid,
    required this.email,
    required this.name,
    required this.profile,
  });
}
