import '../../../domain/entities/register_entity.dart';

sealed class RegisterState {}

class InitialState extends RegisterState {}

class SuccessRegisterState extends RegisterState {
  RegisterEntity registerEntity;

  SuccessRegisterState(this.registerEntity);
}

class LoadingRegisterState extends RegisterState {
  LoadingRegisterState();
}

class ErrorRegisterState extends RegisterState {
  Exception? exception;

  ErrorRegisterState(this.exception);
}



