import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:thrive_client/features/auth/domain/entities/user_entity.dart';
import 'package:thrive_client/features/auth/domain/repositories/auth_repository.dart';

class FirebaseAuthRepository implements IAuthRepository {
  final fb.FirebaseAuth _firebaseAuth;

  FirebaseAuthRepository({fb.FirebaseAuth? firebaseAuth}) : _firebaseAuth = firebaseAuth ?? fb.FirebaseAuth.instance;

  @override
  Future<UserEntity?> signIn(String email, String password) async {
    final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = userCredential.user;
    if (user != null) {
      return UserEntity(
        uid: user.uid,
        email: user.email ?? '',
        name: user.displayName ?? '',
        profile: user.photoURL ?? '',
      );
    }
    return null;
  }

  @override
  Future<UserEntity?> signUp(String email, String password) async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = userCredential.user;
    if (user != null) {
      return UserEntity(
        uid: user.uid,
        email: user.email ?? '',
        name: user.displayName ?? '',
        profile: user.photoURL ?? '',
      );
    }
    return null;
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<UserEntity?> getCurrentUser() async {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      return UserEntity(
        uid: user.uid,
        email: user.email ?? '',
        name: user.displayName ?? '',
        profile: user.photoURL ?? '',
      );
    }
    return null;
  }
}
