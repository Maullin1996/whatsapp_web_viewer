import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:whatsapp_monitor_viewer/core/errors/failure.dart';
import 'package:whatsapp_monitor_viewer/core/errors/firestore_failure.dart';
import 'package:whatsapp_monitor_viewer/features/messages/data/models/raw_message_model.dart';

class MessagesFirestoreDatasource {
  final FirebaseFirestore _db;

  const MessagesFirestoreDatasource(this._db);

  Future<Either<Failure, List<RawMessageModel>>> fetchMessages(
    String chatJid,
  ) async {
    try {
      final snapshot = await _db
          .collection('whatsapp_messages')
          .where('chatJid', isEqualTo: chatJid)
          .orderBy('messageTimestamp', descending: true)
          .limit(50)
          .get();
      final messages = snapshot.docs.map((doc) {
        final data = doc.data();
        return RawMessageModel(
          id: doc.id,
          senderName: data['senderName'] as String,
          caption: data['caption'] as String?,
          storagePath: data['storagePath'] as String?,
          hasMedia: data['hasMedia'] as bool,
          messageTimestamp: data['messageTimestamp'] as int,
        );
      }).toList();
      return Right(messages);
    } catch (e) {
      return Left(mapFirestoreError(e));
    }
  }
}
