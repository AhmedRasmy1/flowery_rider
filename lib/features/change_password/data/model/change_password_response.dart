import '../../domain/entities/change_password_entity.dart';

/// message : "success"
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiNjczMzdhNmU4NWE1MzczNDI0NGQ1ZGYyIiwicm9sZSI6InVzZXIiLCJpYXQiOjE3MzI2NDc3NTV9.YTGy7Uhw8i6G5c4baMbSdxoblGOuXxT9Nw6_5Y0Wxsc"

class ChangePasswordResponse {
  ChangePasswordResponse({this.message, this.token, this.error});

  ChangePasswordResponse.fromJson(dynamic json) {
    message = json['message'];
    token = json['token'];
    error = json['error'];
  }
  String? message;
  String? token;
  String? error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['token'] = token;
    map['error'] = error;
    return map;
  }

  ChangePasswordEntity toChangePasswordEntity() {
    return ChangePasswordEntity(message: message, token: token, error: error);
  }
}
