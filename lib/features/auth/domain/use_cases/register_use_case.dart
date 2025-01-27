import 'dart:io';
import '../repositories/register_repo.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/common/api_result.dart';
import '../entities/register_entities/register_entity.dart';

@injectable
class RegisterUseCase {
  RegisterRepo registerRepo;

  RegisterUseCase(this.registerRepo);

  Future<Result<RegisterEntity?>> register(
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
    return registerRepo.signUp(
        country,
        firstName,
        lastName,
        vehicleType,
        vehicleNumber,
        vehicleLicense,
        nid,
        nidImg,
        email,
        password,
        rePassword,
        gender,
        phone);
  }
}
