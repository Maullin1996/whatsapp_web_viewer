import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_monitor_viewer/app/providers.dart';
import 'package:whatsapp_monitor_viewer/features/auth/domain/repository/auth_repository.dart';
import 'package:whatsapp_monitor_viewer/features/auth/presentation/providers/auth_state.dart';

class AuthNotifier extends Notifier<AuthState> {
  late final AuthRepository _repository;

  @override
  AuthState build() {
    _repository = ref.read(authRepositoryProvider);

    _loadSession();

    return const AuthState.loading();
  }

  Future<void> _loadSession() async {
    final result = await _repository.getCurrentUser();

    result.fold((failure) => state = AuthState.error(failure: failure), (user) {
      if (user == null) {
        state = const AuthState.unauthenticated();
      } else {
        state = AuthState.authenticated(user: user);
      }
    });
  }

  Future<void> login({required String email, required String password}) async {
    state = const AuthState.loading();

    final result = await _repository.login(email: email, password: password);

    result.fold(
      (failure) => state = AuthState.error(failure: failure),
      (user) => state = AuthState.authenticated(user: user),
    );
  }

  Future<void> logout() async {
    state = const AuthState.loading();

    final result = await _repository.logout();

    result.fold(
      (failure) => state = AuthState.error(failure: failure),
      (_) => state = const AuthState.unauthenticated(),
    );
  }
}

final authProvider = NotifierProvider<AuthNotifier, AuthState>(
  AuthNotifier.new,
);
