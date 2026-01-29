import 'package:whatsapp_monitor_viewer/features/messages/domain/entities/image_view_item.dart';

int findInitialIndex({
  required List<ImageViewItem> items,
  required String storagePath,
}) {
  final i = items.indexWhere((path) => path.storagePath == storagePath);
  return i < 0 ? 0 : i;
}
