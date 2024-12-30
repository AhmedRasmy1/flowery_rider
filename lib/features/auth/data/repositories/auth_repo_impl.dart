import 'dart:io';

import 'package:flowery_rider/core/common/api_result.dart';
import 'package:flowery_rider/features/auth/data/data_sources/auth_online_data_sources.dart';

import 'package:flowery_rider/features/auth/data/models/requests/register_request_dto.dart';

import 'package:flowery_rider/features/auth/domain/entities/register_entity.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/auth_repo.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl extends AuthRepo {
  AuthOnlineDataSource onLineDataSource;

  AuthRepoImpl(
    this.onLineDataSource,
  );

  @override
  Future<Result<RegisterEntity>> signUp(
    String country,
    String firstName,
    String lastName,
    String vehicleType,
    String vehicleNumber,
    File vehicleLicense,
    String NID,
    File NIDImg,
    String email,
    String password,
    String rePassword,
    String gender,
    String phone,
  ) {
    return onLineDataSource.signUp(RegisterRequestDto(
        country: country,
        firstName: firstName,
        lastName: lastName,
        vehicleType: vehicleType,
        vehicleNumber: vehicleNumber,
        vehicleLicense: vehicleLicense,
        NID: NID,
        NIDImg: NIDImg,
        email: email,
        password: password,
        rePassword: rePassword,
        gender: gender,
        phone: phone));
  }
}
