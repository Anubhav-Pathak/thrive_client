// splash_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thrive_client/features/auth/presentation/bloc/auth_cubit.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthLoading || state is AuthInitial) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (state is AuthAuthenticated) {
          return DiscoverPage();
        } else if (state is AuthProfileIncomplete) {
          return SignupFormScreen(user: state.user);
        } else {
          return AuthScreen();
        }
      },
    );
  }
}
