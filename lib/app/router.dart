import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_monitor_viewer/features/auth/presentation/login_page.dart';
import 'package:whatsapp_monitor_viewer/features/home/presentation/home_page.dart';

class AppRouter extends StatefulWidget {
  const AppRouter({super.key});

  @override
  State<AppRouter> createState() => _AppRouterState();
}

class _AppRouterState extends State<AppRouter> {
  User? user;

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((userState) {
      setState(() {
        user = userState;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return const LoginPage();
    }

    return const HomePage();
  }
}
