class RegisterEntity {
  RegisterEntity({
    this.message,
    this.driver,
    this.token,});

  String? message;
  DriverEntity? driver;
  String? token;
}

class DriverEntity {
  DriverEntity({
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
    this.createdAt,});

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
}