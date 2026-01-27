import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_monitor_viewer/features/auth/presentation/providers/auth_provider.dart';

class CustomPopupMenuLogoutButton extends ConsumerWidget {
  const CustomPopupMenuLogoutButton({super.key});

  void _onLogout(BuildContext context, WidgetRef ref) async {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Cerrando sesión')));
    await ref.read(authProvider.notifier).logout();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopupMenuButton<_ChatMenuAction>(
      position: PopupMenuPosition.under,
      color: Colors.white,
      icon: const Icon(CupertinoIcons.ellipsis_vertical),
      onSelected: (action) {
        switch (action) {
          case _ChatMenuAction.logout:
            _onLogout(context, ref);
            break;
        }
      },
      itemBuilder: (context) => const [
        PopupMenuItem(
          value: _ChatMenuAction.logout,
          child: Row(
            children: [
              Icon(Icons.logout_rounded),
              SizedBox(width: 8),
              Text(
                'Cerrar sesión',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

enum _ChatMenuAction { logout }
