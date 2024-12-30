
import '../../domain/entities/logout_entity.dart';

sealed class LogoutState {}

class InitialState extends LogoutState {}

class SuccessLogoutState extends LogoutState {
  LogoutEntity logoutEntity;

  SuccessLogoutState(this.logoutEntity);
}

class LoadingLogoutState extends LogoutState {}

class ErrorLogoutState extends LogoutState {
  Exception? exception;

  ErrorLogoutState(this.exception);
}
