import 'package:dartz/dartz.dart';
import 'package:whatsapp_monitor_viewer/core/errors/failure.dart';
import 'package:whatsapp_monitor_viewer/features/chats/domain/entities/chat.dart';

abstract class ChatsRepository {
  Future<Either<Failure, List<Chat>>> getChats();
}
