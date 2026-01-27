import 'package:cloud_firestore/cloud_firestore.dart';

class ChatsFirestoreDatasource {
  final FirebaseFirestore _db;

  const ChatsFirestoreDatasource(this._db);

  Future<List<Map<String, dynamic>>> fetchChats({int limit = 200}) async {
    final snapshot = await _db
        .collection('whatsapp_messages')
        .orderBy('messageTimestamp', descending: true)
        .limit(limit)
        .get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }
}
