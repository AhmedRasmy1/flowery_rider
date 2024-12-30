class ProfileDataModelEntity {
  String? message;
  DriverEntity? driver;

  ProfileDataModelEntity({
    this.message,
    this.driver,
  });
}

class DriverEntity {
  String? id;
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

  DriverEntity({
    this.id,
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
  });
}
