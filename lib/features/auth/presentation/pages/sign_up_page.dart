import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thrive_client/features/auth/domain/entities/user_entity.dart';

class SignUpPage extends StatefulWidget {
  final UserEntity user;

  const SignUpPage({Key? key, required this.user}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  int? _age;
  String? _gender;

  @override
  Widget build(BuildContext context) {
    final profileCubit = context.read<ProfileCubit>();

    return Scaffold(
      appBar: AppBar(title: Text('Complete your Profile')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text('Hello, ${widget.user.email}', style: TextStyle(fontSize: 20)),
              SizedBox(height: 30),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Age'),
                validator: (value) => value!.isEmpty ? 'Enter age' : null,
                onSaved: (value) => _age = int.parse(value!),
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: _gender,
                items: ['Male', 'Female', 'Other'].map((g) => DropdownMenuItem(value: g, child: Text(g))).toList(),
                decoration: InputDecoration(labelText: 'Gender'),
                onChanged: (value) => setState(() => _gender = value),
                validator: (value) => value == null ? 'Select gender' : null,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    await profileCubit.submitProfile(
                      widget.user.uid,
                      _age!,
                      _gender!,
                    );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => AppDetailsSplashScreen()),
                    );
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
