import 'package:flutter/material.dart';
import 'package:whatsapp_monitor_viewer/features/messages/presentation/providers/message_list_scroll_controller.dart';

class GoToLatestMessageButton extends StatelessWidget {
  const GoToLatestMessageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: const Color(0xFFE0E0E0),
      shape: const CircleBorder(),
      tooltip: 'Ir al mensaje más reciente',
      onPressed: () {
        MessageListScrollController.of(context)?.scrollToLatest();
      },
      child: const Icon(Icons.arrow_downward, color: Colors.black),
    );
  }
}
