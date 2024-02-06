import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:adivinanza/core/errors/failure.dart';

abstract class HomeRepository {
  Future<Either<Failure, Stream<QuerySnapshot>>> getWord();
}
