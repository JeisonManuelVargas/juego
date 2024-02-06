import 'package:dartz/dartz.dart';
import 'package:adivinanza/core/errors/failure.dart';
import 'package:adivinanza/core/model/user_model.dart';

abstract class LoginRepository {
  Future<Either<Failure, bool>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
}
