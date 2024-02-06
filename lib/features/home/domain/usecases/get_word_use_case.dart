import 'package:dartz/dartz.dart';
import 'package:adivinanza/core/errors/failure.dart';
import 'package:adivinanza/core/base/base_usecase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:adivinanza/features/home/domain/repositories/home_auth_repository.dart';

class GetWordUseCase extends BaseUseCase<Stream<QuerySnapshot>, NoParams> {
  GetWordUseCase({required this.homeRepository});

  final HomeRepository homeRepository;
  @override
  Future<Either<Failure, Stream<QuerySnapshot>>> call(NoParams params) =>
      homeRepository.getWord();
}
