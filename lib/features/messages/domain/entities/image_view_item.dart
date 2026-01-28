class ImageViewItem {
  final String url;
  final String senderName;
  final int messageTimestamp;
  final String? shiftName;

  ImageViewItem({
    required this.url,
    required this.senderName,
    required this.messageTimestamp,
    this.shiftName,
  });
}
