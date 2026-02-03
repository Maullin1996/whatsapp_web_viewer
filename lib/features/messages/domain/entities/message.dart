class Message {
  final String id;
  final String chatJid;
  final String senderName;
  final String? caption;
  final String? storagePath;
  final bool hasMedia;
  final int messageTimestamp;
  final String localTime;
  final String shift;
  final String messageDate;

  Message({
    required this.id,
    required this.chatJid,
    required this.senderName,
    this.caption,
    this.storagePath,
    required this.hasMedia,
    required this.messageTimestamp,
    required this.localTime,
    required this.shift,
    required this.messageDate,
  });

  bool get isImage => hasMedia && storagePath != null;
}
