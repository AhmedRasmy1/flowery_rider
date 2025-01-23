import 'package:dio/dio.dart';

class RegisterRequestDto {
  String? country;
  String? firstName;
  String? lastName;
  String? vehicleType;
  String? vehicleNumber;
  MultipartFile? vehicleLicense;
  String? NID;
  MultipartFile? NIDImg;
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
    this.NID,
    this.NIDImg,
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
      vehicleLicense: json['vehicleLicense'] != null
          ? MultipartFile.fromString(json['vehicleLicense'])
          : null,
      NID: json['NID'],
      NIDImg: json['NIDImg'] != null
          ? MultipartFile.fromString(json['NIDImg'])
          : null,
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
      'vehicleLicense': vehicleLicense?.filename,
      'NID': NID,
      'NIDImg': NIDImg?.filename,
      'email': email,
      'password': password,
      'rePassword': rePassword,
      'gender': gender,
      'phone': phone,
    };
  }
}
