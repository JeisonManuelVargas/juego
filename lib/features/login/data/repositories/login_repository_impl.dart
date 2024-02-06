import 'package:dartz/dartz.dart';
import 'package:adivinanza/core/errors/failure.dart';
import 'package:adivinanza/core/errors/exceptions.dart';
import 'package:adivinanza/features/login/data/data_sources/login_data_source.dart';
import 'package:adivinanza/features/login/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  LoginRepositoryImpl({required this.loginDataSource});

  final LoginDataSource loginDataSource;


  @override
  Future<Either<Failure, bool>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final result = await loginDataSource.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(result);
    } on LoginException catch (e) {
      return Left(LoginFailure(code: e.code));
    }
  }

}
