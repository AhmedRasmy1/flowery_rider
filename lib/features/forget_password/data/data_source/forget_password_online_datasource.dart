import '../../../../core/common/api_result.dart';
import '../../domain/entities/forget_password_entity.dart';
import '../../domain/entities/reset_password_entity.dart';
import '../../domain/entities/verify_password_entity.dart';
import '../model/forget_password_request/reset_password_request.dart';

abstract class ForgetPasswordOnlineDatasource {


  Future<Result<ForgetPasswordEntity?>> forgetPassword(String email);
  Future<Result<VerifyPasswordEntity?>> verifyPassword(String otp);
  Future<Result<ResetPasswordEntity?>> resetPassword(
      ResetPasswordRequest resetPasswordRequest);

}
