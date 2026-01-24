import 'package:dartz/dartz.dart';
import 'package:whatsapp_monitor_viewer/core/errors/failure.dart';
import 'package:whatsapp_monitor_viewer/features/messages/data/datasources/messages_firestore_datasource.dart';
import 'package:whatsapp_monitor_viewer/features/messages/data/datasources/storage_datasource.dart';
import 'package:whatsapp_monitor_viewer/features/messages/data/models/raw_message_model.dart';
import 'package:whatsapp_monitor_viewer/features/messages/domain/entities/message.dart';
import 'package:whatsapp_monitor_viewer/features/messages/domain/repositories/messages_repository.dart';

class MessagesRepositoryImpl implements MessagesRepository {
  final MessagesFirestoreDatasource firestoreDatasource;
  final StorageDatasource storageDatasource;

  const MessagesRepositoryImpl({
    required this.firestoreDatasource,
    required this.storageDatasource,
  });

  @override
  Future<Either<Failure, List<Message>>> getMessages(String chatJid) async {
    final result = await firestoreDatasource.fetchMessages(chatJid);

    return result.fold(Left.new, (List<RawMessageModel> rawMessages) async {
      final List<Message> messages = [];

      for (final raw in rawMessages) {
        String? imageUrl;
        if (raw.hasMedia && raw.storagePath != null) {
          imageUrl = await storageDatasource.getDownloadUrl(raw.storagePath!);
        }

        messages.add(
          Message(
            id: raw.id,
            senderName: raw.senderName,
            caption: raw.caption,
            imageUrl: imageUrl,
            hasMedia: raw.hasMedia,
            messageTimestamp: raw.messageTimestamp,
          ),
        );
      }
      return Right(messages);
    });
  }
}
