import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:adivinanza/core/errors/exceptions.dart';
import 'package:adivinanza/core/model/user_model.dart';

abstract class LoginDataSource {
  Future<bool> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
}

class LoginDataSourceImpl implements LoginDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore db;
  final String userCollection = 'users';

  LoginDataSourceImpl({
    required this.db,
    required this.auth,
  });

  @override
  Future<bool> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return true;
    } on FirebaseAuthException catch (e) {
      throw LoginException(code: e.message!);
    }
  }
}
