import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_monitor_viewer/core/errors/failure.dart';
import 'package:whatsapp_monitor_viewer/features/chats/presentation/provider/active_chat_provider.dart';
import 'package:whatsapp_monitor_viewer/features/messages/domain/entities/message.dart';
import 'package:whatsapp_monitor_viewer/features/messages/presentation/providers/messages_repository_provider.dart';

class MessagesNotifier extends AsyncNotifier<List<Message>> {
  @override
  FutureOr<List<Message>> build() async {
    final chat = ref.watch(activeChatProvider);

    if (chat == null) {
      return const [];
    }

    return _load(chat.chatJid);
  }

  Future<List<Message>> _load(String chatJid) async {
    final repository = ref.read(messagesRepositoryProvider);

    final Either<Failure, List<Message>> result = await repository.getMessages(
      chatJid,
    );

    return result.fold((failure) => throw failure, (messages) => messages);
  }
}
