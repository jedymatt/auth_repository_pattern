import 'package:firebase_auth/firebase_auth.dart';

import '../domain/user_entity.dart';
import '../domain/auth_repository.dart';

class FirebaseAuthService implements AuthRepository {
  final FirebaseAuth firebaseAuth;

  const FirebaseAuthService(this.firebaseAuth);

  @override
  Future<UserEntity> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final firebaseUser = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return UserEntity(
      uid: firebaseUser.user!.uid,
      displayName: firebaseUser.user!.displayName,
      photoUrl: firebaseUser.user!.photoURL,
    );
  }

  @override
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  @override
  Future<UserEntity> registerWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final firebaseUser = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    return UserEntity(
      uid: firebaseUser.user!.uid,
      displayName: firebaseUser.user!.displayName,
      photoUrl: firebaseUser.user!.photoURL,
    );
  }
}
