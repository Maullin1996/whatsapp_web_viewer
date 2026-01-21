import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_monitor_viewer/features/chats/presentation/widgets/chat_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> _logout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WhatsApp Monitor Viewer'),
        actions: [
          IconButton(onPressed: _logout, icon: const Icon(Icons.logout)),
        ],
      ),
      body: const Row(
        children: [
          SizedBox(width: 320, child: ChatList()),
          VerticalDivider(width: 1),
          Expanded(child: Center(child: Text('Selecciona un grupo'))),
        ],
      ),
    );
  }
}
