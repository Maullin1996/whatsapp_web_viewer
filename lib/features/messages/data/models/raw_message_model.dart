class RawMessageModel {
  final String id;
  final String senderName;
  final String? caption;
  final String? storagePath;
  final bool hasMedia;
  final int messageTimestamp;

  RawMessageModel({
    required this.id,
    required this.senderName,
    this.caption,
    this.storagePath,
    required this.hasMedia,
    required this.messageTimestamp,
  });
}
