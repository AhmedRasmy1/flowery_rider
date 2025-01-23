import '../../../domain/entities/profile_edit_data_entity.dart';

class EditProfileResponse {
  EditProfileResponse({
      this.message, 
      this.driver,});

  EditProfileResponse.fromJson(dynamic json) {
    message = json['message'];
    driver = json['driver'] != null ? Driver.fromJson(json['driver']) : null;
  }
  String? message;
  Driver? driver;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (driver != null) {
      map['driver'] = driver?.toJson();
    }
    return map;
  }
  EditProfileDataEntity editProfileDataModelEntity(){
    return EditProfileDataEntity(
      message: message,
      driver: driver?.toDriverEntity(),


    );
  }

}

class Driver {
  Driver({
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
      this.password, 
      this.gender, 
      this.phone, 
      this.photo, 
      this.createdAt, 
      this.passwordChangedAt,});

  Driver.fromJson(dynamic json) {
    id = json['_id'];
    country = json['country'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    vehicleType = json['vehicleType'];
    vehicleNumber = json['vehicleNumber'];
    vehicleLicense = json['vehicleLicense'];
    nid = json['NID'];
    nIDImg = json['NIDImg'];
    email = json['email'];
    password = json['password'];
    gender = json['gender'];
    phone = json['phone'];
    photo = json['photo'];
    createdAt = json['createdAt'];
    passwordChangedAt = json['passwordChangedAt'];
  }
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
  String? password;
  String? gender;
  String? phone;
  String? photo;
  String? createdAt;
  String? passwordChangedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['country'] = country;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['vehicleType'] = vehicleType;
    map['vehicleNumber'] = vehicleNumber;
    map['vehicleLicense'] = vehicleLicense;
    map['NID'] = nid;
    map['NIDImg'] = nIDImg;
    map['email'] = email;
    map['password'] = password;
    map['gender'] = gender;
    map['phone'] = phone;
    map['photo'] = photo;
    map['createdAt'] = createdAt;
    map['passwordChangedAt'] = passwordChangedAt;
    return map;
  }
  EditDriverEntity toDriverEntity() {
    return EditDriverEntity(
      id: id,
      country: country,
      firstName: firstName,
      lastName: lastName,
      vehicleType: vehicleType,
      vehicleNumber: vehicleNumber,
      vehicleLicense: vehicleLicense,
      nid: nid,
      nIDImg: nIDImg,
      email: email,
      gender: gender,
      phone: phone,
      photo: photo,

    );
  }
}