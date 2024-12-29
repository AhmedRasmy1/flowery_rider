import '../entities/forget_password_entity.dart';
import '../entities/verify_password_entity.dart';
import '../../../../core/common/api_result.dart';
import '../entities/reset_password_entity.dart';

abstract class ForgetPasswordRepo {

  Future<Result<ForgetPasswordEntity?>> forgetPassword(String email);
  Future<Result<VerifyPasswordEntity?>> verifyPassword(String otp);
  Future<Result<ResetPasswordEntity?>> resetPassword(
      String email, String newPassword);

}
