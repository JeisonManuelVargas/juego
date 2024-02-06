import 'package:dartz/dartz.dart';
import 'package:adivinanza/core/errors/failure.dart';
import 'package:adivinanza/core/base/base_usecase.dart';
import 'package:adivinanza/features/login/domain/repositories/login_repository.dart';

class SignInEmailPasswordUseCase extends BaseUseCase<bool, SignInEmailPasswordParams> {
  SignInEmailPasswordUseCase({required this.loginRepository});

  final LoginRepository loginRepository;

  @override
  Future<Either<Failure, bool>> call(SignInEmailPasswordParams params) =>
      loginRepository.signInWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );
}

class SignInEmailPasswordParams {
  SignInEmailPasswordParams({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}
