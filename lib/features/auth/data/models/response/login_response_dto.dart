import '../../../domain/entities/login_entity.dart';

class LoginResponseDto {
  LoginResponseDto({
    this.message,
    this.token,
  });

  LoginResponseDto.fromJson(dynamic json) {
    message = json['message'];
    token = json['token'];
  }

  String? message;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['token'] = token;
    return map;
  }

  LoginEntitie toLoginEntities() {
    return LoginEntitie(
      message: message,
      token: token,
    );
  }
}
