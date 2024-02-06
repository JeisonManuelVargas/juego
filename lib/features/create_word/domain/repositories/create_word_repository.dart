import 'package:dartz/dartz.dart';
import 'package:adivinanza/core/errors/failure.dart';

abstract class CreateWordRepository {
  Future<Either<Failure, bool>> createWord({
    required String text
  });
}
