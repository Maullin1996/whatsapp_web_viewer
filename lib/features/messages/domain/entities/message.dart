class Message {
  final String id;
  final String chatJid;
  final String senderName;
  final String? caption;
  final String? storagePath;
  final bool hasMedia;
  final int messageTimestamp;
  final String shiftName;
  final String localTime;

  Message({
    required this.id,
    required this.senderName,
    this.caption,
    this.storagePath,
    required this.hasMedia,
    required this.messageTimestamp,
    required this.chatJid,
    required this.shiftName,
    required this.localTime,
  });

  bool get isImage => hasMedia && storagePath != null;
}
