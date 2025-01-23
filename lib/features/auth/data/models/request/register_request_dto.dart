import 'dart:io';

import 'package:dio/dio.dart';

class RegisterRequestDto {
  String? country;
  String? firstName;
  String? lastName;
  String? vehicleType;
  String? vehicleNumber;
  File? vehicleLicense;
  String? nid;
  File? nidImg;
  String? email;
  String? password;
  String? rePassword;
  String? gender;
  String? phone;

  RegisterRequestDto({
    this.country,
    this.firstName,
    this.lastName,
    this.vehicleType,
    this.vehicleNumber,
    this.vehicleLicense,
    this.nid,
    this.nidImg,
    this.email,
    this.password,
    this.rePassword,
    this.gender,
    this.phone,
  });

  factory RegisterRequestDto.fromJson(Map<String, dynamic> json) {
    return RegisterRequestDto(
      country: json['country'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      vehicleType: json['vehicleType'],
      vehicleNumber: json['vehicleNumber'],
      vehicleLicense: json['vehicleLicense'] ,
      nid: json['nid'],
      nidImg: json['nidImg'] ,
      email: json['email'],
      password: json['password'],
      rePassword: json['rePassword'],
      gender: json['gender'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'country': country,
      'firstName': firstName,
      'lastName': lastName,
      'vehicleType': vehicleType,
      'vehicleNumber': vehicleNumber,
      'vehicleLicense': vehicleLicense,
      'nid': nid,
      'nidImg': nidImg,
      'email': email,
      'password': password,
      'rePassword': rePassword,
      'gender': gender,
      'phone': phone,
    };
  }
}