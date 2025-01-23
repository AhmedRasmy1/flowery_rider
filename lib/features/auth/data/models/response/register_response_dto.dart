import '../../../domain/entities/register_entity.dart';

class RegisterResponseDto {
  RegisterResponseDto({
    this.message,
    this.driver,
    this.token,
  });

  RegisterResponseDto.fromJson(dynamic json) {
    message = json['message'];
    driver = json['driver'] != null ? Driver.fromJson(json['driver']) : null;
    token = json['token'];
  }

  String? message;
  Driver? driver;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (driver != null) {
      map['driver'] = driver?.toJson();
    }
    map['token'] = token;
    return map;
  }

  RegisterEntity toRegisterEntity() {
    return RegisterEntity(
        message: message, driver: driver?.toDriverEntity(), token: token);
  }
}

class Driver {
  Driver({
    this.country,
    this.firstName,
    this.lastName,
    this.vehicleType,
    this.vehicleNumber,
    this.vehicleLicense,
    this.nid,
    this.nIDImg,
    this.email,
    this.gender,
    this.phone,
    this.photo,
    this.id,
    this.createdAt,
  });

  Driver.fromJson(dynamic json) {
    country = json['country'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    vehicleType = json['vehicleType'];
    vehicleNumber = json['vehicleNumber'];
    vehicleLicense = json['vehicleLicense'];
    nid = json['NID'];
    nIDImg = json['NIDImg'];
    email = json['email'];
    gender = json['gender'];
    phone = json['phone'];
    photo = json['photo'];
    id = json['_id'];
    createdAt = json['createdAt'];
  }

  String? country;
  String? firstName;
  String? lastName;
  String? vehicleType;
  String? vehicleNumber;
  String? vehicleLicense;
  String? nid;
  String? nIDImg;
  String? email;
  String? gender;
  String? phone;
  String? photo;
  String? id;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['country'] = country;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['vehicleType'] = vehicleType;
    map['vehicleNumber'] = vehicleNumber;
    map['vehicleLicense'] = vehicleLicense;
    map['NID'] = nid;
    map['NIDImg'] = nIDImg;
    map['email'] = email;
    map['gender'] = gender;
    map['phone'] = phone;
    map['photo'] = photo;
    map['_id'] = id;
    map['createdAt'] = createdAt;
    return map;
  }

  DriverEntity toDriverEntity() {
    return DriverEntity(
        id: id,
        email: email,
        phone: phone,
        country: country,
        createdAt: createdAt,
        firstName: firstName,
        gender: gender,
        lastName: lastName,
        nid: nid,
        nIDImg: nIDImg,
        photo: photo,
        vehicleLicense: vehicleLicense,
        vehicleNumber: vehicleNumber,
        vehicleType: vehicleType);
  }
}
