import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:whatsapp_monitor_viewer/features/auth/presentation/pages/login_page.dart';
import 'package:whatsapp_monitor_viewer/features/auth/presentation/providers/auth_provider.dart';
import 'package:whatsapp_monitor_viewer/features/auth/presentation/providers/auth_state.dart';
import 'package:whatsapp_monitor_viewer/features/home/presentation/pages/home_page.dart';
import 'package:whatsapp_monitor_viewer/features/messages/presentation/viewer/image_detail_page.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);

  return GoRouter(
    initialLocation: '/login',
    redirect: (context, state) {
      return authState.when(
        loading: () => null,
        authenticated: (_) => state.matchedLocation == '/home' ? null : '/home',
        unauthenticated: () =>
            state.matchedLocation == '/login' ? null : '/login',
        error: (_) => '/login',
      );
    },
    routes: [
      GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
            path: '/viewer/:index',
            builder: (context, state) {
              final index = int.parse(state.pathParameters['index']!);
              return ImageDetailPage(initialIndex: index);
            },
          ),
        ],
      ),
    ],
  );
});
