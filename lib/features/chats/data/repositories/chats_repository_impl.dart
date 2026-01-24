import 'package:dartz/dartz.dart';
import 'package:whatsapp_monitor_viewer/core/errors/failure.dart';
import 'package:whatsapp_monitor_viewer/features/chats/data/datasources/chats_firestore_datasource.dart';
import 'package:whatsapp_monitor_viewer/features/chats/domain/entities/chat.dart';
import 'package:whatsapp_monitor_viewer/features/chats/domain/repositories/chats_repository.dart';

class ChatsRepositoryImpl implements ChatsRepository {
  final ChatsFirestoreDatasource datasource;

  const ChatsRepositoryImpl(this.datasource);
  @override
  Future<Either<Failure, List<Chat>>> getChats() {
    return datasource.fetchChats();
  }
}
