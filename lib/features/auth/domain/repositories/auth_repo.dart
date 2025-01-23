
import 'package:dio/dio.dart';

import '../../../../core/common/api_result.dart';
import '../entities/login_entity.dart';
import '../entities/logout_entity.dart';
import '../entities/register_entity.dart';

abstract class AuthRepo {


  Future<Result<LoginEntitie>> login(String name, String password);
  Future<Result<LogoutEntity>> logout(String token);
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
      String phone,);
}
