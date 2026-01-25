import 'package:dartz/dartz.dart';
import 'package:whatsapp_monitor_viewer/core/errors/auth_failure.dart';
import 'package:whatsapp_monitor_viewer/features/auth/domain/entities/authenticated_user.dart';

abstract class AuthRepository {
  Future<Either<AuthFailure, AuthenticatedUser>> login({
    required String email,
    required String password,
  });

  Future<Either<AuthFailure, Unit>> logout();

  Future<Either<AuthFailure, AuthenticatedUser?>> getCurrentUser();
}
