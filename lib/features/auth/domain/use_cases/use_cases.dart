import 'dart:io';
import 'package:injectable/injectable.dart';
import '../../../../core/common/api_result.dart';
import '../entities/register_entity.dart';
import '../repositories/auth_repo.dart';

@injectable
class RegisterUseCase {
  AuthRepo authRepo;

  RegisterUseCase(this.authRepo);

  Future<Result<RegisterEntity>> register(
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
    return authRepo.signUp(
        country,
        firstName,
        lastName,
        vehicleType,
        vehicleNumber,
        vehicleLicense,
        NID,
        NIDImg,
        email,
        password,
        rePassword,
        gender,
        phone);
  }
}
