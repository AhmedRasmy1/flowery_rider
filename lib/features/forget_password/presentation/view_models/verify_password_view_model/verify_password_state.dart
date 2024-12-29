import '../../../domain/entities/verify_password_entity.dart';

sealed class VerifyPasswordState {}

class InitialState extends VerifyPasswordState {}

class SuccessVerifyPasswordState extends VerifyPasswordState {
  VerifyPasswordEntity? verifyPasswordEntity;

  SuccessVerifyPasswordState(this.verifyPasswordEntity);
}

class LoadingVerifyPasswordState extends VerifyPasswordState {}

class ErrorVerifyPasswordState extends VerifyPasswordState {
  Exception? exception;

  ErrorVerifyPasswordState(this.exception);
}
