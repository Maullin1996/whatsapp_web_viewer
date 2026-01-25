import 'package:firebase_auth/firebase_auth.dart';
import 'package:whatsapp_monitor_viewer/core/errors/auth_failure.dart';

AuthFailure mapFirebaseException(FirebaseAuthException error) {
  switch (error.code) {
    case 'invalid-email':
      return const AuthFailure.invalidEmail();
    case 'wrong-passwor':
      return const AuthFailure.wrongPassword();
    case 'user-not-found':
      return const AuthFailure.userNotFound();
    case 'user-disabled':
      return const AuthFailure.userDisabled();
    case 'network-request-failed':
      return const AuthFailure.networkError();
    case 'too-many-requests':
      return const AuthFailure.tooManyRequests();
    default:
      return const AuthFailure.unknown();
  }
}
