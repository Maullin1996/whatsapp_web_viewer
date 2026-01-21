import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
abstract class Failure with _$Failure {
  const factory Failure.firestore({required String message}) = FirestoreFailure;

  const factory Failure.unauthorized({
    @Default('No autorizado') String message,
  }) = UnauthorizedFailure;

  const factory Failure.unknown({
    @Default('Error desconocido') String message,
  }) = UnknownFailure;
}
