import 'package:flutter/material.dart';
import 'package:whatsapp_monitor_viewer/app/router.dart';

class WhatsAppMonitorApp extends StatelessWidget {
  const WhatsAppMonitorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AppRouter(),
    );
  }
}
