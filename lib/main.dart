// ignore_for_file: prefer_const_constructors

import 'package:auth_repository_pattern/src/data/firebase_auth_service.dart';
import 'package:auth_repository_pattern/src/presentation/provider/auth_model.dart';
import 'package:auth_repository_pattern/src/presentation/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthModel(FirebaseAuthService(firebaseAuth)),
        )
      ],
      child: MaterialApp(
        home: LoginScreen(),
      ),
    );
  }
}
