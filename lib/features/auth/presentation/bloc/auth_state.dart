import 'package:thrive_client/features/auth/domain/entities/user_entity.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthUnauthenticated extends AuthState {}

class AuthAuthenticated extends AuthState {
  final UserEntity user;

  AuthAuthenticated(this.user);
}

class AuthProfileIncomplete extends AuthState {
  final UserEntity user;

  AuthProfileIncomplete(this.user);
}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}
