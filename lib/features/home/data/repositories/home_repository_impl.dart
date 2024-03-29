import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:adivinanza/core/errors/failure.dart';
import 'package:adivinanza/core/errors/exceptions.dart';
import 'package:adivinanza/features/home/data/data_sources/home_data_source.dart';
import 'package:adivinanza/features/home/domain/repositories/home_auth_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl({required this.homeDataSource});

  final HomeDataSource homeDataSource;

  @override
  Future<Either<Failure, Stream<QuerySnapshot>>> getWord() async {
    try {
      final result = await homeDataSource.getWord();
      return Right(result);
    } on HomeException catch (e) {
      return Left(HomeFailure(code: e.code));
    }
  }

}
