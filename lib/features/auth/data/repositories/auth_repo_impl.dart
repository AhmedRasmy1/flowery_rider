import 'package:dio/dio.dart';
import '../../domain/entities/register_entities/register_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/api_result.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/entities/logout_entity.dart';
import '../../domain/repositories/auth_repo.dart';
import '../data_sources/auth_online_data_source.dart';
import '../models/request/login_model_dto.dart';
import '../models/request/register_request_dto.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  AuthOnLineDataSource onLineDataSource;

  AuthRepoImpl(
    this.onLineDataSource,
  );

  @override
  Future<Result<LoginEntitie>> login(String email, String password) {
    return onLineDataSource.login(LoginModelDto(
      email: email,
      password: password,
    ));
  }

  @override
  Future<Result<LogoutEntity>> logout(String token) {
    return onLineDataSource.logout(token);
  }

  @override
  Future<Result<RegisterEntity>> signUp(
    String country,
    String firstName,
    String lastName,
    String vehicleType,
    String vehicleNumber,
    MultipartFile vehicleLicense,
    String NID,
    MultipartFile NIDImg,
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
        vehicleLicense: vehicleLicense as dynamic,
        nid: NID,
        nidImg: NIDImg as dynamic,
        email: email,
        password: password,
        rePassword: rePassword,
        gender: gender,
        phone: phone));
  }
}
