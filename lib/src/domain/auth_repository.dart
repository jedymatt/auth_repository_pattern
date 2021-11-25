import '../domain/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> signInWithEmailAndPassword(String email, String password);
  Future<void> signOut();
  Future<UserEntity> registerWithEmailAndPassword(
    String email,
    String password,
  );
}
