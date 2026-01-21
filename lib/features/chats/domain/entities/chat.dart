class Chat {
  final String groupJid;
  final String groupName;
  final int lastMessageAt;
  final int count;

  Chat({
    required this.groupJid,
    required this.groupName,
    required this.lastMessageAt,
    required this.count,
  });
}
