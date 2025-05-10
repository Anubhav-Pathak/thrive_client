abstract class IProfileRepository {
  Future<bool> hasUserProfile(String uid);
  Future<void> saveUserProfile({
    required String uid,
    required int age,
    required String gender,
  });
}
