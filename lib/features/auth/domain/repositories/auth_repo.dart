import 'dart:io';

import 'package:flowery_rider/features/auth/data/models/requests/register_request_dto.dart';

import '../../../../core/common/api_result.dart';
import '../entities/register_entity.dart';

abstract class AuthRepo {
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
      String phone,);
}
