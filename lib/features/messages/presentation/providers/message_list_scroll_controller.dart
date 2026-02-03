import 'package:flutter/material.dart';

class MessageListScrollController extends InheritedWidget {
  final VoidCallback scrollToLatest;

  const MessageListScrollController({
    super.key,
    required super.child,
    required this.scrollToLatest,
  });

  static MessageListScrollController? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<MessageListScrollController>();
  }

  @override
  bool updateShouldNotify(_) => false;
}
