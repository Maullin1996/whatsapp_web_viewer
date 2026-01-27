import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_monitor_viewer/app/providers.dart';
import 'package:whatsapp_monitor_viewer/features/chats/domain/entities/chat.dart';

class ChatsNotifier extends AsyncNotifier<List<Chat>> {
  @override
  Future<List<Chat>> build() async {
    return _loadChats();
  }

  Future<List<Chat>> _loadChats() async {
    final repository = ref.read(chatsRepositoryProvider);
    final result = await repository.getChats();

    return result.fold((failure) => throw failure, (chats) => chats);
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_loadChats);
  }
}
