import 'package:thrive_client/features/auth/domain/entities/user_entity.dart';

abstract class IAuthRepository {
  Future<UserEntity?> signIn(String email, String password);
  Future<UserEntity?> signUp(String email, String password);
  Future<void> signOut();
  Future<UserEntity?> getCurrentUser();
}
