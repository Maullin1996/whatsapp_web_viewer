import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_monitor_viewer/features/chats/presentation/helpers/map_failure_to_message.dart';
import 'package:whatsapp_monitor_viewer/features/chats/presentation/provider/chats_provider.dart';

class ChatList extends ConsumerWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(chatsProvider);
    return state.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) {
        final message = mapFailureToMessage(error);
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(message, textAlign: TextAlign.center),
          ),
        );
      },
      data: (chats) {
        if (chats.isEmpty) {
          return const Center(child: Text('No hay grupos disponibles'));
        }

        return ListView.separated(
          itemBuilder: (context, index) {
            final chat = chats[index];
            final time = DateTime.fromMicrosecondsSinceEpoch(
              chat.lastMessageAt,
            ).toLocal().toString().substring(11, 16);

            return ListTile(
              title: Text(
                chat.groupName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text('${chat.count} mensajes'),
              trailing: Text(
                time,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              onLongPress: () {},
            );
          },
          separatorBuilder: (_, _) => const Divider(height: 1),
          itemCount: chats.length,
        );
      },
    );
  }
}
