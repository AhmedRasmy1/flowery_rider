import 'dart:io';

import '../../../../core/common/api_result.dart';
import '../entities/register_entities/register_entity.dart';

abstract class RegisterRepo {
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
  );
}
