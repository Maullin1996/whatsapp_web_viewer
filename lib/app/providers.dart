import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_monitor_viewer/features/auth/data/datasources/firebase_auth_datasource.dart';
import 'package:whatsapp_monitor_viewer/features/auth/data/datasources/firebase_auth_datasource_impl.dart';
import 'package:whatsapp_monitor_viewer/features/auth/data/repository/auth_repository_impl.dart';
import 'package:whatsapp_monitor_viewer/features/auth/domain/repository/auth_repository.dart';

/// FirebaseAuth (infraestructura)
final firebaseAuthProvider = Provider<FirebaseAuth>(
  (ref) => FirebaseAuth.instance,
);

/// Datasource
final firebaseAuthDatasourceProvider = Provider<FirebaseAuthDatasource>((ref) {
  final firebaseAuth = ref.read(firebaseAuthProvider);
  return FirebaseAuthDatasourceImpl(firebaseAuth);
});

/// Repository (puente data → domain)
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final datasource = ref.read(firebaseAuthDatasourceProvider);
  return AuthRepositoryImpl(datasource);
});
