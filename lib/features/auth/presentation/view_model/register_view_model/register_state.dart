

import '../../../domain/entities/register_entities/register_entity.dart';

sealed class RegisterState {}

class InitialState extends RegisterState {}

class SuccessRegisterState extends RegisterState {
  RegisterEntity registerEntity;

  SuccessRegisterState(this.registerEntity);
}

class LoadingRegisterState extends RegisterState {

}

class ErrorRegisterState extends RegisterState {
  Exception? exception;

  ErrorRegisterState(this.exception);
}