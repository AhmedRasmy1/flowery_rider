class ChangePasswordRequest {
  ChangePasswordRequest({
    this.password,
    this.newPassword,
  });

  ChangePasswordRequest.fromJson(dynamic json) {
    password = json['password'];
    newPassword = json['newPassword'];
  }
  String? password;
  String? newPassword;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['password'] = password;
    map['newPassword'] = newPassword;
    return map;
  }
}
