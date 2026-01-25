import 'package:firebase_auth/firebase_auth.dart';
import 'package:whatsapp_monitor_viewer/features/auth/domain/entities/authenticated_user.dart';

AuthenticatedUser mapToDomain(User user) {
  return AuthenticatedUser(id: user.uid, email: user.email ?? '');
}
