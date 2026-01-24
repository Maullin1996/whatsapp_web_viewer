class Message {
  final String id;
  final String senderName;
  final String? caption;
  final String? imageUrl;
  final bool hasMedia;
  final int messageTimestamp;

  Message({
    required this.id,
    required this.senderName,
    this.caption,
    this.imageUrl,
    required this.hasMedia,
    required this.messageTimestamp,
  });
}
