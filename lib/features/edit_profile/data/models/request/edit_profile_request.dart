class EditProfileRequest {
  EditProfileRequest({
      this.firstName, 
      this.lastName, 
      this.email, 
      this.phone,});

  EditProfileRequest.fromJson(dynamic json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phone = json['phone'];
  }
  String? firstName;
  String? lastName;
  String? email;
  String? phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['email'] = email;
    map['phone'] = phone;
    return map;
  }

}