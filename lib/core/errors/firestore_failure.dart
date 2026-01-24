import 'package:cloud_firestore/cloud_firestore.dart';
import 'failure.dart';

Failure mapFirestoreError(Object error) {
  if (error is FirebaseException) {
    switch (error.code) {
      case 'permission-denied':
        return const Failure.unauthorized();
      case 'unavailable':
        return Failure.firestore(message: 'Servicio no disponible');
      default:
        return Failure.firestore(
          message: error.message ?? 'Error de Firestore',
        );
    }
  }

  return const Failure.unknown();
}
