import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_monitor_viewer/features/chats/presentation/provider/active_chat_provider.dart';
import 'package:whatsapp_monitor_viewer/features/chats/presentation/widgets/chat_list.dart';
import 'package:whatsapp_monitor_viewer/features/home/presentation/widgets/custom_message_group.dart';
import 'package:whatsapp_monitor_viewer/features/messages/presentation/widgets/chat_header.dart';
import 'package:whatsapp_monitor_viewer/features/messages/presentation/widgets/message_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 239, 236),
      body: Row(
        children: [
          Container(color: Colors.white, width: 370, child: ChatList()),
          const VerticalDivider(width: 1, color: Color.fromARGB(16, 0, 0, 0)),
          Expanded(
            child: Consumer(
              builder: (context, ref, _) {
                final chat = ref.watch(activeChatProvider);

                if (chat == null) {
                  return Center(child: const CustomMessageGroup());
                }

                return Column(
                  children: const [
                    ChatHeader(),
                    Expanded(child: MessageList()),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
