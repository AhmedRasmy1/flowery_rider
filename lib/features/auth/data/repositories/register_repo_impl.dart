import 'dart:io';

import 'package:flowery_rider/features/auth/data/data_sources/register_online_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/api_result.dart';
import '../../domain/entities/register_entities/register_entity.dart';
import '../../domain/repositories/register_repo.dart';
import '../models/request/register_request_dto.dart';

@Injectable(as: RegisterRepo)
class RegisterRepoImpl implements RegisterRepo {
  RegisterOnlineDataSource registerOnlineDataSource;

  RegisterRepoImpl(this.registerOnlineDataSource);

  @override
  Future<Result<RegisterEntity?>> signUp(
    String country,
    String firstName,
    String lastName,
    String vehicleType,
    String vehicleNumber,
    File vehicleLicense,
    String nid,
    File nidImg,
    String email,
    String password,
    String rePassword,
    String gender,
    String phone,
  ) {
    return registerOnlineDataSource.signUp(RegisterRequestDto(
        country: country,
        firstName: firstName,
        lastName: lastName,
        vehicleType: vehicleType,
        vehicleNumber: vehicleNumber,
        vehicleLicense: vehicleLicense,
        nid: nid,
        nidImg: nidImg,
        email: email,
        password: password,
        rePassword: rePassword,
        gender: gender,
        phone: phone));
  }
}
