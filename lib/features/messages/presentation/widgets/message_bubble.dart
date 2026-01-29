import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_monitor_viewer/features/messages/domain/entities/message.dart';
import 'package:whatsapp_monitor_viewer/features/messages/presentation/helpers/find_initial_index.dart';
import 'package:whatsapp_monitor_viewer/features/messages/presentation/providers/chat_image_items_provider.dart';
import 'package:whatsapp_monitor_viewer/features/messages/presentation/providers/image_url_provider.dart';
import 'package:whatsapp_monitor_viewer/features/messages/presentation/viewer/image_detail_page.dart';
import 'package:whatsapp_monitor_viewer/features/messages/presentation/widgets/message_information_widget.dart';

class MessageBubble extends StatelessWidget {
  final Message message;
  final bool showSenderName;
  const MessageBubble({
    super.key,
    required this.message,
    required this.showSenderName,
  });

  @override
  Widget build(BuildContext context) {
    final time = DateTime.fromMillisecondsSinceEpoch(
      message.messageTimestamp,
    ).toLocal().toString().substring(11, 16);
    return Container(
      constraints: const BoxConstraints(maxWidth: 420),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showSenderName && message.senderName.trim().isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                message.senderName,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.teal,
                ),
              ),
            ),
          if (message.isImage) _ImagePreview(storagePath: message.storagePath!),
          if (message.caption != null && message.caption!.isNotEmpty)
            Container(
              margin: EdgeInsets.only(bottom: 8),
              child: Text(
                message.caption!,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          MessageInformationWidget(message: message),
          const SizedBox(height: 4),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              time,
              style: Theme.of(
                context,
              ).textTheme.labelSmall?.copyWith(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}

class _ImagePreview extends ConsumerWidget {
  final String storagePath;
  const _ImagePreview({required this.storagePath});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final urlAsync = ref.watch(imageUrlProvider(storagePath));

    return urlAsync.when(
      data: (url) => InkWell(
        onTap: () {
          final items = ref.read(chatImageItemsProvider);

          if (items.isEmpty) return;

          final initialIndex = findInitialIndex(
            items: items,
            storagePath: storagePath,
          );

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) =>
                  ImageDetailPage(initialIndex: initialIndex, items: items),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(
              url,
              fit: BoxFit.cover,
              webHtmlElementStrategy: WebHtmlElementStrategy.prefer,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  height: 200,
                  color: Colors.black12,
                  child: const Center(child: CircularProgressIndicator()),
                );
              },
              errorBuilder: (_, _, _) => Container(
                height: 200,
                color: Colors.black12,
                child: const Center(child: Icon(Icons.broken_image)),
              ),
            ),
          ),
        ),
      ),
      error: (_, _) => Center(
        child: Container(
          height: 200,
          color: Colors.black12,
          child: const Icon(Icons.broken_image),
        ),
      ),
      loading: () => Center(child: CircularProgressIndicator()),
    );
  }
}
