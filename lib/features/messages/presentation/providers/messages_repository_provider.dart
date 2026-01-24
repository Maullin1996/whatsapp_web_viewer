import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_monitor_viewer/features/messages/data/repositories/messages_repository_impl.dart';
import 'package:whatsapp_monitor_viewer/features/messages/presentation/providers/firestore_providers.dart';
import 'package:whatsapp_monitor_viewer/features/messages/presentation/providers/storage_providers.dart';

final messagesRepositoryProvider = Provider<MessagesRepositoryImpl>((ref) {
  return MessagesRepositoryImpl(
    firestoreDatasource: ref.watch(messagesFirestoreDatasourceProvider),
    storageDatasource: ref.watch(storageDatasourceProvider),
  );
});
