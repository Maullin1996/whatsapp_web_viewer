import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_monitor_viewer/features/messages/presentation/helpers/format_day_label.dart';
import 'package:whatsapp_monitor_viewer/features/messages/presentation/widgets/message_bubble.dart';
import 'package:whatsapp_monitor_viewer/helpers/map_failure_to_message.dart';
import 'package:whatsapp_monitor_viewer/features/messages/presentation/providers/messages_provider.dart';

class MessageList extends ConsumerWidget {
  const MessageList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(messagesProvider);
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color.fromARGB(255, 235, 234, 234)),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/fondo.png'),
          ),
        ),
        child: state.when(
          data: (messages) {
            if (messages.isEmpty) {
              return const Center(child: Text('Sin Mensajes'));
            }
            return ListView.builder(
              padding: const EdgeInsets.only(bottom: 12),
              reverse: true,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];

                final prevMsg = index + 1 < messages.length
                    ? messages[index + 1]
                    : null;

                final showSenderName =
                    prevMsg == null || prevMsg.senderName != msg.senderName;

                final showDateSeparator =
                    prevMsg == null ||
                    DateTime.fromMillisecondsSinceEpoch(
                          msg.messageTimestamp,
                        ).toLocal().day !=
                        DateTime.fromMillisecondsSinceEpoch(
                          prevMsg.messageTimestamp,
                        ).toLocal().day;

                return Column(
                  children: [
                    if (showDateSeparator)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE1F3FB),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            formatDayLabel(msg.messageTimestamp),
                            style: Theme.of(context).textTheme.labelMedium
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: showSenderName ? 10 : 2,
                        bottom: 12,
                        left: 12,
                        right: 12,
                      ),
                      child: MessageBubble(
                        message: msg,
                        showSenderName: showSenderName,
                      ),
                    ),
                  ],
                );
              },
            );
          },
          error: (error, _) {
            final message = mapFailureToMessage(error);
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(message, textAlign: TextAlign.center),
              ),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
