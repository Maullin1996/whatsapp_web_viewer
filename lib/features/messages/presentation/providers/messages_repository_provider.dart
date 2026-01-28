import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_monitor_viewer/features/messages/data/datasources/messages_firestore_datasource.dart';
import 'package:whatsapp_monitor_viewer/features/messages/data/repositories/messages_repository_impl.dart';
import 'package:whatsapp_monitor_viewer/features/messages/domain/repositories/messages_repository.dart';
import 'package:whatsapp_monitor_viewer/features/messages/presentation/providers/firestore_providers.dart';

final messagesRepositoryProvider = Provider<MessagesRepository>((ref) {
  final firestore = ref.read(firestoreProvider);
  final datasource = MessagesFirestoreDatasource(firestore);
  return MessagesRepositoryImpl(datasource: datasource);
});
