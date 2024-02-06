import 'package:dartz/dartz.dart';
import 'package:adivinanza/core/errors/failure.dart';

abstract class BaseUseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {}
