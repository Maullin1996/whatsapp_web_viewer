import 'package:whatsapp_monitor_viewer/core/errors/failure.dart';

String mapFailureToMessage(Object error) {
  if (error is Failure) {
    return error.when(
      firestore: (message) => message,
      unauthorized: (message) => message,
      unknown: (message) => message,
    );
  }

  return 'Error inesperado';
}
