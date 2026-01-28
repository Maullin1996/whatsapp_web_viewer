import 'package:whatsapp_monitor_viewer/features/messages/domain/entities/message.dart';

class MessagesPage {
  final List<Message> items;
  final Object? nextCursor;

  MessagesPage({required this.items, required this.nextCursor});

  bool get isEmpty => items.isEmpty;
}
