import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_monitor_viewer/helpers/map_failure_to_message.dart';
import 'package:whatsapp_monitor_viewer/features/messages/presentation/providers/messages_provider.dart';

class MessageList extends ConsumerWidget {
  const MessageList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(messagesProvider);
    return state.when(
      data: (messages) {
        if (messages.isEmpty) {
          return const Center(child: Text('Sin Mensajes'));
        }
        return ListView.builder(
          reverse: true,
          itemCount: messages.length,
          itemBuilder: (context, index) {
            final msg = messages[index];

            if (msg.hasMedia && msg.imageUrl != null) {
              return Image.network(
                msg.imageUrl!,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) {
                  return Image.asset(
                    "assets/images/broken-heart-7182718_1280.webp",
                  );
                },
              );
            }
            return ListTile(
              title: Text(msg.senderName),
              subtitle: Text(msg.caption ?? ''),
            );
          },
        );
      },
      error: (error, _) {
        final message = mapFailureToMessage(error);
        print(message);
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(message, textAlign: TextAlign.center),
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
