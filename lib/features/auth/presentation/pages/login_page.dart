import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome to MyApp', style: TextStyle(fontSize: 28)),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  authCubit.signInWithGoogle();
                },
                child: Text('Sign in with Google'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // navigate to email login/signup page (if separate)
                },
                child: Text('Sign in with Email'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
