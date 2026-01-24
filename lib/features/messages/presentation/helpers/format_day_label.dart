String formatDayLabel(int timestamp) {
  final date = DateTime.fromMillisecondsSinceEpoch(timestamp).toLocal();

  final now = DateTime.now();

  final today = DateTime(now.year, now.month, now.day);
  final yesterday = today.subtract(const Duration(days: 1));
  final messageDay = DateTime(date.year, date.month, date.day);

  if (messageDay == today) return "HOY";
  if (messageDay == yesterday) return "AYER";

  return "${date.day.toString().padLeft(2, '0')}/"
      "${date.month.toString().padLeft(2, '0')}/"
      "${date.year}";
}
