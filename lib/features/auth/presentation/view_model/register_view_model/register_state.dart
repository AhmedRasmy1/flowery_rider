

import 'dart:core';
import 'dart:io';

import '../../../domain/entities/register_entities/register_entity.dart';


sealed class RegisterState {}

class InitialState extends RegisterState {}

class SuccessRegisterState extends RegisterState {
  RegisterEntity? registerEntities;

  SuccessRegisterState(this.registerEntities);
}

class LoadingRegisterState extends RegisterState {
  LoadingRegisterState();
}

class ErrorRegisterState extends RegisterState {
  Exception? exception;

  ErrorRegisterState(this.exception);
}

sealed class RegisterToAction {}

class RegisterAction extends RegisterToAction {
  String country;
  String firstName;
  String lastName;
  String vehicleType;
  String vehicleNumber;
  File vehicleLicense;
  String nid;
  File nidImg;
  String email;
  String password;
  String rePassword;
  String gender;
  String phone;

  RegisterAction(
      {

        required this.country,
        required this.firstName,
        required this.lastName,
        required this.vehicleType,
        required this.vehicleNumber,
        required this.vehicleLicense,
        required this.nid,
        required this.nidImg,
        required this.email,
        required this.password,
        required this.rePassword,
        required this.gender,
        required this.phone,

      });
}
