import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_monitor_viewer/features/chats/domain/entities/chat.dart';

//lib/feature/chats/presentation/provider/active_chat_provider.dart
class ActiveChatProvider extends Notifier<Chat?> {
  @override
  Chat? build() => null;

  void select(Chat chat) {
    state = chat;
  }

  void clear() {
    state = null;
  }
}

final activeChatProvider = NotifierProvider<ActiveChatProvider, Chat?>(
  ActiveChatProvider.new,
);
