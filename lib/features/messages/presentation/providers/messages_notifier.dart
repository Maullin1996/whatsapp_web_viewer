import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_monitor_viewer/features/chats/presentation/provider/active_chat_provider.dart';
import 'package:whatsapp_monitor_viewer/features/messages/domain/entities/message.dart';
import 'package:whatsapp_monitor_viewer/features/messages/domain/entities/messages_page.dart';
import 'package:whatsapp_monitor_viewer/features/messages/presentation/providers/messages_repository_provider.dart';

class MessagesNotifier extends AsyncNotifier<List<Message>> {
  static const _pageSize = 50;
  final List<Message> _items = [];
  Object? _cursor;
  bool _isLoadingMore = false;
  String? _activeChatJid;

  @override
  FutureOr<List<Message>> build() async {
    final chat = ref.watch(activeChatProvider);

    if (chat == null) {
      _reset();
      return const [];
    }

    if (_activeChatJid != chat.chatJid) {
      _reset();
      _activeChatJid = chat.chatJid;
      await _loadInitial(chat.chatJid);
    }

    return _items;
  }

  // =========================
  // Acciones públicas
  // =========================

  Future<void> loadMore() async {
    if (_isLoadingMore) return;
    if (_cursor == null) return; // no hay más páginas
    if (_activeChatJid == null) return;

    _isLoadingMore = true;

    final repo = ref.read(messagesRepositoryProvider);

    final result = await repo.fetchNext(
      chatJid: _activeChatJid!,
      cursor: _cursor!,
      limit: _pageSize,
    );

    result.fold(
      (failure) {
        _isLoadingMore = false;
      },
      (page) {
        _cursor = page.nextCursor;
        _items.addAll(page.items);
        _isLoadingMore = false;
        state = AsyncData(List.unmodifiable(_items));
      },
    );
  }

  // =========================
  // Internos
  // =========================

  Future<void> _loadInitial(String chatJid) async {
    state = const AsyncLoading();

    final repo = ref.read(messagesRepositoryProvider);

    final result = await repo.fetchInitial(chatJid: chatJid, limit: _pageSize);

    result.fold(
      (failure) {
        state = AsyncError(failure, StackTrace.current);
      },
      (MessagesPage page) {
        _items
          ..clear()
          ..addAll(page.items);
        _cursor = page.nextCursor;
        state = AsyncData(List.unmodifiable(_items));
      },
    );
  }

  void _reset() {
    _items.clear();
    _cursor = null;
    _isLoadingMore = false;
    _activeChatJid = null;
    state = const AsyncData([]);
  }
}
