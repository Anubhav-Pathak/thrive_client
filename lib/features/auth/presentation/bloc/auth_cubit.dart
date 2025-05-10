import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thrive_client/features/auth/domain/repositories/auth_repository.dart';
import 'package:thrive_client/features/auth/domain/repositories/profile_repository.dart';
import 'package:thrive_client/features/auth/presentation/bloc/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final IAuthRepository authRepository;
  final IProfileRepository profileRepository;

  AuthCubit(this.authRepository, this.profileRepository) : super(AuthInitial());

  Future<void> checkAuthStatus() async {
    final user = await authRepository.getCurrentUser();
    if (user != null) {
      final hasProfile = await profileRepository.hasUserProfile(user.uid);
      if (hasProfile) {
        emit(AuthAuthenticated(user));
      } else {
        emit(AuthProfileIncomplete(user));
      }
    } else {
      emit(AuthUnauthenticated());
    }
  }

  Future<void> signInWithGoogle() async {
    emit(AuthLoading());
    try {
      final user = await authRepository.signInWithGoogle();
      final hasProfile = await profileRepository.hasUserProfile(user.uid);
      if (hasProfile) {
        emit(AuthAuthenticated(user));
      } else {
        emit(AuthProfileIncomplete(user));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> signOut() async {
    await authRepository.signOut();
    emit(AuthUnauthenticated());
  }
}
