import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_monitor_viewer/features/messages/data/datasources/storage_datasource.dart';

final firebaseStorageProvider = Provider<FirebaseStorage>(
  (_) => FirebaseStorage.instance,
);

final storageDatasourceProvider = Provider<StorageDatasource>((ref) {
  final storage = ref.watch(firebaseStorageProvider);
  return StorageDatasource(storage);
});
