import 'package:cloud_firestore/cloud_firestore.dart';

//lib/feature/chats/data/datasources/chats_firestore_datasource.dart
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

  Stream<Map<String, dynamic>> listenNewMessages() {
    return _db
        .collection('whatsapp_messages')
        .orderBy('messageTimestamp', descending: true)
        .snapshots()
        .expand((snapshot) => snapshot.docChanges)
        .where((c) => c.type == DocumentChangeType.added)
        .map((c) => c.doc.data()!);
  }
}
