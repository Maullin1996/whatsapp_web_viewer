import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_monitor_viewer/features/chats/domain/entities/chat.dart';
import 'package:whatsapp_monitor_viewer/features/chats/presentation/provider/chats_notifier.dart';

final chatsProvider = AsyncNotifierProvider<ChatsNotifier, List<Chat>>(
  ChatsNotifier.new,
);
