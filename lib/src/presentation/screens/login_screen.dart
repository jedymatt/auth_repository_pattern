// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:auth_repository_pattern/src/presentation/provider/auth_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailField = TextEditingController();
  final passwordField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AutofillGroup(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: emailField,
                  autofillHints: [AutofillHints.email],
                  decoration: InputDecoration(
                    label: Text('Email'),
                    border: OutlineInputBorder(),
                    // hintText: 'email@domain.com',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: passwordField,
                  obscureText: true,
                  autofillHints: [AutofillHints.password],
                  decoration: InputDecoration(
                    label: Text('Password'),
                    border: OutlineInputBorder(),
                    // hintText: 'password',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () async {
                    final currentUser = await context
                        .read<AuthModel>()
                        .userRepository
                        .signInWithEmailAndPassword(
                          emailField.text,
                          passwordField.text,
                        );

                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return ListView(
                          children: [
                            Text(currentUser.uid),
                            Text(currentUser.displayName!),
                          ],
                        );
                      },
                    );
                  },
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: Center(
                      child: Text(
                        'Login',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
