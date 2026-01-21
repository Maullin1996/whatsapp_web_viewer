import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:whatsapp_monitor_viewer/core/errors/failure.dart';
import 'package:whatsapp_monitor_viewer/core/errors/firestore_failure.dart';
import 'package:whatsapp_monitor_viewer/features/chats/domain/entities/chat.dart';

class ChatsFirestoreDatasource {
  final _db = FirebaseFirestore.instance;

  Future<Either<Failure, List<Chat>>> fetchChats() async {
    try {
      final snapshot = await _db
          .collection('whatsapp_uploads')
          .orderBy('messageTimestamp', descending: true)
          .limit(200)
          .get();

      final Map<String, Chat> map = {};

      for (final doc in snapshot.docs) {
        final data = doc.data();

        final groupJid = data['groupJid'] as String;
        final groupName = data['groupName'] as String;
        final ts = data['messageTimestamp'] as int;

        if (!map.containsKey(groupJid)) {
          map[groupJid] = Chat(
            groupJid: groupJid,
            groupName: groupName,
            lastMessageAt: ts,
            count: 1,
          );
        } else {
          final old = map[groupJid]!;
          map[groupJid] = Chat(
            groupJid: old.groupJid,
            groupName: old.groupName,
            lastMessageAt: old.lastMessageAt,
            count: old.count + 1,
          );
        }
      }

      return Right(
        map.values.toList()
          ..sort((a, b) => b.lastMessageAt.compareTo(a.lastMessageAt)),
      );
    } catch (e) {
      return Left(mapFirestoreError(e));
    }
  }
}
