
import '../../../domain/entities/register_entities/driver_entity_for_register.dart';

class DriverDto {
  DriverDto({
    this.country,
    this.firstName,
    this.lastName,
    this.vehicleType,
    this.vehicleNumber,
    this.vehicleLicense,
    this.nid,
    this.nidImg,
    this.email,
    this.gender,
    this.phone,
    this.photo,
    this.id,
    this.role,
    this.createdAt,
  });

  DriverDto.fromJson(dynamic json) {
    country = json['country'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    vehicleType = json['vehicleType'];
    vehicleNumber = json['vehicleNumber'];
    vehicleLicense = json['vehicleLicense'];
    nid = json['NID'];
    nidImg = json['NIDImg'];
    email = json['email'];
    gender = json['gender'];
    phone = json['phone'];
    photo = json['photo'];
    id = json['_id'];
    role=json['role'];
    createdAt = json['createdAt'];
  }

  String? country;
  String? firstName;
  String? lastName;
  String? vehicleType;
  String? vehicleNumber;
  String? vehicleLicense;
  String? nid;
  String? nidImg;
  String? email;
  String? gender;
  String? phone;
  String? photo;
  String? role;
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
    map['NIDImg'] = nidImg;
    map['email'] = email;
    map['gender'] = gender;
    map['phone'] = phone;
    map['photo'] = photo;
    map['_id'] = id;
    map['role']=role;
    map['createdAt'] = createdAt;
    return map;
  }

  DriverEntityForRegister toDriverEntity() {
    return DriverEntityForRegister(
        id: id,
        email: email,
        phone: phone,
        country: country,
        firstName: firstName,
        gender: gender,
        lastName: lastName,
        createdAt: createdAt,
        role: role,
        nid: nid,
        nidImg: nidImg,
        photo: photo,
        vehicleLicense: vehicleLicense,
        vehicleNumber: vehicleNumber,
        vehicleType: vehicleType);
  }
}