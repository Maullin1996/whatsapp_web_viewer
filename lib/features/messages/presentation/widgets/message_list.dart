import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_monitor_viewer/features/messages/domain/entities/message.dart';
import 'package:whatsapp_monitor_viewer/features/messages/presentation/helpers/format_day_label.dart';
import 'package:whatsapp_monitor_viewer/features/messages/presentation/providers/image_url_provider.dart';
import 'package:whatsapp_monitor_viewer/features/messages/presentation/widgets/message_bubble.dart';
import 'package:whatsapp_monitor_viewer/features/messages/presentation/providers/messages_provider.dart';

class MessageList extends ConsumerStatefulWidget {
  const MessageList({super.key});

  @override
  ConsumerState<MessageList> createState() => _MessageListState();
}

class _MessageListState extends ConsumerState<MessageList> {
  late final ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController()..addListener(_onScroll);
  }

  void _onScroll() {
    if (!_controller.hasClients) return;
    if (_controller.position.pixels >=
        _controller.position.maxScrollExtent - 200) {
      ref.read(messagesProvider.notifier).loadMore();
    }
  }

  void _preloadNearByImages({
    required WidgetRef ref,
    required List<Message> messages,
    required int index,
  }) {
    const preloadAhead = 6;

    for (int i = index; i < index + preloadAhead && i < messages.length; i++) {
      final msg = messages[i];
      if (msg.isImage) {
        ref.read(imageUrlProvider(msg.storagePath!).future);
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(messagesProvider);
    return state.when(
      data: (messages) {
        if (messages.isEmpty) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/fondo.png'),
              ),
            ),
            child: const Center(
              child: Text(
                'Sin Mensajes',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          );
        }
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,

              image: AssetImage('assets/images/fondo.png'),
            ),
          ),
          child: ListView.builder(
            controller: _controller,
            padding: const EdgeInsets.only(bottom: 12),
            reverse: true,
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final msg = messages[index];

              _preloadNearByImages(ref: ref, messages: messages, index: index);

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

              return RepaintBoundary(
                key: ValueKey(msg.id),
                child: Column(
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
                ),
              );
            },
          ),
        );
      },
      error: (error, _) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              error.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        );
      },
      loading: () => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: const AssetImage('assets/images/fondo.png'),
          ),
        ),
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
