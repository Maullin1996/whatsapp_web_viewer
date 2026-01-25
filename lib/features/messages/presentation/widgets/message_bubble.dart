import 'package:flutter/material.dart';
import 'package:whatsapp_monitor_viewer/features/messages/domain/entities/message.dart';
import 'package:whatsapp_monitor_viewer/features/messages/presentation/viewer/image_detail_page.dart';
import 'package:whatsapp_monitor_viewer/features/messages/presentation/viewer/image_view_item.dart';

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
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.teal,
                ),
              ),
            ),
          if (message.hasMedia && message.imageUrl != null)
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ImageDetailPage(
                      initialIndex: 0,
                      items: [
                        ImageViewItem(
                          url: message.imageUrl!,
                          senderName: message.senderName,
                          messageTimestamp: message.messageTimestamp,
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  message.imageUrl!,
                  fit: BoxFit.cover,
                  errorBuilder: (_, _, _) {
                    return Image.asset("assets/images/loading.gif");
                  },
                ),
              ),
            ),
          if (message.caption != null && message.caption!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Text(
                message.caption!,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          const SizedBox(height: 4),
          Align(
            alignment: AlignmentGeometry.bottomRight,
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
