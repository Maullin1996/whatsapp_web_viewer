import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:whatsapp_monitor_viewer/core/errors/failure.dart';
import 'package:whatsapp_monitor_viewer/features/messages/data/datasources/messages_firestore_datasource.dart';
import 'package:whatsapp_monitor_viewer/features/messages/domain/entities/message.dart';
import 'package:whatsapp_monitor_viewer/features/messages/domain/entities/messages_page.dart';
import 'package:whatsapp_monitor_viewer/features/messages/domain/repositories/messages_repository.dart';

class MessagesRepositoryImpl implements MessagesRepository {
  final MessagesFirestoreDatasource datasource;

  const MessagesRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, MessagesPage>> fetchInitial({
    required String chatJid,
    int limit = 50,
  }) async {
    final result = await datasource.fetchInitial(
      chatJid: chatJid,
      limit: limit,
    );

    return result.map(
      (page) => MessagesPage(
        items: page.items
            .map(
              (raw) => Message(
                id: raw.id,
                senderName: raw.senderName,
                hasMedia: raw.hasMedia,
                messageTimestamp: raw.messageTimestamp,
                chatJid: raw.chatJid,
                caption: raw.caption,
                storagePath: raw.storagePath,
                localTime: raw.localTime,
                shiftName: raw.shiftName,
              ),
            )
            .toList(),
        nextCursor: page.lastDoc,
      ),
    );
  }

  @override
  Future<Either<Failure, MessagesPage>> fetchNext({
    required String chatJid,
    required Object cursor,
    int limit = 50,
  }) async {
    final result = await datasource.fetchNext(
      chatJid: chatJid,
      lastDoc: cursor as DocumentSnapshot,
      limit: limit,
    );

    return result.map(
      (page) => MessagesPage(
        items: page.items
            .map(
              (raw) => Message(
                id: raw.id,
                senderName: raw.senderName,
                hasMedia: raw.hasMedia,
                messageTimestamp: raw.messageTimestamp,
                chatJid: raw.chatJid,
                caption: raw.caption,
                storagePath: raw.storagePath,
                localTime: raw.localTime,
                shiftName: raw.shiftName,
              ),
            )
            .toList(),
        nextCursor: page.lastDoc,
      ),
    );
  }
}
