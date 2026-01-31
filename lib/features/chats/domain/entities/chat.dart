//lib/feature/chats/domain/entities/chat.dart
class Chat {
  final String chatJid;
  final String groupName;
  final int lastMessageAt;
  final int count;

  Chat({
    required this.chatJid,
    required this.groupName,
    required this.lastMessageAt,
    required this.count,
  });
}
