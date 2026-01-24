import 'package:dartz/dartz.dart';
import 'package:whatsapp_monitor_viewer/core/errors/failure.dart';
import 'package:whatsapp_monitor_viewer/features/messages/domain/entities/message.dart';

abstract class MessagesRepository {
  Future<Either<Failure, List<Message>>> getMessages(String chatJid);
}
