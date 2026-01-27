import 'package:flutter/material.dart';

String formatTime(int epochMs, BuildContext context) {
  final date = DateTime.fromMillisecondsSinceEpoch(epochMs).toLocal();
  return TimeOfDay.fromDateTime(date).format(context);
}
