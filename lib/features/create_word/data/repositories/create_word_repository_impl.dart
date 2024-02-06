import 'package:adivinanza/core/errors/exceptions.dart';
import 'package:adivinanza/features/create_word/data/data_sources/create_word_data_source.dart';
import 'package:adivinanza/features/create_word/domain/repositories/create_word_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:adivinanza/core/errors/failure.dart';

class CreateWordRepositoryImpl implements CreateWordRepository {
  CreateWordRepositoryImpl({required this.createWordDataSource});

  final CreateWordDataSource createWordDataSource;


  @override
  Future<Either<Failure, bool>> createWord({
    required String text
  }) async {
    try {
      final result = await createWordDataSource.createWord(
        text: text,
      );
      return Right(result);
    } on CreateWordException catch (e) {
      return Left(CreateWordFailure(code: e.code));
    }
  }

}
