import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_monitor_viewer/features/chats/presentation/provider/active_chat_provider.dart';
import 'package:whatsapp_monitor_viewer/features/chats/presentation/widgets/chat_list.dart';
import 'package:whatsapp_monitor_viewer/features/messages/presentation/widgets/message_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> _logout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        title: const Text('WhatsApp Monitor Viewer'),
        actions: [
          IconButton(onPressed: _logout, icon: const Icon(Icons.logout)),
        ],
      ),
      body: Row(
        children: [
          const SizedBox(width: 320, child: ChatList()),
          const VerticalDivider(width: 1),
          Expanded(
            child: Consumer(
              builder: (context, ref, _) {
                final chat = ref.watch(activeChatProvider);

                if (chat == null) {
                  return const Center(child: Text('Selecciona un grupo'));
                }

                return const MessageList();
              },
            ),
          ),
        ],
      ),
    );
  }
}
