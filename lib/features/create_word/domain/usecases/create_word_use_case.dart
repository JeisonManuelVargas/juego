import 'package:dartz/dartz.dart';
import 'package:adivinanza/core/errors/failure.dart';
import 'package:adivinanza/core/base/base_usecase.dart';
import 'package:adivinanza/features/create_word/domain/repositories/create_word_repository.dart';

class CreateWordUseCase extends BaseUseCase<bool?, String> {
  CreateWordUseCase({required this.createWordRepository});

  final CreateWordRepository createWordRepository;

  @override
  Future<Either<Failure, bool?>> call(String params) =>
      createWordRepository.createWord(text: params);
}
