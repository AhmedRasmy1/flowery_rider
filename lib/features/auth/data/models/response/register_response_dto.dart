

import 'package:flowery_rider/features/auth/data/models/response/driver_dto.dart';
import '../../../domain/entities/register_entities/driver_entity_for_register.dart';
import '../../../domain/entities/register_entities/register_entity.dart';

class RegisterResponseDto {
  RegisterResponseDto({this.message, this.driver, this.token,});

  RegisterResponseDto.fromJson(dynamic json) {
    message = json['message'];
    driver = json['driver'] != null ? DriverDto.fromJson(json['driver']) : null;
    token = json['token'];
  }
  String? message;
  DriverDto? driver;
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
    DriverEntityForRegister? driverEntity;
    driverEntity=driver?.toDriverEntity();

    return RegisterEntity(
        message: message,
        token: token,
        driver: driverEntity
    );
  }
}