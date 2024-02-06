import 'package:adivinanza/core/errors/exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class CreateWordDataSource {
  Future<bool> createWord({
    required String text,
  });
}

class CreateWordDataSourceImpl implements CreateWordDataSource {
  final FirebaseFirestore firestore;
  final String wordController = "word";

  CreateWordDataSourceImpl({required this.firestore});

  @override
  Future<bool> createWord({
    required String text,
  }) async {
    try {
      final data = await firestore.collection(wordController).get();
      firestore.collection(wordController).doc(data.docs[0].id).update({"text": text});
      return true;
    } on FirebaseException catch (e) {
      throw CreateWordException(code: e.message!);
    }
  }
}
