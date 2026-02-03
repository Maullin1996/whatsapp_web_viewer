import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_monitor_viewer/features/messages/presentation/providers/storage_providers.dart';

final imageUrlProvider = Provider.family<String, String>((ref, path) {
  final storage = ref.read(storageDatasourceProvider);
  return storage.getDownloadUrl(path);
});
