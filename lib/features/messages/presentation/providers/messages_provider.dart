import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_monitor_viewer/features/messages/domain/entities/message.dart';
import 'package:whatsapp_monitor_viewer/features/messages/presentation/providers/messages_notifier.dart';

final messagesProvider = AsyncNotifierProvider<MessagesNotifier, List<Message>>(
  MessagesNotifier.new,
);
