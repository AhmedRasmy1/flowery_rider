import '../../../domain/entities/logout_entity.dart';

class LogoutResponseDto {
  LogoutResponseDto({
    this.message,
  });

  LogoutResponseDto.fromJson(dynamic json) {
    message = json['message'];
  }

  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    return map;
  }

  LogoutEntity toLogoutEntity() {
    return LogoutEntity(message: message);
  }
}
