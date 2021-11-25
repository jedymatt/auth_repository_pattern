import 'package:auth_repository_pattern/src/domain/user_entity.dart';
import 'package:auth_repository_pattern/src/domain/auth_repository.dart';
import 'package:flutter/material.dart';

enum AuthState {
  signIn,
  signOut,
}

class AuthModel extends ChangeNotifier {
  final AuthRepository userRepository;
  AuthState authState;

  AuthModel(this.userRepository, {this.authState = AuthState.signIn});

  Future<UserEntity> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final userEntity =
        await userRepository.signInWithEmailAndPassword(email, password);
    authState = AuthState.signIn;
    notifyListeners();
    return userEntity;
  }
}
