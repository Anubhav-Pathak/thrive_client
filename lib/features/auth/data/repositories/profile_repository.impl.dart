// data/repositories/profile_repository_impl.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements IProfileRepository {
  final FirebaseFirestore _firestore;

  ProfileRepositoryImpl({FirebaseFirestore? firestore}) : _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Future<bool> hasUserProfile(String uid) async {
    try {
      final doc = await _firestore.collection('users').doc(uid).get();
      final data = doc.data();
      return data != null && data.containsKey('age') && data.containsKey('gender');
    } catch (e) {
      throw Exception('Failed to check profile: $e');
    }
  }

  @override
  Future<void> saveUserProfile({
    required String uid,
    required int age,
    required String gender,
  }) async {
    try {
      await _firestore.collection('users').doc(uid).set({
        'age': age,
        'gender': gender,
      }, SetOptions(merge: true));
    } catch (e) {
      throw Exception('Failed to save profile: $e');
    }
  }
}
