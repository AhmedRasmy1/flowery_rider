
import '../../domain/entities/login_entity.dart';

sealed class LoginState {}

class InitialState extends LoginState {}

class SuccessLoginState extends LoginState {
  LoginEntitie loginEntities;

  SuccessLoginState(this.loginEntities);
}

class LoadingLoginState extends LoginState {}

class ErrorLoginState extends LoginState {
  Exception? exception;

  ErrorLoginState(this.exception);
}
