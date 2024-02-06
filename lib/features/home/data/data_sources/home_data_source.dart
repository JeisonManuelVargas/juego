import 'package:cloud_firestore/cloud_firestore.dart';

abstract class HomeDataSource {
  Future<Stream<QuerySnapshot>> getWord();
}

class HomeDataSourceImpl implements HomeDataSource {
  final FirebaseFirestore db;
  final String userCollection = 'users';

  HomeDataSourceImpl({required this.db});

  @override
  Future<Stream<QuerySnapshot>> getWord() async {
    return db.collection("word").snapshots();
  }
}
