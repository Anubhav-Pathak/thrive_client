import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thrive_client/features/auth/domain/repositories/profile_repository.dart';
import 'package:thrive_client/features/auth/presentation/bloc/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final IProfileRepository profileRepository;

  ProfileCubit(this.profileRepository) : super(ProfileInitial());

  Future<void> submitProfile(String uid, int age, String gender) async {
    emit(ProfileLoading());
    try {
      await profileRepository.saveUserProfile(
        uid: uid,
        age: age,
        gender: gender,
      );
      emit(ProfileCompleted());
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}
