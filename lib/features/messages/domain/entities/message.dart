class Message {
  final String id;
  final String chatJid;
  final String senderName;
  final String? caption;
  final String? storagePath;
  final bool hasMedia;
  final int messageTimestamp; // fuente de verdad
  final String localTime; // solo UI

  Message({
    required this.id,
    required this.chatJid,
    required this.senderName,
    this.caption,
    this.storagePath,
    required this.hasMedia,
    required this.messageTimestamp,
    required this.localTime,
  });

  bool get isImage => hasMedia && storagePath != null;
}
